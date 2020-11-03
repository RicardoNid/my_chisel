package CNN

import chisel3._
import chisel3.util._

class PE(p: Int, w: Int, transform:String = "None") extends Module {
  val io = IO(new Bundle {
    val in = Input(Vec(p, UInt(w.W)))
    val weight = Input(Vec(p, UInt(w.W)))
    val out = Output(Vec(p, UInt(w.W)))
  })

  val productRegs = Reg(io.out.cloneType)
  productRegs := io.in.zip(io.weight).map { case (x, y) => x * y }

  io.out := productRegs
}