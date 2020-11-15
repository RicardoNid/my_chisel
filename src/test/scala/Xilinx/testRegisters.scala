// created 2020/11/14 by RicNid
package Xilinx

import chisel3.iotesters.{Driver, PeekPokeTester}
import org.scalatest._
import scala.util.Random

// sbt standard test for Module Registers
class testRegisters extends FunSuite with DiagrammedAssertions {

  test("testRegisters") {
    Driver(() => new Registers()) {
      c =>
        new PeekPokeTester(c) {
          assert(peek(c.io.dout) == 0) // initial state after reset
          val value = rnd.nextInt(256)
          poke(c.io.din, value)
          poke(c.io.ce, true)
          step(1)
          assert(peek(c.io.dout) == value)

          poke(c.io.din, value / 2)
          poke(c.io.ce, false)
          assert(peek(c.io.dout) == value)
        }
    }
  }
}

