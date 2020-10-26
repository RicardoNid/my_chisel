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

val Nox = (Nix - Nkx) / STRIDE + 1
val Noy = (Niy - Nky) / STRIDE + 1

val inputMap = Array.ofDim[String](Niy, Nix)

// 填充input map
for (input_y <- 0 until Niy; input_x <- 0 until Nix) {
  val range_x = PADDING to Nix - 1 - PADDING
  val range_y = PADDING to Niy - 1 - PADDING
  inputMap(input_y)(input_x) =
    if (range_x.contains(input_x) && range_y.contains(input_y))
      (input_y - PADDING + 1).toString + (input_x - PADDING + 1).toString
    else 0.toString
}

// 输出input map
def printInput() = {
  val output =
    (for (input_y <- 0 until Niy) yield {
      (for (input_x <- 0 until Nix) yield {
        val word = inputMap(input_y)(input_x)
        " " * (4 - word.length) + word
      }).mkString + "\n"
    }).mkString
  println(output)
}
printInput()

val divideAndCeil = (x: Int, y: Int) => ceil(x / y.toDouble).toInt

// register序列
val SEQUENCE_LENGTH = divideAndCeil(Noy, Poy) * divideAndCeil(Nox, Pox) * Nky * Nkx

val regSequence = Array.ofDim[(Int, Int)](SEQUENCE_LENGTH, Poy, Pox)

def printRegs(i: Int) = {
  val output =
    (for (y <- 0 until Poy) yield {
      (for (x <- 0 until Pox) yield {
        val coord = regSequence(i)(y)(x)
        val word = inputMap(coord._1)(coord._2)
        " " * (4 - word.length) + word
      }).mkString
    }).mkString
  println(output)
}

val oyMax = divideAndCeil(Noy, Poy)
val oxMax = divideAndCeil(Nox, Pox)

// 重点:构造index和col,row的映射关系
var index = 0
for (output_y <- 0 until oyMax) {
  for (output_x <- 0 until oxMax) {
    for (kernel_y <- 0 until Nky) {
      for (kernel_x <- 0 until Nkx) {

        if (index == 0) {
          for (y <- 0 until Poy; x <- 0 until Pox) {
            regSequence(0)(y)(x) = (y * STRIDE, x * STRIDE)
          }
          printRegs(0)
        }
        else {

          var deltaX = 1
          var deltaY = 0
          if (kernel_x == 0) {
            deltaX -= Nkx
            deltaY += 1
            if (kernel_y == 0) {
              deltaX += Pox * STRIDE
              deltaY -= Nky
              if (output_x == 0) {
                deltaX -= oxMax * Pox * STRIDE
                deltaY += Poy * STRIDE
              }
            }
          }

          regSequence(index) =
            regSequence(index - 1).map(_.map(
              (coord: (Int, Int)) => (coord._1 + deltaY, coord._2 + deltaX)
            ))
          printRegs(index)
        }

        index = index + 1
      }
    }
  }
}

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