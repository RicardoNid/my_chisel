package basic

import chisel3.iotesters.{Driver, PeekPokeTester}
import org.scalatest.{DiagrammedAssertions, FunSuite}

class testCounter1024 extends FunSuite with DiagrammedAssertions {
  test("testCounter1024") {
    Driver(() => new Counter1024) {
      c =>
        new PeekPokeTester(c) {
          for (i <- 0 until 2048) {
            assert(peek(c.io.out) == i % 1024)
            step(1)
          }
        }
    }
  }
}


