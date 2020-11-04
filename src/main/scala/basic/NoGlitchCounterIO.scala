package basic

import chisel3._
import chisel3.util._

class NoGlitchCounterIO(bitwidth: Int) extends Bundle { // "无毛刺是因为采用了格雷码"
  val en = Input(Bool())
  val out = Output(UInt(bitwidth.W))
}

abstract class NoGlitchCounter(val maxCount: Int) extends Module {
  val bitwidth: Int
  val io = IO(new NoGlitchCounterIO(bitwidth))
}

abstract class AsyncFIFO(depth: Int) extends Module {
  val io = IO(new Bundle {
    // 写入端接口
    val write_clock = Input(Clock())
    val write_enable = Input(Bool())
    val write_data = Input(UInt(32.W))

    // 读取端接口
    val read_clock = Input(Clock())
    val read_enable = Input(Bool())
    val read_data = Output(UInt(32.W))

    val full = Output(Bool())
    val empty = Output(Bool())
  })

  def makeCounter(maxCount: Int): NoGlitchCounter

  assert(isPow2(depth), "AsyncFIFO needs a power-of-two depth!")

  val write_counter = withClock(io.write_clock) {
    val count = makeCounter(depth * 2)
    count.io.en := io.write_enable && !io.full
    count.io.out
  } // 并不是以模块实例化的方式写出,但也接入了模块,chisel的这种灵活性一开始是难以理解的

  val read_counter = withClock(io.read_clock) {
    val count = makeCounter(depth * 2)
    count.io.en := io.read_enable && !io.empty
    count.io.out
  }

  val sync = withClock(io.read_clock) {
    ShiftRegister(write_counter, 2)
  } //
}