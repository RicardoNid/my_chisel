import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import chisel3.experimental.FixedPoint

import scala.math.Pi

object testCORDIC extends App {

  val widthIn = 20
  val iterations = 30
  val widthOut = widthIn + iterations

  println("theta table, 0 implies that the precision is not enough for iterations")
  for (i <- 0 until iterations) {
    println(CORDICutil.getCartesianPhase(i).
      F(widthOut.W, (widthOut - 4).BP).toString)
  }

//  Driver(() => new CORDIC(widthIn = widthIn, iterations = iterations)) {
//    c =>
//      new PeekPokeTester(c) {
//        for (i <- 0 until iterations + 30) {
//
//          pokeFixedPoint(c.io.dataInX.get, 1.0)
//          pokeFixedPoint(c.io.dataInY.get, 0.0)
//          pokeFixedPoint(c.io.dataInPhase, i * Pi / 60)
//          step(1)
//          if (i > iterations) {
//            println("step: " + (i - iterations - 1).toString)
//            println("X: " + peekFixedPoint(c.io.dataOutX).toString)
//            println("Y: " + peekFixedPoint(c.io.dataOutY).toString)
//          }
//        }
//      }
//  }

    // 测试三角(sin/cos)模式
    Driver(() => new CORDIC(mode = "tri", widthIn = widthIn, iterations = iterations)) {
    c =>
      new PeekPokeTester(c) {
        for (i <- 0 until iterations + 30) {

          pokeFixedPoint(c.io.dataInPhase, i * Pi / 60)
          step(1)
          if (i >= iterations) {
            println("step: " + (i - iterations).toString)
            println("cos(" + (i*180/60.0) + "): " + peekFixedPoint(c.io.dataOutX).toString)
            println("sin(" + (i*180/60.0) + "): " + peekFixedPoint(c.io.dataOutY).toString)
          }
        }
      }
  }
}
