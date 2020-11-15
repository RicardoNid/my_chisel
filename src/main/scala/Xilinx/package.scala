import chisel3._
import chisel3.util._
import breeze.linalg._
import breeze.signal._

package object Xilinx {
  val outputDir = "./verilog_output/XilinxBuildingBlocks"

  case class BRAMPort(dataWidth: Int, addrWidth: Int) extends Bundle {
    val clk = Input(Clock())
    val addr = Input(UInt(addrWidth.W))
    val din = Input(UInt(dataWidth.W))
    val en = Input(Bool())
    val wea = Input(Bool())
    val dout = Output(UInt(dataWidth.W))
  }
}
