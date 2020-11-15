package Xilinx

import chisel3._
import chisel3.util._
import breeze.linalg._
import breeze.signal._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}

// 注意,dynamic不是动态地"移动多少位",动态移位运算需要阵列实现
class DynamicShiftRegisters(depth:Int) extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(1.W))
    val ce = Input(Bool())
    val sel = Input(UInt(unsignedBitLength(depth).W))
    val out = Output(UInt(1.W))
  })

  val regs = Reg(Vec(depth, UInt(1.W)))
  when(io.ce){
    regs(0) := io.in
    for (i <- 1 until depth) regs(i) := regs(i-1)
  }
  io.out := regs(io.sel)

}

object DynamicShiftRegisters extends App {
  (new ChiselStage).execute(
    Array(
      "--target-dir", outputDir,
      "--output-file", "DynamicShiftRegisters"),
    Seq(ChiselGeneratorAnnotation(() => new DynamicShiftRegisters(10))))
}