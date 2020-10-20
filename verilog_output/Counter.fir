;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit Counter : 
  module Counter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip en : UInt<1>, out : UInt<4>}
    
    reg value : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[Counter.scala 29:33]
    when io.en : @[Counter.scala 12:15]
      node _T = eq(value, UInt<4>("h09")) @[Counter.scala 38:24]
      node _T_1 = add(value, UInt<1>("h01")) @[Counter.scala 39:22]
      node _T_2 = tail(_T_1, 1) @[Counter.scala 39:22]
      value <= _T_2 @[Counter.scala 39:13]
      when _T : @[Counter.scala 41:21]
        value <= UInt<1>("h00") @[Counter.scala 41:29]
        skip @[Counter.scala 41:21]
      skip @[Counter.scala 12:15]
    io.out <= value @[Counter.scala 15:10]
    
