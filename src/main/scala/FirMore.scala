import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

import scala.math.{abs, round, cos, Pi, pow}

class FirMore(length: Int, bitwidth: Int, window: (Int, Int) => Seq[Int]) extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(bitwidth.W))
    val out = Output(UInt((bitwidth * 2 + length - 1).W))
  })

  // 将窗函数生成的参数转换为chisel类型
  val coeffs = window(length, bitwidth).map(_.U)
  // 构造移位寄存器
  // 我高潮了
  val regs = Seq.fill(length)(Wire(UInt(bitwidth.W))).scan(io.in)((prev: UInt, next: UInt) => {
    next := RegNext(prev)
    next
  })
  // 乘法
  val mults = regs.zip(coeffs).map { case (reg: UInt, coeff: UInt) => reg * coeff }
  val result = mults.reduce(_ +& _)

  io.out := result
}
