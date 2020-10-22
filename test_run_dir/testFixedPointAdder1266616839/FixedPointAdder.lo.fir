circuit FixedPointAdder :
  module FixedPointAdder :
    input clock : Clock
    input reset : UInt<1>
    input io_a : SInt<10>
    input io_b : SInt<10>
    output io_sum : SInt<11>
  
    node _T = add(io_a, io_b) @[FixedPointAdder.scala 20:18]
    node _T_1 = tail(_T, 1) @[FixedPointAdder.scala 20:18]
    node _T_2 = asSInt(_T_1) @[FixedPointAdder.scala 20:18]
    io_sum <= _T_2 @[FixedPointAdder.scala 20:10]
