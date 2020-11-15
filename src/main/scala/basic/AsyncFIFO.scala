//package basic
//
//import FIR.outputDir
//import Xilinx.BRAMPort
//import chisel3._
//import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
//import chisel3.util._
//
//// FPGA上的AsyncFIFO,实际上是两端口不同时钟的BRAM
//class AsyncFIFO(bitWidth: Int, depth: Int) extends RawModule {
//  val io = IO(new Bundle {
//    val writePort = BRAMPort(bitWidth, unsignedBitLength(depth))
//    val readPort = BRAMPort(bitWidth, unsignedBitLength(depth))
//    val rst = Input(Bool())
//    val full = Output(Bool())
//    val empty = Output(Bool())
//  })
//
//  val mem = SyncReadMem(depth, UInt(bitWidth.W))
//
//  val writeToReadPtr = Wire(UInt((depth + 1).W)) // to read clock domain
//  val readToWritePtr = Wire(UInt((depth + 1).W)) // to write clock domain
//
//  withClockAndReset(io.writePort.clk, io.rst) {
//
//    val binaryWritePtr = RegInit(0.U((depth + 1).W))
//    val binaryWritePtrNext = Wire(UInt((depth + 1).W))
//    val grayWritePtr = RegInit(0.U((depth + 1).W))
//    val grayWritePtrNext = Wire(UInt((depth + 1).W))
//    val isFull = RegInit(false.B)
//    val fullValue = Wire(Bool())
//    val grayReadPtrDelay0 = RegNext(readToWritePtr)
//    val grayReadPtrDelay1 = RegNext(grayReadPtrDelay0)
//
//    binaryWritePtrNext := binaryWritePtr + (io.writeEn && !isFull).asUInt
//    binaryWritePtr := binaryWritePtrNext
//    grayWritePtrNext := (binaryWritePtrNext >> 1) ^ binaryWritePtrNext
//    grayWritePtr := grayWritePtrNext
//    writeToReadPtr := grayWritePtr
//    fullValue := (grayWritePtrNext === Cat(~grayReadPtrDelay1(depth, depth - 1), grayReadPtrDelay1(depth - 2, 0)))
//    isFull := fullValue
//    when(io.writeEn && !isFull) {
//      ram.write(binaryWritePtr(depth - 1, 0), io.dataIn)
//    }
//    io.full := isFull
//  }
//  // read clock domain
//  withClockAndReset(io.readClk, io.systemRst) {
//    val binaryReadPtr = RegInit(0.U((depth + 1).W))
//    val binaryReadPtrNext = Wire(UInt((depth + 1).W))
//    val grayReadPtr = RegInit(0.U((depth + 1).W))
//    val grayReadPtrNext = Wire(UInt((depth + 1).W))
//    val isEmpty = RegInit(true.B)
//    val emptyValue = Wire(Bool())
//    val grayWritePtrDelay0 = RegNext(writeToReadPtr)
//    val grayWritePtrDelay1 = RegNext(grayWritePtrDelay0)
//    binaryReadPtrNext := binaryReadPtr + (io.readEn && !isEmpty).asUInt
//    binaryReadPtr := binaryReadPtrNext
//    grayReadPtrNext := (binaryReadPtrNext >> 1) ^ binaryReadPtrNext
//    grayReadPtr := grayReadPtrNext
//    readToWritePtr := grayReadPtr
//    emptyValue := (grayReadPtrNext === grayWritePtrDelay1)
//    isEmpty := emptyValue
//    io.dataOut := ram.read(binaryReadPtr(depth - 1, 0), io.readEn && !isEmpty)
//    io.empty := isEmpty
//  }
//}
//
//object AsyncFIFO {
//  def main(args: Array[String]): Unit = {
//    (new ChiselStage).execute(
//      Array(
//        "--target-dir", outputDir,
//        "--output-file", "AsyncFIFO"),
//      Seq(ChiselGeneratorAnnotation(() => new AsyncFIFO(16, 512))))
//  }
//}