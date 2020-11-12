package FIR

import breeze.linalg.DenseVector
import chisel3._
import chisel3.experimental._

// todo: 扩写这个class,增加可配置项 1.结构和流水方式 2.signed/unsigned
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
  val ZERO = 0.0.F(bitWidthIn.W, mantissaWidth.BP)
  // 检查架构类型合法性
  val validVersions = Set("standard", "transpose", "systolic")
  assert(validVersions.contains(version),
    "architecture selection is invalid, valid = [\"standard\", \"transpose\", \"systolic\"]")
  // 声明端口
  val io = IO(new Bundle {
    val rst = Input(Bool())
    val in = Input(typeIn)
    val out = Output(typeOut)
  })
  // 转换权重类型为定点数
  val coeffsF = coeffs.map(_.F(bitWidthWeight.W, mantissaWidth.BP))
  val length = coeffs.length

  if (version == "systolic") {
    val xRegs = Reg(Vec(2 * length - 1, typeIn)) // 输入传播线
    val multRegs = Reg(Vec(length, typeOut)) // 乘法器后寄存器
    val yRegs = Reg(Vec(length, typeOut)) // 加法器后寄存器,输出传播线
    when(io.rst) {
      xRegs.foreach(_ := ZERO)
      multRegs.foreach(_ := ZERO)
      yRegs.foreach(_ := ZERO)
    }.otherwise {
      xRegs(0) := io.in
      for (i <- 1 until xRegs.length) xRegs(i) := xRegs(i - 1) // 连接输入传播线
      for (i <- 0 until length) multRegs(i) := coeffsF(i) * xRegs(i * 2)
      yRegs(0) := multRegs(0)
      for (i <- 1 until length) yRegs(i) := yRegs(i - 1) + multRegs(i)
    }
    io.out := yRegs(length - 1)
  }
}