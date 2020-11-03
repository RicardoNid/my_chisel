// 通过函数模式封装常数矩阵乘法模块并综合以验证

package CNN

import Jama.Matrix
import chisel3._
import chisel3.util._

class ConstantMM(coeff: Matrix) extends Module {
  val io = IO(new Bundle {
    val in = Input(Vec(4, Vec(4, SInt(8.W))))
    val out = Output(Vec(4, Vec(4, SInt(8.W))))
  })

  val wire = Vec(4, Vec(4, SInt(8.W)))

  def GEMM(wire: Vec[Vec[SInt]], coeff: Matrix) = {
    val result = Wire(wire.cloneType)
    result.map(_.map(_ => 0.S))
    for (i <- 0 until 4; j <- 0 until 4) {
      var point = 0.S
      for (k <- 0 until 4) {
        point = point + coeff.getArray()(i)(k).toInt.S * wire(k)(j)
      }
      result(i)(j) := point
    }
    result
  }

  io.out := GEMM(io.in, coeff)

}

class ConstantMM4 extends Module {
  val io = IO(new Bundle {
    val in = Input(Vec(4, Vec(4, SInt(8.W))))
    val out = Output(Vec(4, Vec(4, SInt(8.W))))
  })

  val GEMM = Module(new ConstantMM(WinoUtil.B))

  io <> GEMM.io
}