import CNN.ConstantMM
import CNN.WinoUtil._
import breeze.linalg._
import chisel3.iotesters.{Driver, PeekPokeTester}

// 对于常数矩阵乘法模块的随机化测试
object testConstantMM extends App {

  Driver(() => new ConstantMM(B)) {
    c =>
      new PeekPokeTester(c) {
        val arr = DenseMatrix.zeros[Double](4, 4)
        for (i <- 0 until 4; j <- 0 until 4) {
          arr(i, j) = i * 4 + j
          poke(c.io.in(i)(j), i * 4 + j)
        }

        println(arr.toString)

        val matO = B * arr
        println(matO.toString)

        for (i <- 0 until 4; j <- 0 until 4) {
          if (peek(c.io.out(i)(j)) != matO(i, j))
            println("wrong")
        }
      }
  }
}
