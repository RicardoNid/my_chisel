;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit Table : 
  module Table : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<1>, flip b : UInt<1>, out : UInt<1>}
    
    wire table : UInt<1>[4] @[Table.scala 19:22]
    table[0] <= UInt<1>("h00") @[Table.scala 19:22]
    table[1] <= UInt<1>("h00") @[Table.scala 19:22]
    table[2] <= UInt<1>("h00") @[Table.scala 19:22]
    table[3] <= UInt<1>("h01") @[Table.scala 19:22]
    node _T = mul(io.a, UInt<2>("h02")) @[Table.scala 20:24]
    node _T_1 = add(_T, io.b) @[Table.scala 20:30]
    node _T_2 = tail(_T_1, 1) @[Table.scala 20:30]
    node _T_3 = bits(_T_2, 1, 0)
    io.out <= table[_T_3] @[Table.scala 20:10]
    
