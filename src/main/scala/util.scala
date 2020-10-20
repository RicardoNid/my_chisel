import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import chisel3.experimental._
import chisel3.internal.firrtl.KnownBinaryPoint

import scala.math.{Pi, abs, cos, pow, round}

object util {
  val TriangularWindow: (Int, Int) => Seq[Int] = (length, bitwidth) => {
    // formula :
    val raw_coeffs = (0 until length).map((x: Int) => 1 - abs((x.toDouble - (length - 1) / 2.0) / ((length - 1) / 2.0)))
    val scaled_coeffs = raw_coeffs.map((x: Double) => round(x * pow(2, bitwidth)).toInt)
    scaled_coeffs
  }

  val HammingWindow: (Int, Int) => Seq[Int] = (length, bitwidth) => {
    val trans_1 = (x: Int) => 0.54 - 0.46 * cos(2 * Pi * x.toDouble / (length - 1))
    val raw_coeffs = (0 until length).map(trans_1)
    val trans_2 = (x: Double) => round(x*pow(2, bitwidth)).toInt
    val scaled_coeffs = raw_coeffs.map((trans_2))
    scaled_coeffs
  }

  // 在这里如果使用if,有何不同?
  // 定点数比较产生的是chisel Bool,if无法使用
  val Step : FixedPoint => FixedPoint = x => Mux(x <= 0.F(8.BP), 0.F(8.BP), 1.F(8.BP))
  val ReLU: FixedPoint => FixedPoint = x => Mux(x <= 0.F(8.BP), 0.F(8.BP), x)
}
