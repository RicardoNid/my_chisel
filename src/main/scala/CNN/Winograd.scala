//package CNN
//
//import Jama.Matrix
//import chisel3._
//import chisel3.util._
//
//class Winograd(coeff: Matrix) extends Module {
//  val io = IO(new Bundle {
//    val in = Input(Vec(4, Vec(4, SInt(8.W))))
//    val out = Output(Vec(2, Vec(2, SInt(8.W))))
//  })
//
//  // val inner2 = (G times g2 times G.transpose) arrayTimes (B.transpose times d2 times B)
//  // val result = A.transpose times inner2 times A
//
//  val left = WinoUtil.G times coeff times WinoUtil.G.transpose // 这部分可以预先计算
//
//  val Bd = Wire(Vec(4, Vec(4, SInt(8.W))))
//  Bd.map(_.map(_ => 0.S))
//
//  for (i <- 0 until 4; j <- 0 until 4; k <- 0 until 4) {
//    Bd(i)(j) := Bd(i)(j) + WinoUtil.B.transpose.getArray()(i)(k).toInt.S * io.in(k)(j)
//  }
//
//  val right = Wire(Bd.cloneType)
//  right.map(_.map(_ => 0.S))
//
//  for (i <- 0 until 4; j <- 0 until 4; k <- 0 until 4) {
//    right(i)(j) := right(i)(j) + Bd(i)(k) * WinoUtil.B .getArray()(k)(j).toInt.S
//  }
//
//  val inner = Wire
//
//  val Ao = Wire(Bd.cloneType)
//  Ao.map(_.map(_ => 0.S))
//
//  for (i <- 0 until 4; j <- 0 until 4; k <- 0 until 4) {
//    Ao(i)(j) := Ao(i)(j) + WinoUtil.B .getArray()(k)(j).toInt.S * Bd(i)(k)
//}