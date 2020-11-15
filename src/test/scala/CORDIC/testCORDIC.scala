package CORDIC

import chisel3._
import chisel3.iotesters.{Driver, PeekPokeTester}

import scala.math._

object testCORDIC extends App {

  val widthIn = 20
  val iterations = 30
  val widthOut = widthIn + iterations

  println("theta table, 0 implies that the precision is not enough for iterations")
  for (i <- 0 until iterations) {
    assert(getCartesianPhase(i).
      F(widthOut.W, (widthOut - 4).BP) != 0)

    assert(getHyperbolicPhase(i).
      F(widthOut.W, (widthOut - 4).BP) != 0)
  }

  def printBool(bool: chisel3.Bool) = {
    if (bool.litToBoolean) print("1")
    else print("0")
  }

  def printBools(fp: Seq[chisel3.Bool]): Unit = {
    fp.reverse.foreach(printBool(_))
  }

  val piPoints = 60
  val epsilon = 0.001
  val hyperPoints = 60

  // 测试旋转模式
  Driver(() => new CORDIC(widthIn = widthIn, iterations = iterations)) {
    c =>
      new PeekPokeTester(c) {
        for (i <- -piPoints until piPoints + iterations) {
          if (i < piPoints) {
            pokeFixedPoint(c.io.dataInX.get, 1.0)
            pokeFixedPoint(c.io.dataInY.get, 0.0)
            pokeFixedPoint(c.io.dataInPhase.get, i * Pi / piPoints)
          }
          step(1)
          if (i >= -(piPoints - iterations)) {
            val radian = (i - iterations) * Pi / piPoints
            //            val degree = ((i - iterations) * 180.0 / piPoints)
            //            println("degree: " + degree.toString)
            //            println("X: " + peekFixedPoint(c.io.dataOutX.get).toString)
            //            println("Y: " + peekFixedPoint(c.io.dataOutY.get).toString)
            val deltax = peekFixedPoint(c.io.dataOutX.get) - cos(radian)
            val deltay = peekFixedPoint(c.io.dataOutY.get) - sin(radian)
            assert(deltax < epsilon)
            assert(deltay < epsilon)
          }
        }
      }
  }

  // 测试三角(sin/cos)模式
  Driver(() => new CORDIC(mode = "tri", widthIn = widthIn, iterations = iterations)) {
    c =>
      new PeekPokeTester(c) {
        for (i <- -piPoints until piPoints + iterations) {
          if (i < piPoints) {
            pokeFixedPoint(c.io.dataInPhase.get, i * Pi / piPoints)
          }
          step(1)
          if (i >= -(piPoints - iterations)) {
            //            println("degree: " + ((i - iterations) * 180.0 / piPoints).toString)
            //            println("cos(" + ((i - iterations) * 180 / piPoints) + "): " + peekFixedPoint(c.io.dataOutX.get).toString)
            //            println("sin(" + ((i - iterations) * 180 / piPoints) + "): " + peekFixedPoint(c.io.dataOutY.get).toString)
            val radian = (i - iterations) * Pi / piPoints
            val deltaCos = peekFixedPoint(c.io.dataOutX.get) - cos(radian)
            val deltaSin = peekFixedPoint(c.io.dataOutY.get) - sin(radian)
            assert(abs(deltaCos) < epsilon)
            assert(abs(deltaSin) < epsilon)
          }
        }
      }
  }

  // 测试向量(translate)模式
  Driver(() => new CORDIC(mode = "translate", widthIn = widthIn, iterations = iterations)) {
    c =>
      new PeekPokeTester(c) {
        for (i <- -piPoints until piPoints + iterations) {
          if (i < piPoints) {
            pokeFixedPoint(c.io.dataInX.get, cos(i * Pi / piPoints))
            pokeFixedPoint(c.io.dataInY.get, sin(i * Pi / piPoints))
          }
          step(1)
          if (i >= -(piPoints - iterations)) {
            println("degree: " + ((i - iterations) * 180.0 / piPoints).toString)
            println("get length = " + peekFixedPoint(c.io.dataOutX.get).toString)
            println("theta ends up " + peekFixedPoint(c.io.dataOutPhase.get) * 180 / Pi)
            val radian = (i - iterations) * Pi / piPoints
            val deltaLength = peekFixedPoint(c.io.dataOutX.get) - 1.0
            val deltaTheta = peekFixedPoint(c.io.dataOutPhase.get) - radian
            assert(abs(deltaLength) < epsilon)
            assert(abs(deltaTheta) < epsilon)
          }
        }
      }
  }

  // 测试hyperTri模式,利用自然对数进行
  var complement = List[Double]()
  var num = 0
  Driver(() => new CORDIC(mode = "hypertri", widthIn = widthIn, iterations = iterations)) {
    c =>
      new PeekPokeTester(c) {
        for (i <- -hyperPoints until hyperPoints + iterations) {
          if (i < hyperPoints) {
            pokeFixedPoint(c.io.dataInPhase.get, i * Pi / 3 / hyperPoints)
          }
          step(1)
          if (i >= -(hyperPoints - iterations)) {

            val radian = (i - iterations) * Pi / 3 / hyperPoints
            //            val coshValue = peekFixedPoint(c.io.dataOutX.get)
            //            val sinhValue = peekFixedPoint(c.io.dataOutY.get)
            //            val exponent = coshValue + sinhValue
            //            val truth = exp(radian)
            //            println("radian: " + radian.toString + " " + exponent.toString + " " + truth.toString + " " + (truth / exponent).toString)
            //            complement = (truth / exponent) :: complement
            //            num = num + 1

            val deltaCosh = (peekFixedPoint(c.io.dataOutX.get) - cosh(radian)) / cosh(radian)
            val deltaSinh = (peekFixedPoint(c.io.dataOutY.get) - sinh(radian)) / sinh(radian)
            //            println(radian + " " + deltaCosh + " " + deltaSinh)
            assert(deltaCosh < epsilon || sinh(radian) < 0.1 || cosh(radian) < 0.1) // 当x接近0时,sinh的相对误差很大
            assert(deltaSinh < epsilon || sinh(radian) < 0.1 || cosh(radian) < 0.1)
          }
        }
      }
  }
  //  println((complement.reduce(_ + _) / num).toString)

}
