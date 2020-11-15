package basic

import chisel3._
import chisel3.experimental.ChiselEnum
import chisel3.util._

class FSM extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(1.W))
    val out = Output(UInt(1.W))
  })

  object State extends ChiselEnum{
    val S0, S1, S2 = Value
  }
  import State._

  // state registers
  val stateReg = RegInit(S0)

  // next state logic
  switch(stateReg){
    is(S0){
      stateReg := S1
    }
    is(S1){
      stateReg := S2
    }
    is(S2){
      stateReg := S0
    }
  }

  // output logic
  io.out := (stateReg === S2 & io.in === 1.U) // Mealy
  // io.out := (stateReg === S2) // Moore
}