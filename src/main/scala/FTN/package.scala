package object FTN {

  val outputDir = "E:/LtrProjects/VivadoProjects/ZCU_efficient/ZCU_efficient.srcs/from_chisel/"

  // 下面是mapper的参数

  val deltaF = 1
  val deltaT = 0.4
  val repF = 2
  val repT = 10

  val widthCoeff = 16

  val numSubcarrier = 64

  val numBasisF = 9
  val numBasisT = 9


  // todo : 寻找最小周期,计算repF和repT
}
