// toy winograd

import CNN.CNNutil.printArray
import Jama._
import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}


val g = Matrix.random(3, 1)
val d = Matrix.random(4, 1)

val g2 = Matrix.random(3, 3) // coeff
val d2 = Matrix.random(4, 4) // input
// 随机化

printArray(g2)
printArray(d2)

val B = new Matrix(Array(
  Array(1, 0, 0, 0),
  Array(0, 1, -1, 1),
  Array(-1, 1, 1, 0),
  Array(0, 0, 0, -1)
))

val G = new Matrix(Array(
  Array(1, 0, 0),
  Array(0.5, 0.5, 0.5),
  Array(0.5, -0.5, 0.5),
  Array(0, 0, 1)
))

val A = new Matrix(Array(
  Array(1, 1, 1, 0),
  Array(0, 1, -1, -1)
)).transpose

// 一维winograd
val inner = (G times g) arrayTimes (B.transpose times d)
printArray(A.transpose times inner)

// 二维winograd
val inner2 = (G times g2 times G.transpose) arrayTimes (B.transpose times d2 times B)
printArray(A.transpose times inner2 times A)




