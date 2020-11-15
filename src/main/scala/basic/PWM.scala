package basic

import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class PWM extends Module { // 生成PWM调制的三角波信号
  val io = IO(new Bundle { // 输入是隐式的全局时钟和reset
    val sig = Output(UInt(1.W))
  })

  def pwm(cycles: Int, duty: UInt)= {
    val count = RegInit(0.U(unsignedBitLength(cycles).W))
    count := Mux(count === (cycles - 1).U, 0.U, count + 1.U)
    count < duty // return value
  }

  val FREQUENCY = 100000000 // 100MHz global clock
  val MAX = FREQUENCY / 1000

  val countReg = RegInit(0.U(unsignedBitLength(MAX).W))
  val countUpReg = RegInit(true.B)

  // 反复计数时,两边的端点都要踩到
  when(countReg === FREQUENCY.U) {
    countReg := countReg - 1.U
    countUpReg := false.B
  }.elsewhen(countReg === 0.U) {
    countReg := countReg + 1.U
    countUpReg := true.B
  }.elsewhen(countUpReg === true.B) {
    countReg := countReg + 1.U
  }.otherwise {
    countReg := countReg - 1.U
  }

  io.sig := pwm(MAX, (countReg >> 10).asUInt)
}