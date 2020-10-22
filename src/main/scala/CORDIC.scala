import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import chisel3.experimental.FixedPoint

// 在实现各种功能模式之后,应该再通过柯里化,将常用功能重新命名

class CORDIC(mode: String = "rotate", arch: String = "pipelined",
             widthIn: Int = 10,  iterations: Int = 20, widthPhase: Int = 30) extends Module {

  val widthOut: Int = widthIn + iterations

  val dataInT = FixedPoint(widthIn.W, (widthIn - 3).BP) // range: [-2, 2)
  val dataInPhaseT = FixedPoint(widthPhase.W, (widthPhase - 4).BP) // range[-Pi, Pi]
  val dataOutT = FixedPoint(widthOut.W, (widthOut - 3).BP) // range: [-2, 2)

  val ZERO = 0.F(widthPhase.W, (widthPhase - 4).BP)

  val io = IO(new Bundle {
    val dataInX = if(mode == "rotate") Some (Input(dataInT)) else if (mode == "tri") None else None
    val dataInY = if(mode == "rotate") Some (Input(dataInT)) else if (mode == "tri") None else None
    val dataInPhase = Input(dataInPhaseT)
    val dataOutX = Output(dataOutT)
    val dataOutY = Output(dataOutT)
  })

  // 生成CORDIC计算所需的静态参数
  val coeffcients = for (i <- 0 until iterations) yield {
    CORDICutil.getCartesianPhase(i).F(widthPhase.W, (widthPhase - 4).BP)
  }

  // 寄存器组
  // todo: firrtl会不会进行精度优化?
  val regsX = Reg(Vec(iterations + 1, dataOutT))
  val regsY = Reg(Vec(iterations + 1, dataOutT))
  val regsPhase = Reg(Vec(iterations + 1, dataInPhaseT))

  regsX(0) := io.dataInX.getOrElse(1.0.F(widthIn.W, (widthIn - 3).BP))
  regsY(0) := io.dataInY.getOrElse(0.0.F(widthIn.W, (widthIn - 3).BP))
  regsPhase(0) := io.dataInPhase

  for (i <- 1 to iterations) {

    // shift位数不能为0
    val shiftedX = Wire(dataInT)
    shiftedX := regsX(i - 1) >> i << 1
    val shiftedY = Wire(dataInT)
    shiftedY := regsY(i - 1) >> i << 1
    val overZero = regsPhase(i - 1) > ZERO

    regsX(i) := Mux(overZero, regsX(i - 1) - shiftedY, regsX(i - 1) + shiftedY)
    regsY(i) := Mux(overZero, regsY(i - 1) + shiftedX, regsY(i - 1) - shiftedX)
    regsPhase(i) := Mux(overZero, regsPhase(i - 1) - coeffcients(i - 1), regsPhase(i - 1) + coeffcients(i - 1))
  }

  io.dataOutX := regsX.last * CORDICutil.getCartesianScaleComplment(iterations).F(widthOut.W, (widthOut - 3).BP)
  io.dataOutY := regsY.last * CORDICutil.getCartesianScaleComplment(iterations).F(widthOut.W, (widthOut - 3).BP)
}