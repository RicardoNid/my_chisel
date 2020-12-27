import chisel3._
import chisel3.util._
import breeze.linalg._
import breeze.signal._

package object Xilinx {
  val outputDir = "./verilog_output/XilinxBuildingBlocks"

  case class BRAMPort(bitWidth: Int, dataWidth: Int, addrDepth: Int) extends Bundle {
    val clk = Input(Clock())
    val addr = Input(UInt(unsignedBitLength(addrDepth).W))
    val din = Input(Vec(dataWidth, UInt(bitWidth.W)))
    val en = Input(Bool())
    val wea = Input(Bool())
    val dout = Output(Vec(dataWidth, UInt(bitWidth.W)))
  }

}
