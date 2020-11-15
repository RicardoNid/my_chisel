package FIR

import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import chisel3.util._

import scala.math.{Pi, round, sin}

class CrossClock extends Module {
  val io = IO(new Bundle {
    val clk1 = Input(Clock())
    val clk2 = Input(Clock())
    val clk3 = Input(Clock())
    val out = Output(SInt(8.W))
  })

  def sinTable(amp: Double, n: Int, phase: Double): Vec[SInt] = {
    val times = Range(0, n, 1).map(i => (i * 2 * Pi) / (n.toDouble - 1) - Pi + phase)
    val inits = times.map(t => round(amp * sin(t))).map(_.S(8.W))
    VecInit(inits)
  }

  val counter = Counter(3)
  counter.inc()
  val count = counter.value

  val data1 = Wire(SInt(8.W))
  val data2 = Wire(SInt(8.W))
  val data3 = Wire(SInt(8.W))

  when(count === 0.U) {
    io.out := data1
  }.elsewhen(count === 1.U) {
    io.out := data2
  }.otherwise {
    io.out := data3
  }

  val romSize = 1024

  withClock(io.clk1) {
    val BRAM1 = sinTable(64, romSize, Pi / 4)
    val counter1 = Counter(1024)
    counter1.inc()
    val count1 = counter1.value
    data1 := BRAM1(count1)
  }
  withClock(io.clk2) {
    val BRAM2 = sinTable(64, romSize, Pi / 2)
    val counter2 = Counter(1024)
    counter2.inc()
    val count2 = counter2.value
    data2 := BRAM2(count2)
  }
  withClock(io.clk3) {
    val BRAM3 = sinTable(64, romSize, 3 * Pi / 4)
    val counter3 = Counter(1024)
    counter3.inc()
    val count3 = counter3.value
    data3 := BRAM3(count3)
  }
}

object CrossClock {
    val outputFile = "CrossClock"
  (new ChiselStage).execute(
    Array(
      "--output-file", outputFile,
      "--target-dir", outputDir
    ),
    Seq(ChiselGeneratorAnnotation(() => new CrossClock)))
}
