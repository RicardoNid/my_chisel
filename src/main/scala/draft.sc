val bounds = Array(2, 3, 4, 5)

def dynamicLoopNest(): Unit = {
  val layers = bounds.length
  var current = 0
  val index = Array.ofDim[Int](layers)
  index.map(i => 0)

  def recursivePart(): Unit = {
    if (current == layers) {
      println(index.mkString(" "))
    }
    if (current != layers) {
      println(current)
      if (current != 0) index(current - 1) += 1
      current += 1
      for (i <- 0 until bounds(current - 1)) recursivePart()
      current -= 1
    }
  }

  recursivePart()
}

dynamicLoopNest()