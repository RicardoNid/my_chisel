package CORDIC
import Chisel.Enum
import chisel3._
import chisel3.experimental.FixedPoint
import CORDICutil._
import scala.math.{Pi, abs}

// 在实现各种功能模式之后,应该再通过柯里化,将常用功能重新命名

class CORDIC(mode: String = "rotate", arch: String = "pipelined",
             widthIn: Int = 10, iterations: Int = 20) extends Module {

  // 精度和类型声明
  val widthOut: Int = widthIn + iterations
  val dataInT = FixedPoint(widthIn.W, (widthIn - 2).BP) // 对标Xilinx IP,使用1QN
  val dataPhaseInT = FixedPoint(widthIn.W, (widthIn - 3).BP) // 对标Xilinx IP,使用2QN,范围-Pi~Pi
  val dataOutT = FixedPoint(widthOut.W, (widthOut - 3).BP) // 对标Xilinx IP,使用2QN
  val ZERO = 0.F(widthIn.W, (widthIn - 3).BP)
  val halfPi = (Pi / 2).F(widthIn.W, (widthIn - 3).BP)

  // 根据功能模式,决定旋转采用的参数列表,旋转初始值,旋转逼近方式,并决定各个端口启用状况
  object PortName extends Enumeration {
    val XIN, YIN, PHASEIN, XOUT, YOUT, PHASEOUT = Value
  }

  import PortName._

  val approachingMode = if (List("rotate", "tri", "hypertri").contains(mode)) "R" else "V" // 判断旋转/向量模式
  val axisMode = if (List("rotate", "tri", "translate", "arctan").contains(mode)) "C" else "H" // 判断圆周/双曲坐标

  val PortTable = Map(
    "rotate" -> List(1, 1, 1, 1, 1, 0),
    "translate" -> List(1, 1, 0, 1, 0, 1),
    "tri" -> List(0, 0, 1, 1, 1, 0),
    "arctan" -> List(1, 1, 0, 0, 0, 1),
    "hypertri" -> List(0, 0, 1, 1, 1, 0)
  )

  val io = IO(new Bundle {
    val dataInX = if (PortTable(mode)(XIN.id) == 1) Some(Input(dataInT)) else None
    val dataInY = if (PortTable(mode)(YIN.id) == 1) Some(Input(dataInT)) else None
    val dataInPhase = if (PortTable(mode)(PHASEIN.id) == 1) Some(Input(dataPhaseInT)) else None
    val dataOutX = if (PortTable(mode)(XOUT.id) == 1) Some(Output(dataOutT)) else None
    val dataOutY = if (PortTable(mode)(YOUT.id) == 1) Some(Output(dataOutT)) else None
    val dataOutPhase = if (PortTable(mode)(PHASEOUT.id) == 1) Some(Output(dataOutT)) else None
  })

  // 生成CORDIC计算所需的静态参数
  val coeffcients = for (i <- 0 until iterations) yield {
    if (axisMode == "C") getCartesianPhase(i).F(widthIn.W, (widthIn - 4).BP)
    else getHyperbolicPhase(i).F(widthIn.W, (widthIn - 4).BP)
  }

  // 寄存器组
  val regsX = Reg(Vec(iterations + 1, dataOutT))
  val regsY = Reg(Vec(iterations + 1, dataOutT))
  val regsPhase = Reg(Vec(iterations + 1, dataOutT))

  // 根据模式,决定象限映射方式
  val good :: plus90 :: minus90 :: Nil = Enum(3)
  val plusOrMinus = WireInit(plus90)
  val phase = WireInit(good)
  if (approachingMode == "R") { // 旋转模式下依据theta做相位映射
    plusOrMinus := Mux(io.dataInPhase.get > ZERO, plus90, minus90)
    phase := Mux((io.dataInPhase.get.abs()) < halfPi, good, plusOrMinus)
  } else { // 向量模式下依据x,y做相位映射
    plusOrMinus := Mux(io.dataInY.get > ZERO, minus90, plus90)
    phase := Mux(io.dataInX.get > ZERO, good, plusOrMinus)
  }

  // 根据模式,决定初始值
  val xBeforeMap = io.dataInX.getOrElse(1.0.F(widthIn.W, (widthIn - 3).BP))
  val yBeforeMap = io.dataInY.getOrElse(0.0.F(widthIn.W, (widthIn - 3).BP))
  val phaseBeforeMap = io.dataInPhase.getOrElse(0.0.F(widthIn.W, (widthIn - 3).BP))

  when(phase === good) {
    regsX(0) := xBeforeMap
    regsY(0) := yBeforeMap
    regsPhase(0) := phaseBeforeMap
  }.elsewhen(phase === plus90) {
    regsX(0) := ZERO - yBeforeMap
    regsY(0) := xBeforeMap
    regsPhase(0) := phaseBeforeMap - halfPi
  }.otherwise { // minus90
    regsX(0) := yBeforeMap
    regsY(0) := ZERO - xBeforeMap
    regsPhase(0) := phaseBeforeMap + halfPi
  }

  for (i <- 1 to iterations) {

    // shift位数不能为0
    // 对于双曲线坐标系,shift位数从1开始
    val shiftedX = Wire(dataInT)
    val shiftedY = Wire(dataInT)
    if (axisMode == "C") {
      shiftedX := regsX(i - 1) >> i << 1
      shiftedY := regsY(i - 1) >> i << 1
    }
    else {
      shiftedX := regsX(i - 1) >> i
      shiftedY := regsY(i - 1) >> i
    }

    val counterClockwise = Wire(Bool()) // 决定旋转方向 counterClockwise就是公式中的di
    if (approachingMode == "R")
      counterClockwise := regsPhase(i - 1) > ZERO
    else // approachingMode is "V"
      counterClockwise := regsY(i - 1) < ZERO

    val XCounterClockwise = Wire(Bool()) // 实现公式中的μ
    if (axisMode == "C")
      XCounterClockwise := counterClockwise
    else
      XCounterClockwise := ~counterClockwise

    regsX(i) := Mux(XCounterClockwise, regsX(i - 1) - shiftedY, regsX(i - 1) + shiftedY)
    regsY(i) := Mux(counterClockwise, regsY(i - 1) + shiftedX, regsY(i - 1) - shiftedX)
    regsPhase(i) := Mux(counterClockwise, regsPhase(i - 1) - coeffcients(i - 1), regsPhase(i - 1) + coeffcients(i - 1))
  }

  val complement =
    if (iterations % 2 == 0) 1.356430796413907
    else 1.0715397710356467 // 非收敛模式下的补偿系数

  val scaleComplement = if (axisMode == "C") getCartesianScaleComplement(iterations).F(widthOut.W, (widthOut - 3).BP)
  else (getHyperbolicScaleComplement(iterations) * complement).F(widthOut.W, (widthOut - 3).BP)

  if (!io.dataOutX.equals(None))
    io.dataOutX.get := regsX.last * scaleComplement
  if (!io.dataOutY.equals(None))
    io.dataOutY.get := regsY.last * scaleComplement
  if (!io.dataOutPhase.equals(None))
    io.dataOutPhase.get := regsPhase.last
}