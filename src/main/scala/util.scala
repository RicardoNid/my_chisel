import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import chisel3.stage.ChiselStage

object util {
  def getVerilog(dut: => Module): String = {
    (new ChiselStage).emitVerilog(dut)
  }

  // 输出UInt,SInt,FixedPoint类型的二进制表示,用于创建verilog测试向量
  def printData[T <: Data](bits:T): Unit ={

  }

  def printBools(fp: Seq[chisel3.Bool]): Unit = {
    def printBool(bool: chisel3.Bool) = {
      if (bool.litToBoolean) print("1")
      else print("0")
    }

    fp.reverse.foreach(printBool(_))
  }
}
