package CNN

import chisel3._
import chisel3.util._
import breeze.linalg._
import breeze.signal._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}

class OptimizedRAM extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(1.W))
    val rst = Input(Bool())
    val out = Output(UInt(1.W))
  })
}

object OptimizedRAM extends App {
  (new ChiselStage).execute(
    Array(
      "--target-dir", outputDir,
      "--output-file", "OptimizedRAM"),
    Seq(ChiselGeneratorAnnotation(() => new OptimizedRAM())))
}