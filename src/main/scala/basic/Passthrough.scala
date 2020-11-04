package basic

import chisel3._
import chisel3.util._

class Passthrough extends Module{
    val io = IO(new Bundle{
        val in = Input(UInt(1.W))
        val out= Output(UInt(1.W))
    })

//    val temp = Wire(UInt(1.W))
//    temp := io.in
//    io.out := temp

    io.out := io.in
}