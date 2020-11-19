// created 2020/11/19 by RicNid
package CNN

import chisel3.iotesters.{Driver, PeekPokeTester}
import org.scalatest._
import scala.util.Random

// sbt standard test for Module StupidConv
class testStupidConv extends FunSuite with DiagrammedAssertions {

  val randGen = new Random(42)

  test("testStupidConv") {
    Driver(() => new StupidConv()) {
      c =>
        new PeekPokeTester(c) {
          for (i <- 0 until 10000) {
            if(peek(c.io.done) == 1) println(peek(c.io.out).toString + " " + peek(c.io.done).toString)
            step(1)
          }
        }
    }
  }
}

