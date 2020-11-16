import breeze.linalg.DenseMatrix
import chisel3._

package object CNN {

  val outputDir = "./verilog_output/CNN"

  val aligned = (s: String) => if (s.length < 6) " " * (6 - s.length) + s else s.take(6)

  // 与常数矩阵进行矩阵乘法的电路
  def GEMM(wire: Vec[Vec[SInt]], coeff: DenseMatrix[Double]) = {

    // m * p matrix times p * n matrix
    val m = wire.length
    val p = wire(0).length
    val pPrime = coeff.rows
    val n = coeff.cols
    assert(p == pPrime, "matrix shape must match!")
    // result a m * n matrix
    val result = Wire(Vec(m, Vec(n, wire(0)(0).cloneType)))

    result.map(_.map(_ => 0.S))
    for (i <- 0 until m; j <- 0 until n) {
      var point = 0.S
      for (k <- 0 until p) {
        point = point + coeff(i, k).toInt.S * wire(k)(j)
      }
      result(i)(j) := point
    }
    result
  }

  val WinoG = DenseMatrix(
    (1.0, 0.0, 0.0),
    (0.5, 0.5, 0.5),
    (0.5, -0.5, 0.5),
    (0.0, 0.0, 1.0)
  )

  val WinoB = DenseMatrix(
    (1.0, 0.0, 0.0, 0.0),
    (0.0, 1.0, -1.0, 1.0),
    (-1.0, 1.0, 1.0, 0.0),
    (0.0, 0.0, 0.0, -1.0),
  )

  val WinoA = DenseMatrix(
    (1.0, 1.0, 1.0, 0.0),
    (0.0, 1.0, -1.0, -1.0)
  ).t

}
