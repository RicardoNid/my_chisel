import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import chisel3.experimental.FixedPoint

val dataInT = -2.F(10.W, 8.BP)
val dataOutT = FixedPoint(10.W,8.BP)
