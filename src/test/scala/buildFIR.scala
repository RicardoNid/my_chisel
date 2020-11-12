import FIR.FirFilter
import breeze.linalg.DenseVector
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import chisel3.util._

import scala.util.Random

object buildFIR extends App {
  val randGen = new Random(42)
  val coeff145 = DenseVector(Array.ofDim[Double](145).map(_ => {
    val value = randGen.nextInt % 100 + 500 // 避开较小的整数和2的幂,避免优化
    if (isPow2(value)) (value + 13).toDouble
    else value.toDouble
  }
  ))
  //  val coeff145 = DenseVector.rand[Double](145) // rand产生的数值在0-1之间

  // 精准地产生了145个DSP，综合器思考了相当长的时间
  val outputDir = "./verilog_output"
  val outputFile145 = "FIR145"
  (new ChiselStage).execute(
    Array(
      "--output-file", outputFile145,
      "--target-dir", outputDir
    ),
    Seq(ChiselGeneratorAnnotation(() => new FirFilter(coeffs = coeff145, version = "systolic"))))
}




