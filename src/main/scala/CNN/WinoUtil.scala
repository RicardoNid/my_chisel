package CNN

import Jama.Matrix
import breeze.linalg._

object WinoUtil {

  val G = DenseMatrix(
    (1.0, 0.0, 0.0),
    (0.5, 0.5, 0.5),
    (0.5, -0.5, 0.5),
    (0.0, 0.0, 1.0)
  )

  val B = DenseMatrix(
    (1.0,0.0,0.0,0.0),
    (0.0,1.0,-1.0,1.0),
    (-1.0,1.0,1.0,0.0),
    (0.0,0.0,0.0,-1.0),
  )

  val A = DenseMatrix(
    (1.0, 1.0, 1.0, 0.0),
    (0.0, 1.0, -1.0, -1.0)
  ).t
}
