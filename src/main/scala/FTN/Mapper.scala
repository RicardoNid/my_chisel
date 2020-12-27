//package FTN
//
//import chisel3._
//import chisel3.util._
//import breeze.linalg._
//import breeze.signal._
//import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
//
//// 论文上的LUT based实现,没有完全展开,使用一个交织缓冲区
//// 到底要不要完全展开,跟信号频率有关
//// 假设送给每个子载波的基带信号频率为f,论文展开方式的实时性要求:Nf < facc * Nt, acc是累加器频率
//class Mapper extends Module {
//  val io = IO(new Bundle {
//    val in = Input(Vec(numSubcarrier, Bool())) // 不需要实现为1/-1,1/0即可
//    val out = Output(Vec(numBasisF, numBasisT))
//  })
//
//  // 交织buffer
//
//  // 参数ROM
//
//
//}
//
//object Mapper extends App {
//  (new ChiselStage).execute(
//    Array(
//      "--target-dir", outputDir,
//      "--output-file", "Mapper"),
//    Seq(ChiselGeneratorAnnotation(() => new Mapper())))
//}