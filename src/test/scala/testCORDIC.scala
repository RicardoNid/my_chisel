import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import chisel3.experimental.FixedPoint

import scala.math.{Pi, abs, cos, sin}

object testCORDIC extends App {

  val widthIn = 20
  val iterations = 30
  val widthOut = widthIn + iterations

  println("theta table, 0 implies that the precision is not enough for iterations")
  for (i <- 0 until iterations) {
    println(CORDICutil.getCartesianPhase(i).
      F(widthOut.W, (widthOut - 4).BP).toString)
  }

  val piPoints = 60
  val epsilon = 0.001

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
            // val degree = ((i - iterations) * 180.0 / piPoints)
            // println("degree: " + degree.toString)
            // println("X: " + peekFixedPoint(c.io.dataOutX.get).toString)
            // println("Y: " + peekFixedPoint(c.io.dataOutY.get).toString)
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
  Driver(() => new CORDIC(mode = "arctan", widthIn = widthIn, iterations = iterations)) {
    c =>
      new PeekPokeTester(c) {
        for (i <- -piPoints until  piPoints + iterations) {
          if (i < piPoints) {
            pokeFixedPoint(c.io.dataInX.get, cos(i * Pi / piPoints))
            pokeFixedPoint(c.io.dataInY.get, sin(i * Pi / piPoints))
          }
          step(1)
          if (i >= -(piPoints - iterations)) {
//                        println("degree: " + ((i - iterations) * 180.0 / piPoints).toString)
//                        println("get length = " + peekFixedPoint(c.io.dataOutX.get).toString)
//                        println("theta ends up " + peekFixedPoint(c.io.dataOutPhase.get) * 180 / Pi)
            val radian = (i - iterations) * Pi / piPoints
            // val deltaLength = peekFixedPoint(c.io.dataOutX.get) - 1.0
            val deltaTheta = peekFixedPoint(c.io.dataOutPhase.get) - radian
            // assert(abs(deltaLength) < epsilon)
            assert(abs(deltaTheta) < epsilon)
          }
        }
      }
  }
}
