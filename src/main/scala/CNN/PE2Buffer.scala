package CNN

import chisel3._
import chisel3.util._

class PE2Buffer extends Module{
    val io = IO(new Bundle{
        val in = Input(UInt(1.W))
        val out= Output(UInt(1.W))
    })
}