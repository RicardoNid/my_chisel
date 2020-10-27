import CNN.CounterNormal
import CORDIC.CORDIC
import FIR.FirFilter
import Xilinx.BRAMGen
import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}

import scala.math.Pi

// 构建更好的task

object verilog extends App {
  (new ChiselStage).execute(Array("--target-dir", "./verilog_output"),
    Seq(ChiselGeneratorAnnotation(() => new CounterNormal)))
}

object verilogText extends App {
  val verilogString = (new chisel3.stage.ChiselStage).emitVerilog(new CounterNormal)
  println(verilogString)
}

object help extends App {
  (new ChiselStage).execute(Array("--help"),
    Seq(ChiselGeneratorAnnotation(() => new CORDIC())))
}
