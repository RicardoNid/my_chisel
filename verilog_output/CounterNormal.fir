;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit CounterNormal : 
  module CounterNormal : 
    input clock : Clock
    input reset : UInt<1>
    output io : {count : UInt<7>}
    
    reg countRegs : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[CounterNormal.scala 11:26]
    node _T = add(countRegs, UInt<1>("h01")) @[CounterNormal.scala 12:26]
    node _T_1 = tail(_T, 1) @[CounterNormal.scala 12:26]
    countRegs <= _T_1 @[CounterNormal.scala 12:13]
    io.count <= countRegs @[CounterNormal.scala 13:12]
    
