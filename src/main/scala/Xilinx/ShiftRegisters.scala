package Xilinx

import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}

class ShiftRegisters(depth:Int) extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(1.W))
    val ce = Input(Bool())
    val out = Output(UInt(1.W))
  })

  io.out := chisel3.util.ShiftRegister(io.in, depth, io.ce)

}

object ShiftRegisters extends App {
  (new ChiselStage).execute(
    Array(
      "--target-dir", outputDir,
      "--output-file", "ShiftRegisters"),
    Seq(ChiselGeneratorAnnotation(() => new ShiftRegisters(10))))
}