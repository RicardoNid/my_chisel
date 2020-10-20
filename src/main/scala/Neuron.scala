import chisel3._
import chisel3.experimental.FixedPoint
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class Neuron(inputs: Int, activation: FixedPoint => FixedPoint) extends Module {
  val io = IO(new Bundle {
    val in = Input(Vec(inputs, FixedPoint(16.W, 8.BP)))
    val weights = Input(Vec(inputs, FixedPoint(16.W, 8.BP)))
    val out = Output(FixedPoint(16.W, 8.BP))
  })

  io.out := activation(io.in.zip(io.weights).map { case (input, weight) => input * weight }.reduce(_ + _))
}

