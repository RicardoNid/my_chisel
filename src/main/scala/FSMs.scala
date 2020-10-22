import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class SimpleFsm extends Module {
  val io = IO(new Bundle {
    val badEvent = Input(Bool())
    val clear = Input(Bool())
    val ringBell = Output(Bool())
  })

  val green :: orange :: red :: Nil = Enum(3)
  val stateReg = RegInit(green)

  switch(stateReg) {
    is(green) {
      when(io.badEvent) {
        stateReg := orange
      }
    }
    is(orange) {
      when(io.badEvent) {
        stateReg := red
      }.elsewhen(io.clear) {
        stateReg := green
      }
    }
    is(red) {
      when(io.clear) {
        stateReg := green
      }
    }
  }

  io.ringBell := stateReg === red
}
