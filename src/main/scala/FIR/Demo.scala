package FIR

import chisel3._
import chisel3.util.{Counter, _}
import breeze.linalg._
import breeze.signal._
import chisel3.experimental.FixedPoint
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}

import scala.math.{Pi, round, sin}
import scala.util.Random

// 这项设计结合FIR package下的各个module,在板上实现一个input从ROM中查表获取,kernel固定的多通道FIR滤波器
class Demo extends RawModule {

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
  val coeff144 = DenseVector(Array.ofDim[Double](144).map(_ => {
    val value = randGen.nextInt % 100 + 500 // 避开较小的整数和2的幂,避免优化
    if (isPow2(value)) (value + 13).toDouble
    else value.toDouble
  }
  ))

  val romSize = 1024
  val select = Wire(UInt(2.W))
  val BRAMtoDSP = Wire(typeWeight)

  withClockAndReset(io.clkDSP, io.rst) {
    val counter = Counter(4)
    counter.inc()
    select := counter.value

    val regData0 = RegNext(BRAMtoDSP)
    val regData1 = RegNext(regData0)
    val regData2 = RegNext(regData1)

    val firFilter = Module(new FirFilter(coeffs = coeff144, version = "systolic"))
    firFilter.io.in := regData2
    io.out := firFilter.io.out
  }

  withClockAndReset(io.clkBRAM, io.rst) {
    val ROMs = for (i <- 0 until 4) yield {
      sinTable(64, romSize, i * Pi / 2)
    } // 经实验能够被推断为ROM,使用BRAM实现

    val counters = for (i <- 0 until 4) yield {
      Counter(1024)
    }
    val counts = for (i <- 0 until 4) yield {
      counters(i).value
    }
    for (i <- 0 until 4) counters(i).inc()
    val datas = Wire(Vec(4, typeIn))
    for (i <- 0 until 4) datas(i) := ROMs(i)(counts(i))

    BRAMtoDSP := datas(select)
  }
}

object Demo extends App {
  (new ChiselStage).execute(
    Array(
      "--target-dir", outputDir,
      "--output-file", "Demo"),
    Seq(ChiselGeneratorAnnotation(() => new Demo())))
}