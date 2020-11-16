package CNN.Ma

import scala.math.ceil

object Ma {

  // 便利函数
  val divideAndCeil = (x: Int, y: Int) => ceil(x / y.toDouble).toInt
  val aligned = (s: String) => " " * (4 - s.length) + s

  val Nix = 11
  val Niy = 11
  val Nkx = 3
  val Nky = 3
  val PADDING = 1
  val STRIDE = 1

  val Nox = (Nix - Nkx) / STRIDE + 1
  val Noy = (Niy - Nky) / STRIDE + 1

  val Pox = 3
  val Poy = 3

  val cycles = divideAndCeil(Noy, Poy) * divideAndCeil(Nox, Pox) * Nky * Nkx
  val BUFFER_WIDTH = Poy * Pox
  val DEPTH_ALONG_ROW = divideAndCeil(Nix - 2 * PADDING, Pox)
  val BUFFER_DEPTH =
    divideAndCeil(Niy, Poy * STRIDE) *
      STRIDE *
      DEPTH_ALONG_ROW

  val inputMap = Array.ofDim[String](Niy, Nix)
  val regSequence = Array.ofDim[(Int, Int)](cycles, Poy, Pox)
  val buffer = Array.ofDim[String](BUFFER_DEPTH, BUFFER_WIDTH)

  // 填充inputMap
  for (input_y <- 0 until Niy; input_x <- 0 until Nix) {
    val range_x = PADDING to Nix - 1 - PADDING
    val range_y = PADDING to Niy - 1 - PADDING
    inputMap(input_y)(input_x) =
      if (range_x.contains(input_x) && range_y.contains(input_y))
        (input_y - PADDING + 1).toString + (input_x - PADDING + 1).toString
      else 0.toString
  }

  // 填充BUFFER
  val bufferFilled = buffer.zipWithIndex.map {
    case (row, i) => row.zipWithIndex.map {
      case (element, j) => {
        val (coord_1, coord_2) = BUF2IM(i, j)
        if (coord_1 < Niy && coord_2 >= PADDING && coord_2 <= Niy - 1 - PADDING)
          inputMap(coord_1)(coord_2)
        else
          "-1"
      }
    }
  }

  val oyMax = divideAndCeil(Noy, Poy)
  val oxMax = divideAndCeil(Nox, Pox)

  // 将inputMap中的坐标转换为buffer中的坐标
  // 具体来说,col/row和port/address之间的映射关系
  def IM2BUF(row: Int, col: Int) = {
    val address_offset_0 = row / (Poy * STRIDE)
    val address_offset_1 = (col - PADDING) / Pox
    val address = address_offset_0 * STRIDE * DEPTH_ALONG_ROW +
      address_offset_1

    val port_offset_0 = (row / STRIDE) % Poy
    val port_offset_1 = (col - PADDING) % Pox
    val port = port_offset_0 * Pox + port_offset_1

    (address, port)
  }

  def BUF2IM(address: Int, port: Int) = {
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

    (row, col)
  }

  def BUF2IM_tuple(tuple: (Int, Int)) = {
    val (address, port) = tuple
    BUF2IM(address, port)
  }

  // 逐周期填充regs
  // 填充内容为所需数据在inputMap当中的坐标
  // 可以将inputMap中的坐标转换为buffer中的坐标
  // 第一个版本的datapath->状态机+查表
  var index = 0
  for (output_y <- 0 until oyMax) {
    for (output_x <- 0 until oxMax) {
      for (kernel_y <- 0 until Nky) {
        for (kernel_x <- 0 until Nkx) {

          if (index == 0) {
            for (y <- 0 until Poy; x <- 0 until Pox) {
              regSequence(0)(y)(x) = (y * STRIDE, x * STRIDE)
            }
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
          }
          index = index + 1
        }
      }
    }
  }

  // 上面的代码会在CNNutil第一次被访问时被执行

  def printInput() = {
    println("input map")
    println(inputMap.map(_.map(aligned).mkString + "\n").mkString)
  }

  def printRegs() = {
    println("reg sequence")
    for (i <- 0 until cycles) {
      println(regSequence(i).map(_.map(coord => inputMap(coord._1)(coord._2)).map(aligned).mkString).mkString)
    }
  }

  def printBuffer() = {
    println("buffer")
    println(bufferFilled.map(_.map(aligned).mkString + "\n").mkString)
  }

  val inputMapIndex = inputMap.zipWithIndex.map {
    case (row, i) => row.zipWithIndex.map {
      case (element, j) => {
        val (coord_1, coord_2) = IM2BUF(i, j)
        BUF2IM(coord_1, coord_2)
      }
    }
  }

  def printInputMapIndex() = {
    println("index back")
    println(inputMapIndex.map(_.mkString + "\n").mkString)
  }

  def printRegsAsBuffer() = {
    println("buffer address of reg contents")
    for (i <- 0 until cycles) {
      val transformed = regSequence(i).map(_.map(BUF2IM_tuple).map(_._1.toString).map(aligned)) // address only
      println(transformed.map(_.mkString).mkString)
    }
  }

  def printRegsAsInput() = {
    println("inputMap coord of reg contents")
    for (i <- 0 until cycles) {
      println(regSequence(i).map(_.mkString).mkString)
    }
  }

}
