;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit MyRoutingArbiter : 
  module MyRoutingArbiter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}[5], out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}}
    
    node _T = or(io.in[0].valid, io.in[1].valid) @[routing.scala 11:47]
    node _T_1 = or(_T, io.in[2].valid) @[routing.scala 11:47]
    node _T_2 = or(_T_1, io.in[3].valid) @[routing.scala 11:47]
    node _T_3 = or(_T_2, io.in[4].valid) @[routing.scala 11:47]
    io.out.valid <= _T_3 @[routing.scala 11:16]
    node _T_4 = mux(io.in[3].valid, UInt<2>("h03"), UInt<3>("h04")) @[Mux.scala 47:69]
    node _T_5 = mux(io.in[2].valid, UInt<2>("h02"), _T_4) @[Mux.scala 47:69]
    node _T_6 = mux(io.in[1].valid, UInt<1>("h01"), _T_5) @[Mux.scala 47:69]
    node channel = mux(io.in[0].valid, UInt<1>("h00"), _T_6) @[Mux.scala 47:69]
    io.out.bits <= io.in[channel].bits @[routing.scala 13:15]
    node _T_7 = eq(channel, UInt<1>("h00")) @[routing.scala 15:60]
    node _T_8 = and(io.out.ready, _T_7) @[routing.scala 15:49]
    io.in[0].ready <= _T_8 @[routing.scala 15:33]
    node _T_9 = eq(channel, UInt<1>("h01")) @[routing.scala 15:60]
    node _T_10 = and(io.out.ready, _T_9) @[routing.scala 15:49]
    io.in[1].ready <= _T_10 @[routing.scala 15:33]
    node _T_11 = eq(channel, UInt<2>("h02")) @[routing.scala 15:60]
    node _T_12 = and(io.out.ready, _T_11) @[routing.scala 15:49]
    io.in[2].ready <= _T_12 @[routing.scala 15:33]
    node _T_13 = eq(channel, UInt<2>("h03")) @[routing.scala 15:60]
    node _T_14 = and(io.out.ready, _T_13) @[routing.scala 15:49]
    io.in[3].ready <= _T_14 @[routing.scala 15:33]
    node _T_15 = eq(channel, UInt<3>("h04")) @[routing.scala 15:60]
    node _T_16 = and(io.out.ready, _T_15) @[routing.scala 15:49]
    io.in[4].ready <= _T_16 @[routing.scala 15:33]
    
