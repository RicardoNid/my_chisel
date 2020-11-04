import CNN.CNNutil.printArray
import CNN.WinoUtil.B
import CNN.ConstantMM
import Jama.Matrix
import chisel3.iotesters.{Driver, PeekPokeTester}

// 对于常数矩阵乘法模块的随机化测试
object testConstantMM extends App {

  Driver(() => new ConstantMM(B)) {
    c =>
      new PeekPokeTester(c) {
        val arr = Array.ofDim[Double](4, 4)
        for (i <- 0 until 4; j <- 0 until 4) {
          poke(c.io.in(i)(j), i * 4 + j)
          arr(i)(j) = i * 4 + j
        }

        val mat = new Matrix(arr)
        val matO = B times mat

        for (i <- 0 until 4; j <- 0 until 4) {
          if (peek(c.io.out(i)(j)) != matO.getArray()(i)(j))
            println("wrong")
        }
      }
  }
}
