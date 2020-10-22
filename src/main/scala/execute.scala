import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}

import scala.math.Pi

object test extends App {
  val filter = new ScalaFirFilter(Seq(1, 1, 1, 1))

  Driver(() => new Conwaylife) {
    c =>
      new PeekPokeTester(c) {
        poke(c.io.load, 1.U)
        poke(c.io.data, 7.U)
        step(1)
        expect(c.io.q, 7.U)
        for (i <- 0 until 100) {
          poke(c.io.load, 0.U)
          poke(c.io.data, 7.U)
          step(1)
          println(peek(c.io.q).toString)
        }
      }
  }
}

// 构建更好的task

object verilog extends App {
  (new ChiselStage).execute(Array("--target-dir", "./verilog_output"),
    Seq(ChiselGeneratorAnnotation(() => new CORDIC)))
}

object verilogText extends App {
  val verilogString = (new chisel3.stage.ChiselStage).emitVerilog(new FixedPointAdder)
  println(verilogString)
}
