import java.lang.Math.{cos, pow, sin, sqrt}

import chisel3.experimental.FixedPoint

import scala.math.Pi

def getHyperbolicScaleComplement(iterations: Int): Double = {
  require(iterations >= 1)
  val gain =
    if (iterations == 1)
      sqrt(1 - pow(2.0, -2))
    else sqrt(1 - pow(2.0, -2 * iterations)) * getHyperbolicScaleComplement(iterations - 1)
  1 / gain
}

val scale = Array.range(1, 50).map(getHyperbolicScaleComplement)

println(scale(40))
println(1 * scale(38) * scale(38))

import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

val bools = cos(0.0).F(10.W, (10 - 2).BP).toBools()

def printBools(fp: Seq[chisel3.Bool]): Unit = {
  def printBool(bool: chisel3.Bool) = {
  if (bool.litToBoolean) print("1")
  else print("0")
}
  fp.reverse.foreach(printBool(_))
} // 输出转为bools的定点数

for (i <- -60 until 60) {
  println("#10;")
  print("io_dataInX = 20'b")
  printBools(cos(i * Pi / 60).F(20.W, (20 - 2).BP).toBools())
  println(";")
  print("io_dataInY = 20'b")
  printBools(sin(i * Pi / 60).F(20.W, (20 - 2).BP).toBools())
  println(";")
}

for (i <- -60 until 60) {
  println("#10;")
  print("io_dataInX = 20'b")
  printBools((cos(i * Pi / 60) * 1.5).F(20.W, (20 - 2).BP).toBools())
  println(";")
  print("io_dataInY = 20'b")
  printBools((-sin(i * Pi / 60) * 1.5).F(20.W, (20 - 2).BP).toBools())
  println(";")
}

for (i<- 0 until 40){
  println("#10;")
}