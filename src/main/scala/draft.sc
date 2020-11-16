import chisel3.{Vec, VecInit}
import chisel3.experimental.FixedPoint

import scala.math.{Pi, round, sin}

def sinTable(amp: Double, n: Int, phase: Double) = {
    val times = Range(0, n, 1).map(i => (i * 2 * Pi) / (n.toDouble - 1) - Pi + phase)
    val inits = times.map(t => round(amp * sin(t)))
    inits
  }

sinTable(256, 1024, Pi/4)