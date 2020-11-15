import scala.util.Random
import breeze.linalg.DenseVector

val randGen = new Random(42) // 42 is the seed, don't forget to use new!
val input = DenseVector(Array.ofDim[Double](100).map(_ => (randGen.nextInt % 100).toDouble))
