package FTN

import chisel3._
import chisel3.util._
import breeze.linalg._
import breeze.signal._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import common.util.RAMPort
// 使用双口BRAM实现交织
class InterleaveRAM(bitWidth: Int, sizeRd: Int, sizeWr: Int) extends Module {
  val io = IO(new Bundle {
    val portA = RAMPort(bitWidth = bitWidth, dataWidth = sizeRd, addrDepth = sizeWr, mode = "R")
    val portB = RAMPort(bitWidth = bitWidth, dataWidth = sizeWr, addrDepth = sizeRd, mode = "W")
  })

  val mem = SyncReadMem(sizeRd * sizeWr, UInt(bitWidth.W))

  withClock(io.portA.clk) {
    Range(0, sizeRd).foreach(i => {
      val index = io.portA.addr * sizeRd.U + i.U
      io.portA.dout.get(i) := mem.read(index)
    })
  }

  withClock(io.portB.clk) {
    when(io.portB.wea) {
      Range(0, sizeWr).foreach(i => {
        val index = io.portB.addr * sizeWr.U + i.U
        mem.write(index + i.U, io.portB.din.get(i))
      })
    }
  }
}

object InterleaveRAM extends App {
  (new ChiselStage).execute(
    Array(
      "--target-dir", outputDir,
      "--output-file", "InterleaveRam"),
    Seq(ChiselGeneratorAnnotation(() => new InterleaveRAM(8, 64, 32))))
}