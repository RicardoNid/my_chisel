import FIR.FirFilter
import breeze.linalg._
import breeze.signal._
import chisel3.iotesters.{Driver, PeekPokeTester}
import org.scalatest._

import scala.collection.mutable.ListBuffer
import scala.util.Random

// 对于常数矩阵乘法模块的随机化测试
class testFirFilter extends FunSuite with DiagrammedAssertions {

  val randGen = new Random(42)

  val kernel = DenseVector[Double](1.0, 4.0, 7.0, 4.0, 1.0)
  val input = DenseVector(Array.ofDim[Double](20).map(_ => (randGen.nextInt % 100).toDouble))
  val golden = filter
    [DenseVector[Double], DenseVector[Double], DenseVector[Double]](input, kernel)

  println(golden)
  val outputList = ListBuffer[Double]()

  test("testFirFilter") {
    Driver(() => new FirFilter(coeffs = kernel, version = "systolic")) {
      c =>
        new PeekPokeTester(c) {
          for (i <- 0 until input.length) {
            pokeFixedPoint(c.io.in, input(i))
            outputList.append(peekFixedPoint(c.io.out))
            step(1)
          }
          for (i <- 0 until kernel.length * 2) {
            pokeFixedPoint(c.io.in, 0)
            outputList.append(peekFixedPoint(c.io.out))
            step(1)
          }
          println(outputList.mkString(" "))
          val pureOutput = outputList.drop(kernel.length * 2 - 1) // 去掉脉动阵列2*kernel.length-1周期的无效数据
          for (i <- 0 until golden.length) {
            assert(golden(i) == pureOutput(i))
          }
        }
    }
  }
}
