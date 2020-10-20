import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import chisel3.stage.{ChiselStage, ChiselGeneratorAnnotation}

object FirFilterDriver extends App {
  val filter = new ScalaFirFilter(Seq(1, 1, 1, 1))

  Driver(() => new FirFilter(16, Seq(1.U, 1.U, 1.U, 1.U), "standard")) {
    c =>
      new PeekPokeTester(c) {
        for (i <- 0 until 100) {
          val input = i
          val golden = filter.poke(i)
          poke(c.io.in, input)
          step(1)
          expect(c.io.out, golden, s"i $i, input $input, gm $golden, ${peek(c.io.out)}")
        }
      }
  }
}

object Verilog extends App {
  (new ChiselStage).execute(Array("--target-dir", "./verilog_output"), Seq(ChiselGeneratorAnnotation(() => new FirMore(10, 8, util.HammingWindow))))
}

object Tri extends App {
  println(util.TriangularWindow(10, 16))
  println(util.HammingWindow(10, 8))
}
