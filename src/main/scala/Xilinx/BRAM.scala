// 设计对标BRAM Generator IP
package Xilinx

import chisel3._
import chisel3.util._
import breeze.linalg._
import breeze.signal._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}

class BRAM(
            portAWidth: Int,
            portADepth: Int,
            portBWidth: Int,
            portBDepth: Int
          ) extends Module {

  val io = IO(new Bundle {
    val portA = BRAMPort(portAWidth, portADepth)
    val portB = BRAMPort(portBWidth, portBDepth)
  })

  val mem = SyncReadMem(portADepth, UInt(portAWidth.W)) // 使用Mem和Reg(Vec)生成的verilog代码差别很大

  // todo : 解决双端口写数据冲突
  withClock(io.portA.clk) {
    when(io.portA.wea) {
      mem.write(io.portA.addr, io.portA.din)
    }
    io.portA.dout := mem.read(io.portA.addr)
  }
  withClock(io.portB.clk) {
    when(io.portB.wea) {
      mem.write(io.portB.addr, io.portB.din)
    }
    io.portB.dout := mem.read(io.portB.addr)
  }
}

object BRAM {
  def main(args: Array[String]): Unit = {
    (new ChiselStage).execute(
      Array(
        "--target-dir", outputDir,
        "--output-file", "BRAM"),
      Seq(ChiselGeneratorAnnotation(() => new BRAM(16, 2048, 16, 2048))))
  }
}