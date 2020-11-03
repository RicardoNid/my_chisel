package CNN

import Jama.Matrix

import scala.math.ceil

object CNNutil {
  val aligned = (s: String) => if (s.length < 6) " " * (6 - s.length) + s else s.take(6)
  val printArray = (A: Matrix) => A.getArray.foreach(row => println(row.map(_.toString).map(aligned).mkString("\t")))

}

