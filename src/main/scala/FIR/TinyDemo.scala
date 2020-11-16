package FIR

import breeze.linalg._
import chisel3._
import chisel3.experimental.FixedPoint
import chisel3.util.{Counter, _}

import scala.math.{Pi, round, sin}
import scala.util.Random

// 这项设计结合FIR package下的各个module,在板上实现一个input从ROM中查表获取,kernel固定的多通道FIR滤波器
// 将原先的设计裁剪,以加快synth & impl速度,方便探索
//
class TinyDemo(romSize: Int = 64, numTap: Int = 8) extends RawModule {

  val bitWidthIn: Int = 27
  val bitWidthWeight: Int = 18
  val bitWidthOut: Int = 48
  val mantissaWidth: Int = 0
  val typeIn = FixedPoint(bitWidthIn.W, mantissaWidth.BP)
  val typeWeight = FixedPoint(bitWidthWeight.W, mantissaWidth.BP)
  val typeOut = FixedPoint(bitWidthOut.W, mantissaWidth.BP)

  def sinTable(amp: Double, n: Int, phase: Double): Vec[FixedPoint] = {
    val times = Range(0, n, 1).map(i => (i * 2 * Pi) / (n.toDouble - 1) - Pi + phase)
    val inits = times.map(t => round(amp * sin(t))).map(_.F(bitWidthIn.W, mantissaWidth.BP))
    VecInit(inits)
  }

  val io = IO(new Bundle {
    val clkDSP = Input(Clock())
    val clkBRAM = Input(Clock())
    val rst = Input(Bool())
    val out = Output(typeOut)
  })

  // 采用的kernel
  val randGen = new Random(42)
  val coeff = DenseVector(Array.ofDim[Double](numTap).map(_ => {
    val value = randGen.nextInt % 100 + 500 // 避开较小的整数和2的幂,避免优化
    if (isPow2(value)) (value + 13).toDouble
    else value.toDouble
  }
  ))

  val select = Wire(UInt(2.W))
  val BRAMtoDSP = Wire(Vec(4, typeIn))

  withClockAndReset(io.clkDSP, io.rst) {
    val counter = Counter(4)
    counter.inc()
    select := counter.value

    // 跨时钟域打拍改善亚稳态
    // 实际上,两个同步时钟之间有必要吗?
    val regData0 = RegNext(BRAMtoDSP)
    val regData1 = RegNext(regData0)

    val regDataBuf = RegNext(regData1(select)) // 隔离组合逻辑

    val firFilter = Module(new FirFilter(coeffs = coeff, version = "systolic"))
    firFilter.io.in := regDataBuf
    io.out := firFilter.io.out
  }

  withClockAndReset(io.clkBRAM, io.rst) {
    val numROM = Range(0, 4) // 使用的ROM组
    val ROMs = numROM.map(i => sinTable(1024, romSize, i * Pi / 2)) // 从sinTable得到ROM
    val counter = Counter(romSize)
    counter.inc()
    val count = counter.value
    //    val datas = WireInit(VecInit(numROM.map(i => ROMs(i)(count(i))))) // 这种语法只会初始化datas,没有将其绑定!
    val datas = Wire(Vec(4, typeIn))
    numROM.foreach(i => datas(i) := ROMs(i)(count))

    // 原始设计 BRAMtoDSP := datas(select)
    val regBuf = RegNext(datas)
    BRAMtoDSP := regBuf
  }
}

object TinyDemo {
  def main(args: Array[String]): Unit = {
    import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
    (new ChiselStage).execute(
      Array(
        "--target-dir", outputDir,
        "--output-file", "TinyDemo"),
      Seq(ChiselGeneratorAnnotation(() => new TinyDemo(1024, 144))))
  }
}

