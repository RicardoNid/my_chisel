package basic

import chisel3.iotesters.{Driver, PeekPokeTester}

object testSort4 extends App {
  Driver(() => new Sort4) {
    c =>
      new PeekPokeTester(c) {
        poke(c.io.in(0), 4)
        poke(c.io.in(1), 15)
        poke(c.io.in(2), 6)
        poke(c.io.in(3), 7)

        for (i <- 0 until 4) {
          println(peek(c.io.out(i)).toString)
        }
      }
  }
}
