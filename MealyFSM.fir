;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit MealyFSM : 
  module MealyFSM : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<1>, out : UInt}
    
    reg state : UInt, clock with : (reset => (reset, UInt<2>("h02"))) @[MealyFSM.scala 22:22]
    io.out <= UInt<1>("h00") @[MealyFSM.scala 24:10]
    node _T = eq(state, UInt<1>("h00")) @[MealyFSM.scala 26:16]
    when _T : @[MealyFSM.scala 26:25]
      when io.in : @[MealyFSM.scala 27:19]
        state <= UInt<1>("h01") @[MealyFSM.scala 28:15]
        io.out <= UInt<1>("h01") @[MealyFSM.scala 29:16]
        skip @[MealyFSM.scala 27:19]
      else : @[MealyFSM.scala 30:19]
        state <= UInt<1>("h00") @[MealyFSM.scala 31:15]
        io.out <= UInt<1>("h00") @[MealyFSM.scala 32:16]
        skip @[MealyFSM.scala 30:19]
      skip @[MealyFSM.scala 26:25]
    node _T_1 = eq(state, UInt<1>("h01")) @[MealyFSM.scala 26:16]
    when _T_1 : @[MealyFSM.scala 26:25]
      when io.in : @[MealyFSM.scala 27:19]
        state <= UInt<1>("h01") @[MealyFSM.scala 28:15]
        io.out <= UInt<1>("h00") @[MealyFSM.scala 29:16]
        skip @[MealyFSM.scala 27:19]
      else : @[MealyFSM.scala 30:19]
        state <= UInt<1>("h00") @[MealyFSM.scala 31:15]
        io.out <= UInt<1>("h01") @[MealyFSM.scala 32:16]
        skip @[MealyFSM.scala 30:19]
      skip @[MealyFSM.scala 26:25]
    node _T_2 = eq(state, UInt<2>("h02")) @[MealyFSM.scala 26:16]
    when _T_2 : @[MealyFSM.scala 26:25]
      when io.in : @[MealyFSM.scala 27:19]
        state <= UInt<1>("h01") @[MealyFSM.scala 28:15]
        io.out <= UInt<1>("h00") @[MealyFSM.scala 29:16]
        skip @[MealyFSM.scala 27:19]
      else : @[MealyFSM.scala 30:19]
        state <= UInt<1>("h00") @[MealyFSM.scala 31:15]
        io.out <= UInt<1>("h00") @[MealyFSM.scala 32:16]
        skip @[MealyFSM.scala 30:19]
      skip @[MealyFSM.scala 26:25]
    
