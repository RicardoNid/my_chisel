package CNN

case class LoopBoundArray(N: Int = 2,
                          M: Int = 5, C: Int = 5,
                          H: Int = 6, W: Int = 6,
                          R: Int = 3, S: Int = 3,
                         ) {
  var P = 0 // uninitialized
  var Q = 0 // uninitialized
  def getArray = Array(N, M, C, H, W, R, S, P, Q)

  def getLoopBounds = Array(N, M, C, R, S, P, Q)

  def setOutput(PADDING: Int = 1, STRIDE: Int = 1, R: Int = 1, S: Int = 1) = {
    P = (H + 2 * PADDING - R) / STRIDE + 1
    Q = (W + 2 * PADDING - S) / STRIDE + 1
  }
}

object LoopBoundArray { // 实现工厂方法
  def apply(array: Array[Int]): LoopBoundArray = {
    require(array.length == 7 || array.length == 9, "number of params must be 7 or 9")
    if (array.length == 7) new LoopBoundArray(array(0), array(1), array(2), array(3), array(4), array(5), array(6))
    else {
      val result = new LoopBoundArray(array(0), array(1), array(2), array(3), array(4), array(5), array(6))
      result.P = array(7)
      result.Q = array(8)
      result
    }
  }
}