package basic

import chisel3._
import chisel3.util._

class MultiClock extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(10.W))
    val alternateReset = Input(Bool())
    val alternateClock = Input(Clock()) // attention!
    val outImplicit = Output(UInt())
    val outAlternateReset = Output(UInt())
    val outAlternateClock = Output(UInt())
    val outAlternateBoth = Output(UInt())
  })

  val imp = RegInit(0.U(10.W))
  imp := io.in
  io.outImplicit := imp

  withReset(io.alternateReset) {
    // everything in this scope with have alternateReset as the reset
    val altRst = RegInit(0.U(10.W))
    altRst := io.in
    io.outAlternateReset := altRst
  }

  withClock(io.alternateClock) {
    val altClk = RegInit(0.U(10.W))
    altClk := io.in
    io.outAlternateClock := altClk
  }

  withClockAndReset(io.alternateClock, io.alternateReset) {
    val alt = RegInit(0.U(10.W))
    alt := io.in
    io.outAlternateBoth := alt
  }
}

