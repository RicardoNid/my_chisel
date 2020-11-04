import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import chisel3.stage.ChiselStage
import basic.Sort4

object testSort4 extends App {
  Driver(() => new Sort4) {
    c=>
      new PeekPokeTester(c){
        poke(c.io.in(0), 4)
        poke(c.io.in(1), 15)
        poke(c.io.in(2), 6)
        poke(c.io.in(3), 7)

        for (i <- 0 until 4){
          println(peek(c.io.out(i)).toString)
        }
      }
  }
}
