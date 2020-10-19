;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit MyModule : 
  module MyModule : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<4>, flip b : UInt<4>, out : UInt<8>}
    
    node _T = cat(io.a, io.b) @[Cat.scala 29:58]
    io.out <= _T @[Adder.scala 11:10]
    
