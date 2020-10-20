import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class MyManyDynamicElementVecFir(length: Int) extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(8.W))
    val consts = Input(Vec(length, UInt(8.W)))
    val out = Output(UInt(8.W))
  })

  // Reference solution
  val regs = RegInit(VecInit(Seq.fill(length - 1)(0.U(8.W))))
  for (i <- 0 until length - 1) {
    if (i == 0) regs(i) := io.in
    else regs(i) := regs(i - 1)
  }

  val muls = Wire(Vec(length, UInt(8.W)))
  for (i <- 0 until length) {
    if (i == 0) muls(i) := io.in * io.consts(i)
    else muls(i) := regs(i - 1) * io.consts(i)
  }

  val scan = Wire(Vec(length, UInt(8.W)))
  for (i <- 0 until length) {
    if (i == 0) scan(i) := muls(i)
    else scan(i) := muls(i) + scan(i - 1)
  }

  io.out := scan(length - 1)
}

class simplerFIR(length: Int) extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(8.W))
    val consts = Input(Vec(length, UInt(8.W)))
    val out = Output(UInt(8.W))
  })

  val regs = RegInit(VecInit(Seq.fill(length-1)(0.U(8.W))));
  regs(0) := io.in
  for (i <- 1 until length-1) regs(i) := regs(i-1)

  io.out := (regs zip io.consts).map({case(a,b) => a*b}).reduce(_+_)
}