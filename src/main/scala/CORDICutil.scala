import java.lang.Math._
import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import chisel3.experimental.FixedPoint

object CORDICutil {
  def getCartesianPhase(i: Int) = atan(pow(2.0, -i))

  // 计算不同迭代次数下,
  def getCartesianScaleComplment(iterations: Int):Double = {
    require(iterations >= 1)
    if (iterations == 1)
      cos(getCartesianPhase(0))
    else
      cos(getCartesianPhase(iterations - 1)) * getCartesianScaleComplment(iterations - 1)
  }
}
