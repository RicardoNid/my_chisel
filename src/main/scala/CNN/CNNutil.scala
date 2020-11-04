package CNN

import Jama.Matrix
import chisel3._

import scala.math.ceil

object CNNutil {
  val aligned = (s: String) => if (s.length < 6) " " * (6 - s.length) + s else s.take(6)
  val printArray = (A: Matrix) => A.getArray.foreach(row => println(row.map(_.toString).map(aligned).mkString("\t")))

  // 与常数矩阵进行矩阵乘法的电路
  def GEMM(wire: Vec[Vec[SInt]], coeff: Matrix) = {

    // m * p matrix times p * n matrix
    val m = wire.length
    val p = wire(0).length
    val pPrime = coeff.getRowDimension
    val n = coeff.getColumnDimension
    assert(p == pPrime, "matrix shape must match!")
    // result a m * n matrix
    val result = Wire(Vec(m, Vec(n, wire(0)(0).cloneType)))

    result.map(_.map(_ => 0.S))
    for (i <- 0 until m; j <- 0 until n) {
      var point = 0.S
      for (k <- 0 until p) {
        point = point + coeff.getArray()(i)(k).toInt.S * wire(k)(j)
      }
      result(i)(j) := point
    }
    result
  }

}

