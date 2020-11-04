// 通过函数模式封装常数矩阵乘法模块并综合以验证

package CNN

import Jama.Matrix
import chisel3._
import CNNutil.GEMM

class ConstantMM(coeff: Matrix) extends Module {
  val io = IO(new Bundle {
    val in = Input(Vec(4, Vec(4, SInt(8.W))))
    val out = Output(Vec(4, Vec(4, SInt(8.W))))
  })

  val wire = Vec(4, Vec(4, SInt(8.W)))

  io.out := GEMM(io.in, coeff)

}