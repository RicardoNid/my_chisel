import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}

object buildCORDIC extends App {
  (new ChiselStage).execute(Array("--target-dir", "./verilog_output"),
    // 生成旋转模式下的CORDIC核
    // Seq(ChiselGeneratorAnnotation(() => new CORDIC)))
    // 生成三角模式下的CORDIC核
    Seq(ChiselGeneratorAnnotation(() => new CORDIC(mode = "tri"))))
}