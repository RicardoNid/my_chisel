// created 2020/11/14 by RicNid
package Xilinx

import chisel3.iotesters.{Driver, PeekPokeTester}
import org.scalatest._
import scala.util.Random

// sbt standard test for Module ShiftRegister
class testShiftRegisters extends FunSuite with DiagrammedAssertions {

  val randGen = new Random(42)
  val depth = randGen.nextInt(20)
  val pulse = randGen.nextInt(10)

  test("testShiftRegister") {
    Driver(() => new ShiftRegisters(depth)) {
      c =>
        new PeekPokeTester(c) {
          // todo : implement a test
        }
    }
  }
}

