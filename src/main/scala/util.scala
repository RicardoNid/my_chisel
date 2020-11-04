import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import chisel3.stage.ChiselStage

object util {
  def getVerilog(dut : => Module): String ={
    (new ChiselStage).emitVerilog(dut)
  }
}
