import breeze.signal._
import breeze.linalg._

import scala.util.Random

val input = DenseVector.rand[Double](11)
val kernel = DenseVector.rand[Double](5)

val outputCorre = correlate // 执行相关,没有padding
  [DenseVector[Double], DenseVector[Double], DenseVector[Double]](input, kernel)

val outputConv = convolve // 执行卷积,没有padding
  [DenseVector[Double], DenseVector[Double], DenseVector[Double]](input, kernel)

val output = filter // filter执行卷积,有padding,默认为zero-padding
  [DenseVector[Double], DenseVector[Double], DenseVector[Double]](input, kernel)

println(outputCorre.length)
println(outputConv.length)
println(output.length)

// 实际含义
assert( // 相关
  input(0) * kernel(0) + input(1) * kernel(1) + input(2) * kernel(2) +
  input(3) * kernel(3) + input(4) * kernel(4) == outputCorre(0))
assert( // 卷积
  input(0) * kernel(4) + input(1) * kernel(3) + input(2) * kernel(2) +
  input(3) * kernel(1) + input(4) * kernel(0) == outputConv(0))
assert( // filter
  input(0) * kernel(2) + input(1) * kernel(1) + input(2) * kernel(0) == output(0))