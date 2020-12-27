package FIR

import breeze.linalg.DenseVector
import chisel3._
import chisel3.experimental._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import chisel3.util.isPow2
import scala.util.Random

// todo: 扩写这个class,增加可配置项 1.结构和流水方式 2.窗函数支持
// 开发流程是接口->测试->设计->chisel测试->build
class FirFilter(
                 bitWidthIn: Int = 27,
                 bitWidthWeight: Int = 18,
                 bitWidthOut: Int = 48,
                 mantissaWidth: Int = 0,
                 coeffs: DenseVector[Double],
                 version: String = "standard") extends Module {
  // 定义数据类型
  val typeIn = FixedPoint(bitWidthIn.W, mantissaWidth.BP)
  val typeWeight = FixedPoint(bitWidthWeight.W, mantissaWidth.BP)
  val typeOut = FixedPoint(bitWidthOut.W, mantissaWidth.BP)
  val inZERO = 0.0.F(bitWidthIn.W, mantissaWidth.BP)
  val weightZERO = 0.0.F(bitWidthWeight.W, mantissaWidth.BP)
  val multZERO = 0.0.F((bitWidthIn + bitWidthWeight).W, mantissaWidth.BP)
  val outZERO = 0.0.F(bitWidthOut.W, mantissaWidth.BP)
  // 检查架构类型合法性
  val validVersions = Set("standard", "transpose", "systolic")
  assert(validVersions.contains(version),
    "architecture selection is invalid, valid = [\"standard\", \"transpose\", \"systolic\"]")
  // 声明端口
  val io = IO(new Bundle {
    val in = Input(typeIn)
    val out = Output(typeOut)
  })
  // 转换权重类型为定点数
  val coeffsF = coeffs.map(_.F(bitWidthWeight.W, mantissaWidth.BP))
  val length = coeffs.length

  if (version == "systolic") {
    val inReg = RegInit(inZERO)
    val xRegs = RegInit(VecInit(Seq.fill(2 * length - 1)(inZERO))) // 输入传播线
    val multRegs = RegInit(VecInit(Seq.fill(length)(multZERO))) // 乘法器后寄存器
    val yRegs = RegInit(VecInit(Seq.fill(length)(outZERO))) // 加法器后寄存器,输出传播线

    inReg := io.in // fixme : 如果不使用inReg,xRegs(0) := io.in 将会大大增加时延 找出原因
    xRegs(0) := inReg
    for (i <- 1 until xRegs.length) xRegs(i) := xRegs(i - 1) // 连接输入传播线
    for (i <- 0 until length) multRegs(i) := coeffsF(i) * xRegs(i * 2)
    yRegs(0) := multRegs(0)
    for (i <- 1 until length) yRegs(i) := yRegs(i - 1) + multRegs(i)
    //    io.out := yRegs(length - 1)
    val bufReg = RegNext(yRegs(length - 1))
    io.out := bufReg
  }
}

object FirFilter {
  def main(args: Array[String]): Unit = {
    val randGen = new Random(30)
    val coeff144 = DenseVector(Array.ofDim[Double](144).map(_ => {
      val value = randGen.nextInt % 100 + 500 // 避开较小的整数和2的幂,避免优化
      if (isPow2(value)) (value + 13).toDouble
      else value.toDouble
    }))

    // 精准地产生了145个DSP，综合器思考了相当长的时间
    val outputFile144 = "FIR144"
    (new ChiselStage).execute(
      Array(
        "--output-file", outputFile144,
        "--target-dir", outputDir
      ),
      Seq(ChiselGeneratorAnnotation(() => new FirFilter(coeffs = coeff144, version = "systolic"))))
    println(outputDir)
  }
}