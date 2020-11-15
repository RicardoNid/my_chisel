// fixme : row36

//package basic
//
//import Chisel.{is, switch}
//import chisel3._
//
//class ConwaylifeBetter extends Module {
//  val io = IO(new Bundle {
//    val load = Input(Bool())
//    val data = Input(UInt(256.W))
//    val q = Output(UInt(256.W))
//  })
//  val regs = Reg(UInt(256.W))
//
//  when(io.load) {
//    regs := io.data
//  }.otherwise {
//    val wrap = (x: Int) => if (x == 16) 0 else if (x == -1) 15 else x
//    val bools = VecInit(regs.asBools)
//
//    for (index <- 0 until 256) {
//      val i = index / 16
//      val j = index % 16
//      val row_index = List(i - 1, i, i + 1).map(wrap)
//      val col_index = List(j - 1, j, j + 1).map(wrap)
//
//      val sum =
//        (for (row <- row_index; col <- col_index; if (!(row == i && col == j)))
//          yield {
//            regs(row * 16 + col).asUInt()
//          })
//          .reduce(_ +& _)
//
//      bools(index) := 0.B
//      switch(sum) {
//        is(2.U) {
//          bools(index) := regs(index)
//        }
//        is(3.U) {
//          bools(index) := 1.B
//        }
//      }
//    }
//    regs := bools.asUInt
//  }
//  io.q := regs
//}