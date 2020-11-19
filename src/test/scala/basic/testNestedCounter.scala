// created 2020/11/19 by RicNid
package basic

import chisel3.iotesters.{Driver, PeekPokeTester}
import org.scalatest._
import scala.util.Random

// sbt standard test for Module NestedCounter
class testNestedCounter extends FunSuite with DiagrammedAssertions {

  val randGen = new Random(42)

  test("testNestedCounter") {
    Driver(() => new NestedCounter()) {
      c =>
        new PeekPokeTester(c) {
          for (i <- 0 until 1000) {
            step(1)
            println(peek(c.io.iOut).toString + " " +
              peek(c.io.jOut).toString + " " +
              peek(c.io.kOut).toString)
          }
        }
    }
  }
}

