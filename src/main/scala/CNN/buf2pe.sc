import scala.collection.mutable
import scala.math.ceil

val Pox = 3
val Poy = 3
val Nix = 11
val Niy = 11
val PADDING = 1
val STRIDE = 1

val Nkx = 3
val Nky = 3

//val Pox = 2
//val Poy = 2
//val Nix = 15
//val Niy = 15
//val PADDING = 3
//val STRIDE = 2
//
//val Nkx = 5
//val Nky = 5



val inputMap = Array.ofDim[String](Niy, Nix)

// 填充input map


// 输出input map



// register序列


val BUFFER_WIDTH = Poy * Pox
val DEPTH_ALONG_ROW = divideAndCeil(Nix - 2 * PADDING, Pox)
val BUFFER_DEPTH =
  divideAndCeil(Niy, Poy * STRIDE) *
    STRIDE *
    DEPTH_ALONG_ROW

val buffer = Array.ofDim[String](BUFFER_DEPTH, BUFFER_WIDTH)

// 填充buffer
// 重点:构造port,address和col,row的映射关系
for (address <- 0 until BUFFER_DEPTH; port <- 0 until BUFFER_WIDTH) {

  val row_offset_0 = address / (STRIDE * DEPTH_ALONG_ROW)
  val row_offset_1 = port / Pox
  val row_offset_2 = address % (STRIDE * DEPTH_ALONG_ROW) / DEPTH_ALONG_ROW
  val row = row_offset_0 * Poy * STRIDE +
    row_offset_1 * STRIDE +
    row_offset_2

  val col_offset_0 = address % DEPTH_ALONG_ROW
  val col_offset_1 = port % Pox
  val col = col_offset_0 * Pox +
    col_offset_1 + PADDING

  buffer(address)(port) =
    if (row < Niy && col >= PADDING && col <= Niy - 1 - PADDING)
      inputMap(row)(col)
    else
      "-1"
}
println("buffer init done")

// 输出buffer
def printBuffer(xs: Array[Array[String]]) = {
  val output =
    (for (address <- 0 until BUFFER_DEPTH) yield {
      (for (port <- 0 until BUFFER_WIDTH) yield {
        val word = buffer(address)(port)
        " " * (4 - word.length) + word
      }).mkString + "\n"
    }).mkString
  println(output)
}

printBuffer(buffer)