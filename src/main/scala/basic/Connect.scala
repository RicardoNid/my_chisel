package basic

import chisel3._
import chisel3.util._

class Connect extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(1.W))
    val b = Input(UInt(1.W))
    val c = Input(UInt(1.W))
    val cat = Output(UInt(1.W))
    val mux = Output(UInt(1.W))
    val add = Output(UInt(1.W))
    val constant1 = Output(UInt(1.W))
    val constant2 = Output(UInt(1.W))
    val constant3 = Output(UInt(1.W))
  })

  io.cat := Cat(io.a, io.b)
  io.mux := Mux(io.c.asBool(), io.a, io.b)
  io.add := io.a + io.b

  io.constant1 := 2.U - 1.U

  val constant = 3.U - 2.U
  io.constant2 := constant

  val another_constant = 4 - 3
  io.constant3 := another_constant.U

}