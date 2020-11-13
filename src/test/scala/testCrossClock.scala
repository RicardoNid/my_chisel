import FIR.CrossClock
import chisel3.iotesters.{Driver, PeekPokeTester}
import org.scalatest._

// 对于常数矩阵乘法模块的随机化测试
class testCrossClock extends FunSuite with DiagrammedAssertions {

  test("testCrossClock") {
    Driver(() => new CrossClock) {
      c =>
        new PeekPokeTester(c) {
          for (i <- 0 until 10) {
            println(peek(c.io.out).toString)
            step(1)
          }
        }
    }
  }
}
