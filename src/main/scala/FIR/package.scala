import chisel3.{Bool, Bundle, Clock, Input, Mux, Output, UInt}
import chisel3.experimental.FixedPoint

import scala.math.{Pi, abs, cos, pow, round}

package object FIR {
  //  val outputDir = "./verilog_output/FIR"
  val outputDir = "E:/LtrProjects/VivadoProjects/ZCU_efficient/ZCU_efficient.srcs/from_chisel/"

  val TriangularWindow: (Int, Int) => Seq[Int] = (length, bitwidth) => {
    // formula :
    val raw_coeffs = (0 until length).map((x: Int) => 1 - abs((x.toDouble - (length - 1) / 2.0) / ((length - 1) / 2.0)))
    val scaled_coeffs = raw_coeffs.map((x: Double) => round(x * pow(2, bitwidth)).toInt)
    scaled_coeffs
  }

  val HammingWindow: (Int, Int) => Seq[Int] = (length, bitwidth) => {
    val trans_1 = (x: Int) => 0.54 - 0.46 * cos(2 * Pi * x.toDouble / (length - 1))
    val raw_coeffs = (0 until length).map(trans_1)
    val trans_2 = (x: Double) => round(x * pow(2, bitwidth)).toInt
    val scaled_coeffs = raw_coeffs.map((trans_2))
    scaled_coeffs
  }
}
