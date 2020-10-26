package CORDIC

import java.lang.Math.{atan, cos, pow, sqrt}

object CORDICutil {
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

    val arctanhTable = Array.fill[Double](43)(0.0)
    arctanhTable(0) = 0.549306144334055
    arctanhTable(1) = 0.255412811882995
    arctanhTable(2) = 0.125657214140453
    arctanhTable(3) = 0.062581571477003
    arctanhTable(4) = 0.031260178490667
    arctanhTable(5) = 0.015626271752052
    arctanhTable(6) = 0.007812658951540
    arctanhTable(7) = 0.003906269868397
    arctanhTable(8) = 0.001953127483533
    arctanhTable(9) = 0.000976562810441
    arctanhTable(10) = 0.000488281288805
    arctanhTable(11) = 0.000244140629851
    arctanhTable(12) = 0.000122070313106
    arctanhTable(13) = 0.000061035156326
    arctanhTable(14) = 0.000030517578134
    arctanhTable(15) = 0.000015258789064
    arctanhTable(16) = 0.000007629394531
    arctanhTable(17) = 0.000003814697266
    arctanhTable(18) = 0.000001907348633
    arctanhTable(19) = 0.000000953674316
    arctanhTable(20) = 0.000000476837158
    arctanhTable(21) = 0.000000238418579
    arctanhTable(22) = 0.000000119209290
    arctanhTable(23) = 0.000000059604645
    arctanhTable(24) = 0.000000029802322
    arctanhTable(25) = 0.000000014901161
    arctanhTable(26) = 0.000000007450581
    arctanhTable(27) = 0.000000003725290
    arctanhTable(28) = 0.000000001862645
    arctanhTable(29) = 0.000000000931323
    arctanhTable(30) = 0.000000000465661
    arctanhTable(31) = 0.000000000232831
    arctanhTable(32) = 0.000000000116415
    arctanhTable(33) = 0.000000000058208
    arctanhTable(34) = 0.000000000029104
    arctanhTable(35) = 0.000000000014552
    arctanhTable(36) = 0.000000000007276
    arctanhTable(37) = 0.000000000003638
    arctanhTable(38) = 0.000000000001819
    arctanhTable(39) = 0.000000000000909
    arctanhTable(40) = 0.000000000000455
    arctanhTable(41) = 0.000000000000227
    arctanhTable(42) = 0.000000000000114

    arctanhTable(i) // return value
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
