package CNN

import breeze.linalg._
import chisel3.iotesters.{Driver, PeekPokeTester}
import org.scalatest._

// 对于常数矩阵乘法模块的随机化测试
class testConstantMM extends FunSuite with DiagrammedAssertions {

  test("CNN.testConstantMM") {
    Driver(() => new ConstantMM(WinoB)) {
      c =>
        new PeekPokeTester(c) {
          val arr = DenseMatrix.zeros[Double](4, 4)
          for (i <- 0 until 4; j <- 0 until 4) {
            arr(i, j) = i * 4 + j
            poke(c.io.in(i)(j), i * 4 + j)
          }
          
          val matO = WinoB * arr

          for (i <- 0 until 4; j <- 0 until 4) {
            assert(peek(c.io.out(i)(j)) == matO(i, j),
              "yours: " + peek(c.io.out(i)(j)).toString + " gold: " + matO(i, j).toString)
          }
        }
    }
  }
}
