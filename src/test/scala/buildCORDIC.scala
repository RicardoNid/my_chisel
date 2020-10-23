import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}

object buildCORDICrotate extends App {
  (new ChiselStage).execute(
    Array("--target-dir", "./verilog_output"),
    Seq(ChiselGeneratorAnnotation(() => new CORDIC("rotate"))))
}

object buildCORDICTranslate extends App {
  (new ChiselStage).execute(
    Array("--target-dir", "./verilog_output"),
    Seq(ChiselGeneratorAnnotation(() => new CORDIC("translate"))))
}

