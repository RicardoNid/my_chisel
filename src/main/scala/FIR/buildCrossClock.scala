package FIR
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}

object buildCrossClock extends App {

  val outputDir = "./verilog_output"
  val outputFile = "CrossClock"
  (new ChiselStage).execute(
    Array(
      "--output-file", outputFile,
      "--target-dir", outputDir
    ),
    Seq(ChiselGeneratorAnnotation(() => new CrossClock)))
}




