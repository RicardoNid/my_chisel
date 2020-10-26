;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit BRAMGen : 
  module BRAMGen : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip addr : UInt<10>, flip din : UInt<32>, dout : UInt<32>, flip ena : UInt<1>, flip wea : UInt<1>}
    
    smem mem : UInt<32>[1024], undefined @[BRAM.scala 16:24]
    read mport _T = mem[io.addr], clock @[BRAM.scala 18:22]
    io.dout <= _T @[BRAM.scala 18:11]
    when io.wea : @[BRAM.scala 19:16]
      write mport _T_1 = mem[io.addr], clock
      _T_1 <= io.din
      skip @[BRAM.scala 19:16]
    
