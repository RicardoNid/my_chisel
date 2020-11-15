package basic

import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class MyRoutingArbiter(numChannels: Int) extends Module {
  val io = IO(new Bundle {
    val in = Vec(numChannels, Flipped(Decoupled(UInt(8.W))))
    val out = Decoupled(UInt(8.W))
  })
  // 总的来说,map是"映射",此处起到的作用是"提取"和"转换"
  io.out.valid := io.in.map(_.valid).reduce(_ || _)
  val channel = PriorityMux(io.in.map(_.valid).zipWithIndex.map { case (valid, index) => (valid, index.U) })
  io.out.bits := io.in(channel).bits
  io.in.map(_.ready).zipWithIndex.foreach {
    case(ready, index) => ready := io.out.ready && channel === index.U}
}