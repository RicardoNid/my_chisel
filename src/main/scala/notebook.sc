import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}

val cmd = Array("--help")
(new ChiselStage).execute(cmd, Seq(ChiselGeneratorAnnotation(() => new CORDIC)))