package CNN

import chisel3._
import chisel3.util._

// 如果为Winograd引入Stride?

class PlainWinograd(m: Int, r: Int, width: Int = 16) extends Module {
  val io = IO(new Bundle {
    val in = Input(Vec((m + r - 1), Vec((m + r - 1), UInt(width.W))))
    val out = Output(Vec(m, Vec(m, UInt(width.W))))
  })

  // 输入变换

  // 权重变换

  // element-wise multipication


}