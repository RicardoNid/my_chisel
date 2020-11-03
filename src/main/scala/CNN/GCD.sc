// 对于给定的m和r,生成winograd矩阵A,B,G

def GCD(x: Int, y: Int): Int = if (y == 0) x else GCD(y, x % y) // 辗转相除求GCD


def exGCD(a: Int, b: Int): (Int, Int) = {
  if (b == 0) (1, 0)
  else {
    val (x, y) = exGCD(b, a % b)
    val xPrime = y
    val yPrime = x - a / b * y
    (xPrime, yPrime)
  }
}

def reverseUnit(a: Int, b: Int) = {
  if (GCD(a, b) != 1) {
    println(" no reverse unit")
    -1
  } else {
    val x = exGCD(a, b)._1
    (x % b + b) % b
  }
}

def crt(r: Array[Int], m: Array[Int]) = { // 用中国剩余定理求解 x === r (mod m)的方程组
  val mPrime = m.map(m.reduce(_ * _) / _)
  val y = m.zip(mPrime).map { case (m, mPrime) => reverseUnit(mPrime, m) * mPrime}
  y.zip(r).map { case (y, r) => y * r}.reduce(_ + _)
}

GCD(5, 2)
GCD(35, 14)

exGCD(42, 12)

reverseUnit(11, 3)

val r = Array(2, 3, 2)
val m = Array(3, 5, 7)

println(crt(r, m))

//def expandedGCD(x:Int, y:Int) = {
//
//}
//
//def winogradA (m:Int, r:Int) = {
//
//}