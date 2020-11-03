package Xilinx

import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

object InterfaceType extends Enumeration {
  val SinglePortRAM = Value
  val SimpleDualPortRAM = Value
}

import InterfaceType._



// 要参数化的部分包括
// 1.端口
// 2.


class BRAMGen(wData: Int = 32,
              wAddr: Int = 10,
              interfaceType: InterfaceType.Value = SinglePortRAM
              // 端口模式
             ) extends Module {
  val io = IO(new Bundle {
    val addr = Input(UInt(unsignedBitLength(wAddr).W))
    val din = Input(UInt(wData.W))
    val dout = Output(UInt(wData.W))
    val ena = Input(Bool())
    val wea = Input(Bool())
  })

  if (interfaceType == SinglePortRAM) {
    val mem = SyncReadMem(wAddr, UInt(wData.W))

    when(io.ena) {
      io.dout := mem.read(io.addr)
      when(io.wea) {
        mem.write(io.addr, io.din)
      }
    }.otherwise(io.dout := 0.U)
  }

}



