// 通过函数模式封装常数矩阵乘法模块并综合以验证

package CNN

import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import breeze.linalg.DenseMatrix
import chisel3._

class ConstantMM(coeff: DenseMatrix[Double]) extends Module {
  val io = IO(new Bundle {
    val in = Input(Vec(4, Vec(4, SInt(8.W))))
    val out = Output(Vec(4, Vec(4, SInt(8.W))))
  })

  val wire = Vec(4, Vec(4, SInt(8.W)))

  io.out := GEMM(io.in, coeff)
}

object ConstantMM {
  def main(args: Array[String]): Unit = {

    (new ChiselStage).execute(
      Array(
        "--target-dir", outputDir,
        "--output-file", "constantMM"),
      Seq(ChiselGeneratorAnnotation(() => new ConstantMM(WinoB))))
  }
}