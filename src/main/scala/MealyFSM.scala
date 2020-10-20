import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

// 只有一位输入的Mealy状态机
case class MealyFSMParams(
                           nStates: Int, // number of states
                           s0: Int, // initial state
                           stateTransition: (Int, Boolean) => Int, // function describing state transition logic
                           output: (Int, Boolean) => Int // function describing output logic
                         ) {
  require(nStates >= 0)
  require(s0 < nStates && s0 >= 0)
}

class MealyFSM(val params: MealyFSMParams) extends Module {
  val io = IO(new Bundle {
    val in = Input(Bool())
    val out = Output(UInt())
  })

  val state = RegInit(UInt(), params.s0.U)

  io.out := 0.U
  for (i <- 0 until params.nStates) {
    when(state === i.U) {
      when(io.in) {
        state := params.stateTransition(i, true).U
        io.out := params.output(i, true).U
      }.otherwise {
        state := params.stateTransition(i, false).U
        io.out := params.output(i, false).U
      }
    }
  }
}