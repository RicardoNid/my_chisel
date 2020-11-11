import scala.util.Random
val random = new Random(42)
val coeff145 = Array.ofDim[Int](145).map(_ => random.nextInt() % 10000)