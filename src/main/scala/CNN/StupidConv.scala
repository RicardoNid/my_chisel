package CNN

import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}

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

class StupidConv extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(1.W))
    val rst = Input(Bool())
    val out = Output(UInt(1.W))
  })
}

object StupidConv extends App {
  (new ChiselStage).execute(
    Array(
      "--target-dir", outputDir,
      "--output-file", "StupidConv"),
    Seq(ChiselGeneratorAnnotation(() => new StupidConv())))
}