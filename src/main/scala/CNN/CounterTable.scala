package CNN

import chisel3._
import chisel3.util._

class CounterTable extends Module {
  val io = IO(new Bundle {
    val count = Output(UInt(unsignedBitLength(100 - 1).W))
  })

  val table = Array.range(0, 100)
  val countRegs = RegInit(0.U(unsignedBitLength(100 - 1).W))
  val outputRegs = Reg(io.count.cloneType)
  countRegs := countRegs + 1.U
  io.count := outputRegs
}