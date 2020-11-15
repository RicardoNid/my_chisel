import java.lang.Math.{atan, cos, log, pow, sqrt}

package object CORDIC {
  // 直角坐标系,相位表
  def getCartesianPhase(i: Int) = atan(pow(2.0, -i))

  // 直角坐标系,补偿系数表
  def getCartesianScaleComplement(iterations: Int): Double = {
    require(iterations >= 1)
    if (iterations == 1)
      cos(getCartesianPhase(0))
    else
      cos(getCartesianPhase(iterations - 1)) * getCartesianScaleComplement(iterations - 1)
  }

  // 双曲坐标系,相位表
  // 双曲线坐标系的静态参数从i = 1开始,在生成函数中及进行处理,无需再次处理


  def getHyperbolicPhase(i: Int) = {
    def tanh(x: Double): Double = {
      0.5 * log(-(x + 1.0) / (x - 1.0))
    }
    tanh(pow(2.0, -(i + 1))) // return value
  }

  // 双曲坐标系,补偿系数表
  def getHyperbolicScaleComplement(iterations: Int): Double = {
    require(iterations >= 1)
    val gain =
      if (iterations == 1)
        sqrt(1 - pow(2.0, -2))
      else sqrt(1 - pow(2.0, -2 * iterations)) * getHyperbolicScaleComplement(iterations - 1)
    1 / gain
  }
}
