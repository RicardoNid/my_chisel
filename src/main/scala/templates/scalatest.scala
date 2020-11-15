package templates

import org.scalatest._

class HelloSpec extends FunSuite with DiagrammedAssertions{

  test("4 % 2 == 0"){
    assert(4 %2 == 0)
  }
}