package CNN

import CNNutil._

import chisel3._
import chisel3.util._

// 1.让电路产生相应的地址
// 2.调度器?

class Buffer2PE extends Module {
  val io = IO(new Bundle {
    // it is always ready
    val dataFromBuffer = Input(Vec((Pox * Poy), UInt(8.W)))
    val addrToBuffer = Output(Vec((Pox * Poy), UInt(8.W)))
    val dataToPE = Output(Vec(Pox * Poy, UInt(8.W)))
  })

  val PERegs = Reg(io.dataToPE.cloneType)



  io.dataToPE := PERegs
}