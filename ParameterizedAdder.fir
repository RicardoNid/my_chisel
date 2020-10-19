;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit ParameterizedAdder : 
  module ParameterizedAdder : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in_a : UInt<4>, flip in_b : UInt<4>, out : UInt<4>}
    
    node sum = add(io.in_a, io.in_b) @[Adder.scala 46:21]
    node _T = gt(sum, UInt<4>("h0f")) @[Adder.scala 48:23]
    node _T_1 = mux(_T, UInt<4>("h0f"), sum) @[Adder.scala 48:18]
    io.out <= _T_1 @[Adder.scala 48:12]
    
