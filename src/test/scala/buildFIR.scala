import FIR.FirFilter
import chisel3._
import chisel3.util._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import scala.util.Random

object buildFIR extends App {

  val random = new Random(42)

  val coeffGauss = Array(
    1, 4, 7, 4, 1,
    4, 16, 26, 16, 4,
    7, 26, 41, 26, 7,
    4, 16, 26, 16, 4,
    1, 4, 7, 4, 1
  ).map(_.S)

  val coeffComplex = Array(
    1598, 4143, 7705, 1612, 5478,
    7845, 1542, 3324, 4516, 7891,
    7613, 1214, 7845, 1243, 4789,
    6895, 2463, 8454, 9123, 5124,
    3652, 1424, 7845, 1421, 9631
  ).map(_.S)

  val coeff145 = Array.ofDim[Int](145).map(_ => (random.nextInt() % 10000).S)

  val outputFile = "gaussFIR"
  val outputDir = "./verilog_output"

  (new ChiselStage).execute(
    Array(
      "--output-file", outputFile,
      "--target-dir", outputDir
    ),
    Seq(ChiselGeneratorAnnotation(() => new FirFilter(17, coeffGauss, "systolic"))))

  // 预期产生一个使用25个DSP slice的设计
  // 事实亦是如此
  val outputFileComplex = "complexFIR"
  (new ChiselStage).execute(
    Array(
      "--output-file", outputFileComplex,
      "--target-dir", outputDir
    ),
    Seq(ChiselGeneratorAnnotation(() => new FirFilter(17, coeffComplex, "systolic"))))

  // 这个设计也精准地产生了145个DSP
  val outputFile145 = "FIR145"
  (new ChiselStage).execute(
    Array(
      "--output-file", outputFile145,
      "--target-dir", outputDir
    ),
    Seq(ChiselGeneratorAnnotation(() => new FirFilter(17, coeff145, "systolic"))))
}




