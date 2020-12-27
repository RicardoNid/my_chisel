// created 2020/11/21 by RicNid
package FTN

import chisel3.iotesters.{Driver, PeekPokeTester}
import org.scalatest._
import scala.util.Random

// sbt standard test for Module InterleaveRAM
class testInterleaveRAM extends FunSuite with DiagrammedAssertions {

  val randGen = new Random(42)

  test("testInterleaveRAM") {
    Driver(() => new InterleaveRAM(8, 64, 32)) {
      c =>
        new PeekPokeTester(c) {

        }
    }
  }
}

