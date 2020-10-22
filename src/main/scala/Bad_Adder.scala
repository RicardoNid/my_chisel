import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class BadAdder extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(8.W))
    val b = Input(UInt(8.W))
    val cin = Output(UInt(1.W))
    val sum = Output(UInt(8.W))
  })

  val whole = io.a +& io.b
  io.cin := whole(8)
  io.sum := whole(7,0)
}
