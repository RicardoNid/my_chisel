package basic

import chisel3._
import chisel3.util._
import breeze.linalg._
import breeze.signal._

class Neuron extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(1.W))
    val out = Output(UInt(1.W))
  })
}