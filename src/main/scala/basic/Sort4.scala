package basic

import chisel3._
import chisel3.util._

class Sort4 extends Module {
  val io = IO(new Bundle {
    val in = Input(Vec(4, UInt(16.W)))
    val out = Output(Vec(4, UInt(16.W)))
  })

  def Sort2(x: UInt, y: UInt, sorted: Vec[UInt]) = {
    when(x < y) {
      sorted(0) := x
      sorted(1) := y
    }.otherwise {
      sorted(1) := x
      sorted(0) := y
    }
  }

  val row10 = Wire(Vec(2, UInt(16.W)))
  val row11 = Wire(Vec(2, UInt(16.W)))
  val row20 = Wire(Vec(2, UInt(16.W)))
  val row21 = Wire(Vec(2, UInt(16.W)))
  val row30 = Wire(Vec(2, UInt(16.W)))
  val row31 = Wire(Vec(2, UInt(16.W)))

  Sort2(io.in(0), io.in(1), row10)
  Sort2(io.in(2), io.in(3), row11)

  Sort2(row10(0), row11(1), row20)
  Sort2(row10(1), row11(0), row21)

  Sort2(row20(0), row21(0), row30)
  Sort2(row20(1), row21(1), row31)

  io.out(0) := row30(0)
  io.out(1) := row30(1)
  io.out(2) := row31(0)
  io.out(3) := row31(1)
}

// 使用查表方式实现SortN?