import scala.math.{Pi, round, sin}

val n = 1024
val phase = Pi / 4
val amp = 64

val times = Range(0, n, 1).map(i => (i * 2 * Pi) / (n.toDouble - 1) - Pi + phase)
val inits = times.map(t => round(amp * sin(t)))

val times1 = Range(0, n, 1).map(i => (i * 2 * Pi) / (n.toDouble - 1) - Pi + phase + 4 / Pi)
val inits1 = times1.map(t => round(amp * sin(t)))

val times2 = Range(0, n, 1).map(i => (i * 2 * Pi) / (n.toDouble - 1) - Pi + phase + 2 / Pi)
val inits2 = times2.map(t => round(amp * sin(t)))