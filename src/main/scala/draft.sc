import basic.{Connect, MultiClock, Passthrough, Vector}
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import util._

(new ChiselStage).execute(Array("--target-dir", "./verilog_output"), Seq(ChiselGeneratorAnnotation(() => new MultiClock)))
