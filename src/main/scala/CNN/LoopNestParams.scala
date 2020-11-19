package CNN

import CNN.LoopNestParams.DnC

import scala.math.ceil
import chisel3._
import chisel3.util._
import breeze.linalg._
import breeze.signal._

// todo : 增加对输入数据的约束
// todo : 修改增加设计的泛用性,兼容FTDT运行模式
class LoopNestParams(STRIDE: Int = 1, PADDING: Int = 1,
                     // order = N, M, C, H, W, R, S
                     shapeInput: Array[Int] = Array(1, 5, 5, 6, 6, 3, 3), // 卷积层尺寸
                     tilingInput: Array[Int] = Array(1, 5, 5, 3, 3, 1, 1), // tiling尺寸
                     unrollInput: Array[Int] = Array(1, 5, 5, 3, 3, 1, 1)) { // unroll尺寸
  val stride = STRIDE
  val padding = PADDING
  val shape = LoopBoundArray(shapeInput)
  shape.setOutput()
  val tiling = LoopBoundArray(tilingInput)
  tiling.setOutput(R = shape.R, S = shape.S)
  val unroll = LoopBoundArray(unrollInput)
  unroll.P = unroll.H
  unroll.Q = unroll.W
  val Loop0 = LoopBoundArray(shape.getArray.zip(tiling.getArray).map(pair => DnC(pair._1, pair._2))) // todo : 不能整除时取上限
  val Loop1 = LoopBoundArray(tiling.getArray.zip(unroll.getArray).map(pair => DnC(pair._1, pair._2)))

  val sizeInput = shape.N * shape.C * shape.H * shape.W
  val sizeKernel = shape.M * shape.C * shape.R * shape.S
  val sizeOutput = shape.N * shape.M * shape.P * shape.Q
  val DRAMFlow = sizeInput + sizeKernel + sizeOutput

  val numMults = shape.getLoopBounds.reduce(_ * _)
  val numInterTileCycles = Loop0.getLoopBounds.reduce(_ * _)
  val numIntraTileCycles = Loop1.getLoopBounds.reduce(_ * _)
  val numCycles = numInterTileCycles * numIntraTileCycles
  val numDSP = unroll.getLoopBounds.reduce(_ * _)
  // 如果多个output在同一位置,应当使用加法树处理,而不是占据存储
  // 怎么根据param判断同一周期产生了多少个不同位置的output?

  // input -> NCHW kernel -> MCRS output -> NMPQ
  val sizeInputBuffer = tiling.N * tiling.C * tiling.H * tiling.W

  val indexN = (a: Int, b: Int, c: Int) => a * tiling.N + b * unroll.N + c
  val indexM = (a: Int, b: Int, c: Int) => a * tiling.M + b * unroll.M + c
  val indexC = (a: Int, b: Int, c: Int) => a * tiling.C + b * unroll.C + c
  val indexR = (a: Int, b: Int, c: Int) => a * tiling.R + b * unroll.R + c
  val indexS = (a: Int, b: Int, c: Int) => a * tiling.S + b * unroll.S + c
  val indexP = (a: Int, b: Int, c: Int) => a * tiling.P + b * unroll.P + c
  val indexQ = (a: Int, b: Int, c: Int) => a * tiling.Q + b * unroll.Q + c
  val indexTransform = Array(indexN, indexM, indexC, indexR, indexS, indexP, indexQ)

  // loop1和loop0中的循环可以交织吗? -> input/kernel/output进行不同比例的tiling有无意义? todo : 证明"匹配tiling"总是最优解
  // 0,1,2,3,4,5,6 means N, M, C, R, S, P, Q
  val shapeOrder = Array(0, 1, 2, 3, 4, 5, 6) // todo : 把order也写成一个class,用户从外部传入
  val tilingOrder = Array(0, 1, 2, 5, 6, 3, 4)
  val unrollOrder = Array(0, 1, 2, 3, 4, 5, 6) // 实际上没有order,总是0-6

  val loopBounds = Range(0, 7).map(i => Loop0.getLoopBounds(shapeOrder(i))).toList :::
    Range(0, 7).map(i => Loop1.getLoopBounds(tilingOrder(i))).toList :::
    Range(0, 7).map(i => unroll.getLoopBounds(unrollOrder(i))).toList

  val numParallelCycle = Range(0, 14).map(i => loopBounds(i)).reduce(_ * _) // 并行运算合并,一次conv的cycles
  val numTilingCycle = Range(7, 14).map(i => loopBounds(i)).reduce(_ * _) // 并行运算合并,一组tiling的cycles

  def genIndex(): Unit = {
    val layers = loopBounds.length
    var current = -1
    var cycle = 0
    val loopIndex = Array.ofDim[Int](layers).map(i => 0)

    def scan(): Unit = {
      if (current == layers - 1) {
        // N对应bound在loopBounds中的位置是shapeOrder(0)和tilingOrder(0) + 1
        val mathIndex = Range(0, 7).map(i =>
          indexTransform(i)(
            loopIndex(shapeOrder(i)),
            loopIndex(tilingOrder(i) + 7),
            loopIndex(unrollOrder(i) + 14)))
        val (n, m, c, r, s, p, q) = (mathIndex(0), mathIndex(1), mathIndex(2), mathIndex(3), mathIndex(4), mathIndex(5), mathIndex(6))
        val h = p * STRIDE + r - PADDING
        val w = q * STRIDE + s - PADDING

        if (Range(7, 21).forall(i => loopIndex(i) == 0)) println("fetch DRAM at cycle " + cycle)
        //        if (Range(14, 21).forall(i => loopIndex(i) == 0)) println("----------")
        //        println("input coord " + (n, c, h, w))
        //        println("kernel coord " + (m, c, r, s))
        //        println("output coord " + (n, m, p, q))
        cycle += 1
      }
      else {
        current += 1
        for (i <- 0 until loopBounds(current)) {
          loopIndex(current) = i
          scan()
        }
        current -= 1
      }
    }

    scan()
    println(cycle)
  }
}

object LoopNestParams {

  val DnC = (a:Int, b:Int) => ceil(a.toDouble / b.toDouble).toInt

  def main(args: Array[String]): Unit = {
    val Ma = new LoopNestParams(
      STRIDE = 1,
      PADDING = 1,
      shapeInput = Array(1, 1, 1, 360, 360, 3, 3),
      tilingInput = Array(1, 1, 1, 120, 120, 3, 3),
      unrollInput = Array(1, 1, 1, 3, 3, 1, 1)
    )
    println(Ma.shape.getArray.mkString(" "))
    println(Ma.tiling.getArray.mkString(" "))
    println(Ma.loopBounds.mkString(" "))
    println("tiling cycles = " + Ma.numTilingCycle)
    println("DSP number = " + Ma.numDSP)
    println("op/bw = " + Ma.numMults.toDouble / Ma.DRAMFlow.toDouble)
    println("DSP util = " + Ma.numMults.toDouble / Ma.numCycles.toDouble / Ma.numDSP.toDouble)
    val bounds = Array(Ma.shape, Ma.tiling, Ma.unroll, Ma.Loop0, Ma.Loop1).map(_.getLoopBounds)
    bounds.map(_.mkString(" ")).foreach(println _)
  }
}

// todo : 模拟Ma 2018
// todo : 处理整除问题
// todo : 完成坐标类 将坐标类填入 并行暂存区 tiling暂存区

