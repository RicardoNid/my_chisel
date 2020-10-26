package Xilinx

import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class BRAMGen(wData: Int = 32, wAddr: Int = 10, mode: String = "single") extends Module {
  val io = IO(new Bundle {
    val addr = Input(UInt(wAddr.W))
    val din = Input(UInt(wData.W))
    val dout = Output(UInt(wData.W))
    val ena = Input(Bool())
    val wea = Input(Bool())
  })

  val mem = SyncReadMem(1024, UInt(32.W))

  io.dout := mem.read(io.addr)
  when(io.wea) {
    mem.write(io.addr, io.din)
  }
}
