import chisel3._

class Conwaylife extends Module {
  val io = IO(new Bundle {
    val load = Input(Bool())
    val data = Input(UInt(256.W))
    val q = Output(UInt(256.W))
  })

  val regs = Reg(Vec(16, Vec(16, UInt(1.W))))
  val qbits = VecInit(io.data.asBools)

  for (i <- 0 until 16; j <- 0 until 16) {
    val index: Int = i * 16 + j

    when(io.load) {
      regs(i)(j) := io.data(index)
    }.otherwise {
      // static scala
      val wrap = (x: Int) => if (x == 16) 0 else if (x == -1) 15 else x
      val row_index = List(i - 1, i, i + 1).map(wrap)
      val col_index = List(j - 1, j, j + 1).map(wrap)
      // dynamic chisel
      val neighbors = for (row <- row_index; col <- col_index) yield {
        regs(row)(col)
      }
      val sum = neighbors.reduce(_ +& _) - regs(i)(j)
      when(sum < 2.U) {
        regs(i)(j) := 0.U
      }.elsewhen(sum === 2.U) {
        regs(i)(j) := regs(i)(j)
      }.elsewhen(sum === 3.U) {
        regs(i)(j) := 1.U
      }.otherwise(regs(i)(j) := 0.U)
    }
    qbits(index) := regs(i)(j)
  }
  io.q := qbits.asUInt
}