package CNN

import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import chisel3.util.Counter

// 基于以下设计前提
// 只有DRAM-片上存储-PE RF三级缓存
// 使用ROM代替片上存储,发出访存信号代替实际访DRAM
// 片上存储全都是RAM
//
// 每个PE是一个DSP slice
//  - 启用极限pipeline
//  - 启用跨时钟域设计
//  - 一维脉动阵列(只在一个方向上进行DSP间数据传输)
//
// 通过LoopNest决定
//
// 暂时不考虑深度可分离卷积
// 暂时不考虑batch维度

// 初始版本 : 用ROM代替RAM,PE阵列从ROM获取数据

class StupidConv(param: LoopNestParams = new LoopNestParams()) extends Module {
  val io = IO(new Bundle {
    val out = Output(UInt(16.W))
    val done = Output(Bool())
  })

  val inputROM = initROM(param.sizeInput, 8)
  val kernelROM = initROM(param.sizeKernel, 8)

  val (q, fullQ) = Counter(true.B, param.shape.Q)
  val (p, fullP) = Counter(fullQ, param.shape.P)
  val (s, fullS) = Counter(fullP, param.shape.S)
  val (r, fullR) = Counter(fullS, param.shape.R)
  val (c, fullC) = Counter(fullR, param.shape.C)
  val (m, fullM) = Counter(fullC, param.shape.M)

  val h = p * param.stride.U + r - param.padding.U
  val w = q * param.stride.U + s - param.padding.U

  val input = Reg(UInt(8.W))
  val kernel = Reg(UInt(8.W))

  input := inputROM(c * param.shape.H.U * param.shape.W.U + h * param.shape.W.U + w)
  kernel := kernelROM(m * param.shape.C.U * param.shape.R.U * param.shape.S.U + c * param.shape.R.U * param.shape.S.U + r * param.shape.S.U + s)

  io.out := input * kernel
  io.done := fullM && fullC && fullR && fullS && fullP && fullC
}

object StupidConv extends App {
  (new ChiselStage).execute(
    Array(
      "--target-dir", outputDir,
      "--output-file", "StupidConv"),
    Seq(ChiselGeneratorAnnotation(() => new StupidConv())))
}