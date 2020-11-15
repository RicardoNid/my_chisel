package Xilinx

import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import chisel3.util._

// infer FDSE
class Registers extends Module {
  val io = IO(new Bundle {
    val din = Input(UInt(8.W))
    val ce = Input(Bool())
    val dout = Output(UInt(8.W))
  })
  // clk & clr are implicit
  val regs = RegEnable(io.din, 0.U, io.ce) // next, init, enable
  io.dout := regs
}

object Registers extends App {
  (new ChiselStage).execute(
    Array(
      "--target-dir", outputDir,
      "--output-file","Registers"),
    Seq(ChiselGeneratorAnnotation(() => new Registers())))
}