package CNN

import Jama.Matrix

object WinoUtil {

  val G = new Matrix(Array(
    Array(1, 0, 0),
    Array(0.5, 0.5, 0.5),
    Array(0.5, -0.5, 0.5),
    Array(0, 0, 1)
  ))

  val B = new Matrix(Array(
    Array(1, 0, 0, 0),
    Array(0, 1, -1, 1),
    Array(-1, 1, 1, 0),
    Array(0, 0, 0, -1)
  ))

  val A = new Matrix(Array(
    Array(1, 1, 1, 0),
    Array(0, 1, -1, -1)
  )).transpose
}
