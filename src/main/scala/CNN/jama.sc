// 使用Jama的示例

import Jama._
// 函数式编程真是轻松愉快
val aligned = (s:String) => if (s.length < 4) " " * (4-s.length) + s else s.take(4)
val printArray = (A:Matrix) => A.getArray.foreach(row => println(row.map(_.toString).map(aligned).mkString("\t")))
val randomize = (A:Matrix) => {
  val r = new scala.util.Random(0)
  A.getArray.foreach(_.map(_ => r.nextDouble()))
}

val A = new Matrix(3,6) // 初始化m*n矩阵

val r = new scala.util.Random(0)

for (i <- 0 until A.getRowDimension)
  for (j <- 0 until A.getColumnDimension)
    A.set(i, j, r.nextDouble()) // 元素赋值 set

printArray(A)

A.set(0, 0, A.get(A.getRowDimension - 1, A.getColumnDimension -1)) // 元素访问 get

printArray(A)

val B = A.getMatrix(0, 2, 0, 3) // slicing getMatrix 坐标形式是to,不是until

printArray(B)

printArray(A.transpose) // 矩阵转置 transpose

printArray(A.transpose.times(B)) // 矩阵乘法 times

// 解线性方程组 solve

// 可以通过修改getArray得到的Array,修改matrix,进而可以使用函数式方法修改matrix