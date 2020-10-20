import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class Counter(count: Int) extends Module {
  val io = IO(new Bundle() {
    val en = Input(Bool())
    val out = Output(UInt(log2Ceil(count).W))
  })

  val counter = Counter(count) // counter is not a module
  when(io.en) {
    counter.inc()
  }
  io.out := counter.value
}
