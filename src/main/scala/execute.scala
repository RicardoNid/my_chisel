import CNN.WinoUtil.B
import CNN.{ConstantMM, CounterNormal}
import CORDIC.CORDIC
import basic.Connect
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}

// 构建更好的task

object verilog extends App {
  (new ChiselStage).execute(Array("--target-dir", "./verilog_output"),
    Seq(ChiselGeneratorAnnotation(() => new ConstantMM(B))))
}

object verilogText extends App {
  val verilogString = (new chisel3.stage.ChiselStage).emitVerilog(new CounterNormal)
  println(verilogString)
}

object help extends App {
  (new ChiselStage).execute(Array("--help"),
    Seq(ChiselGeneratorAnnotation(() => new CORDIC())))
}
