;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit FixedPointAdder : 
  module FixedPointAdder : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : Fixed<10><<8>>, flip b : Fixed<10><<8>>, sum : Fixed<11><<8>>}
    
    node _T = sub(io.a, io.b) @[FixedPointAdder.scala 20:18]
    node _T_1 = tail(_T, 1) @[FixedPointAdder.scala 20:18]
    node _T_2 = asFixedPoint(_T_1, 8) @[FixedPointAdder.scala 20:18]
    node _T_3 = shl(_T_2, 1) @[FixedPointAdder.scala 20:25]
    io.sum <= _T_3 @[FixedPointAdder.scala 20:10]
    
