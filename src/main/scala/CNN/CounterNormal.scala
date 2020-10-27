package CNN

import chisel3._
import chisel3.util._

class CounterNormal extends Module {
  val io = IO(new Bundle {
    val count = Output(UInt(unsignedBitLength(100 - 1).W))
  })

  val countRegs = RegInit(0.U(unsignedBitLength(100 - 1).W))
  countRegs := countRegs + 1.U
  io.count := countRegs
}