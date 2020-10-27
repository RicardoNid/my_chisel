package CNN

import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}

object buildCNN extends App {
  (new ChiselStage).execute(
    Array("--target-dir", "./verilog_output"),
    Seq(ChiselGeneratorAnnotation(() => new PE(1000, 16))))
}

object doSomething extends App{
  import CNNutil._
  printInput()
  printRegs()
  printBuffer()
  printInputMapIndex()
  printRegsAsBuffer()
  printRegsAsInput()
}
