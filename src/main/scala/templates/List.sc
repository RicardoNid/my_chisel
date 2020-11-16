// most commonly used data structure in Scala

// 构造List
// 从字面量
val fruit = List("apples", "oranges", "pears") // 一维
val diag3 = // 二维
  List(
    List(1, 0, 0),
    List(0, 1, 0),
    List(0, 0, 1))

val empty = List() // todo 关于工厂方法
// 以Nil为起点
val fruit = "apples" :: ("oranges" :: ("pears" :: Nil))
val diag3 = (1 :: (0 :: (0 :: Nil))) ::
  (0 :: (1 :: (0 :: Nil))) ::
  (0 :: (0 :: (1 :: Nil))) :: Nil
val empty = Nil

// List basic opertions 从basic operation来看，应当是单向链表
// Nil.head
fruit.head
fruit.tail
fruit.isEmpty

// List的类型 -> 使用IDEA补全展示
def accept[T <: List[Any]](elem: T) = {
  println("hello")
}
accept(List[Double](1.0))

