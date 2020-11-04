package basic

import chisel3._
import chisel3.util._

class Vector extends Module {
  val io = IO(new Bundle {
    val in = Input(Vec(4, UInt(1.W)))
    val out = Output(Vec(4, UInt(1.W)))
  })

  io.out.zipWithIndex.map { case (bit, index) =>
    if (index % 2 == 0) bit := io.in(index)
    else bit := 0.U
  }
}