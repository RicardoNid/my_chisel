package basic

import chisel3.iotesters.{Driver, PeekPokeTester}

object testFixedPointAdder extends App {
  Driver(() => new FixedPointAdder) {
    c =>
      new PeekPokeTester(c) {
        pokeFixedPoint(c.io.a, 1.0)
        pokeFixedPoint(c.io.b, 0.75)
        step(1)
        println(peekFixedPoint(c.io.sum).toString)
      }
  }
}
