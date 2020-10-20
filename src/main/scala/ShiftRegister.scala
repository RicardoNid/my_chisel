// 四位移位寄存器

import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class ShiftRegister(val init: Int = 1) extends Module {
  val io = IO(new Bundle {
    val in = Input(Bool())
    val out = Output(UInt(4.W))
  })

  val state = RegInit(UInt(4.W), init.U) // 声明状态量

  val nextState = (state << 1 | io.in) // 状态转移逻辑
  /*
  val nextState = Wire(UInt(4.W))
  nextState := (state << 1 | io.in)
   */
PriorityMux
  state := nextState // 寄存器组

  io.out := state // 输出逻辑
}
