;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit ShiftRegister : 
  module ShiftRegister : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<1>, out : UInt<4>}
    
    reg state : UInt<4>, clock with : (reset => (reset, UInt<1>("h01"))) @[ShiftRegister.scala 13:22]
    node _T = shl(state, 1) @[ShiftRegister.scala 15:26]
    node nextState = or(_T, io.in) @[ShiftRegister.scala 15:31]
    state <= nextState @[ShiftRegister.scala 17:9]
    io.out <= state @[ShiftRegister.scala 19:10]
    
