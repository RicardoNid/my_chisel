package basic

import chisel3._
import chisel3.util._

class Counter1024 extends Module {
  val io = IO(new Bundle {
    val out = Output(UInt(unsignedBitLength(1024).W))
  })
  val counter = Counter(1024)
  counter.inc()
  io.out := counter.value
}
