import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import chisel3.experimental.FixedPoint

import scala.reflect.macros.blackbox

class FixedPointAdder extends Module {

  val dataInT = FixedPoint(10.W, 8.BP)

  val io = IO(new Bundle {
    val a = Input(dataInT)
    val b = Input(dataInT)
    val sum = Output(FixedPoint(11.W, 8.BP))
  })

  io.sum := io.a - io.b >> 1
}
