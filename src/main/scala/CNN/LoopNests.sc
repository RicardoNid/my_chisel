import breeze.linalg._

// 采用eyeriss tutorial的符号系统
// 层参数
val N = 2 // batch size
val M = 5 // output channel
val C = 5 // intput channel
val H = 6 // input height
val W = 6 // input width
val R = 3 // kernel height
val S = 3 // kernel width
val STRIDE = 1
val PADDING = 1
val P = (H + 2 * PADDING - R) / STRIDE + 1 // output height
val Q = (W + 2 * PADDING - S) / STRIDE + 1 // output width

// tiling系数和0层次循环
val NT = N;
val N0 = N / NT
val MT = M;
val M0 = M / MT
val CT = C;
val C0 = C / CT
val RT = R;
val R0 = R / RT
val ST = S;
val S0 = S / ST
val PT = 3;
val P0 = P / PT
val QT = 3;
val Q0 = Q / QT

// unroll系数和1层次循环
val NP = 1;
val N1 = NT / NP
val MP = 1;
val M1 = MT / MP
val CP = 1;
val C1 = CT / CP
val RP = 3;
val R1 = RT / RP
val SP = 3;
val S1 = ST / SP
val PP = 1;
val P1 = PT / PP
val QP = 1;
val Q1 = QT / QP

var input = Array.ofDim[Double](N, C, H, W) // 采用和pytorch一致的NCHW layout
var filter = Array.ofDim[Double](M, C, R, S)
var output = Array.ofDim[Double](N, M, P, Q)

input = input.map(_.map(_.map(_.map(_ => 1.0))))
filter = filter.map(_.map(_.map(_.map(_ => 1.0))))

val output1 = output.map(_.map(_.map(_.map(_ => 0.0))))
val output2 = output.map(_.map(_.map(_.map(_ => 0.0))))
val output3 = output.map(_.map(_.map(_.map(_ => 0.0))))

val paddedInput = (n: Int, c: Int, h: Int, w: Int) => {
  if (h < 0 || h >= H || w < 0 || w >= W) 0
  else input(n)(c)(h)(w)
}

// version1 没有tiling和并行,只有interchange,特别地,使用这个版本作为ground truth
for (n <- 0 until N; m <- 0 until M; c <- 0 until C;
     p <- 0 until P; q <- 0 until Q; // 值得注意的是,在loop nests中,总是遍历PQ,而非HW
     r <- 0 until R; s <- 0 until S) {
  output1(n)(m)(p)(q) += paddedInput(n, c, p + r - PADDING, q + s - PADDING) * filter(m)(c)(r)(s)
}

// version2,引入tiling,使用"下标"代表所属内存层次
// 所有没有列出tiling参数的,实际上有tiling参数 = full,该维度上,数据被完整加载进入缓存
// todo : 处理整除问题

for (n0 <- 0 until N0; m0 <- 0 until M0; c0 <- 0 until C0;
     r0 <- 0 until R0; s0 <- 0 until S0;
     p0 <- 0 until P0; q0 <- 0 until Q0;
     // ----------------存储层次分割线---------------- // // 实际上存储层次顺序只需在相同维度上有序
     nT <- 0 until NT; mT <- 0 until MT; cT <- 0 until CT;
     rT <- 0 until RT; sT <- 0 until ST;
     pT <- 0 until PT; qT <- 0 until QT) {
  val n = n0 * NT + nT
  val m = m0 * MT + mT
  val c = c0 * CT + cT
  val r = r0 * RT + rT
  val s = s0 * ST + sT
  val p = p0 * PT + pT
  val q = q0 * QT + qT
  output2(n)(m)(p)(q) += paddedInput(n, c, p + r - PADDING, q + s - PADDING) * filter(m)(c)(r)(s)
}

// version3(full version),引入unroll,使用"下标"代表并行

// 记录并行消费/产生的数据
// scala Array最多支持五维,要想办法裁剪尺寸 = 1的维度
// var parallelInput = Array.ofDim[Double](NP, MP, CP, RP, SP, PP, QP)

// todo : 对于非标准卷积运算,如深度可分离卷积,要制作相应版本

// 并行记录器
var parallelInput = Array.ofDim[String](RP, SP)
var parallelFilter = Array.ofDim[String](RP, SP)
var parallelOutput = Array.ofDim[String](RP, SP)

for (n0 <- 0 until N0;
     m0 <- 0 until M0;
     c0 <- 0 until C0;
     r0 <- 0 until R0;
     s0 <- 0 until S0;
     p0 <- 0 until P0;
     q0 <- 0 until Q0;
     // ----------------存储层次分割线---------------- //
     n1 <- 0 until N1;
     m1 <- 0 until M1;
     c1 <- 0 until C1;
     r1 <- 0 until R1;
     s1 <- 0 until S1;
     p1 <- 0 until P1;
     q1 <- 0 until Q1;
     // ----------------并行区域分割线---------------- //
     nP <- 0 until NP;
     mP <- 0 until MP;
     cP <- 0 until CP;
     rP <- 0 until RP;
     sP <- 0 until SP;
     pP <- 0 until PP;
     qP <- 0 until QP
     ) {
  val n = n0 * NT + n1 * NP + nP
  val m = m0 * MT + m1 * MP + mP
  val c = c0 * CT + c1 * CP + cP
  val r = r0 * RT + r1 * RP + rP
  val s = s0 * ST + s1 * SP + sP
  val p = p0 * PT + p1 * PP + pP
  val q = q0 * QT + q1 * QP + qP
  output3(n)(m)(p)(q) += paddedInput(n, c, p + r - PADDING, q + s - PADDING) * filter(m)(c)(r)(s)

  // 输出和重置并行记录器
  if (nP == 0 && mP == 0 && cP == 0 && rP == 0 && sP == 0 && pP == 0 && qP == 0) {
    println("input\n" + parallelInput.map(_. mkString(" ")).mkString("\n"))
    //    println("filter\n" + parallelFilter.map(_.mkString(" ")).mkString("\n"))
    //    println("output\n" + parallelOutput.map(_.mkString(" ")).mkString("\n"))

    parallelInput.map(_.map(_ => ""))
    parallelFilter.map(_.map(_ => ""))
    parallelOutput.map(_.map(_ => ""))
  }

  // 填充并行记录器
  parallelInput(rP)(sP) = "(" + Array(p + r - PADDING, q + s - PADDING).mkString(" ") + ")"
  // parallelFilter(rP)(sP) = "(" + Array(r, s).mkString(" ") + ")"
  // parallelOutput(rP)(sP) = "(" + Array(p, q).mkString(" ") + ")"


}

output1
output2
output3

// todo : 描述full version中,循环顺序的规则
// todo : 编写Ma Yufei 2018 循环
// todo : 编写坐标类和带逐周期profile输出的full verision循环
// todo : 裁剪尺寸 = 1的维度
// 层次0上看对DRAM的访存,层次1上看对buffer的访存,层次P上看核设计核并行度,在脚本中,可以通过条件+输出来模拟

