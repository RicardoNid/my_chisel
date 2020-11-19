package basic

import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import chisel3.util._

class NestedCounter extends Module {
  val io = IO(new Bundle {
    val iOut = Output(UInt(unsignedBitLength(10).W))
    val jOut = Output(UInt(unsignedBitLength(10).W))
    val kOut = Output(UInt(unsignedBitLength(10).W))
  })

  val (i, fullI) = Counter(true.B, 10)
  val (j, fullJ) = Counter(fullI, 10)
  val (k, fullK) = Counter(fullJ, 10)

  io.iOut := i
  io.jOut := j
  io.kOut := k
}

object NestedCounter extends App {
  (new ChiselStage).execute(
    Array(
      "--target-dir", outputDir,
      "--output-file", "NestedCounter"),
    Seq(ChiselGeneratorAnnotation(() => new NestedCounter())))
}