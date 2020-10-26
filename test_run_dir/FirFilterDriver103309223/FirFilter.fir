;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit FIR.FirFilter :
  module FIR.FirFilter :
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<16>, out : UInt<16>}
    
    reg _T : UInt<16>[4], clock @[FIR.FirFilter.scala 14:17]
    _T[0] <= io.in @[FIR.FirFilter.scala 15:11]
    _T[1] <= _T[0] @[FIR.FirFilter.scala 17:13]
    _T[2] <= _T[1] @[FIR.FirFilter.scala 17:13]
    _T[3] <= _T[2] @[FIR.FirFilter.scala 17:13]
    node _T_1 = mul(_T[0], UInt<1>("h01")) @[FIR.FirFilter.scala 19:63]
    node _T_2 = mul(_T[1], UInt<1>("h01")) @[FIR.FirFilter.scala 19:63]
    node _T_3 = mul(_T[2], UInt<1>("h01")) @[FIR.FirFilter.scala 19:63]
    node _T_4 = mul(_T[3], UInt<1>("h01")) @[FIR.FirFilter.scala 19:63]
    wire _T_5 : UInt<17>[4] @[FIR.FirFilter.scala 19:51]
    _T_5[0] <= _T_1 @[FIR.FirFilter.scala 19:51]
    _T_5[1] <= _T_2 @[FIR.FirFilter.scala 19:51]
    _T_5[2] <= _T_3 @[FIR.FirFilter.scala 19:51]
    _T_5[3] <= _T_4 @[FIR.FirFilter.scala 19:51]
    node _T_6 = add(_T_5[0], _T_5[1]) @[FIR.FirFilter.scala 20:33]
    node _T_7 = tail(_T_6, 1) @[FIR.FirFilter.scala 20:33]
    node _T_8 = add(_T_7, _T_5[2]) @[FIR.FirFilter.scala 20:33]
    node _T_9 = tail(_T_8, 1) @[FIR.FirFilter.scala 20:33]
    node _T_10 = add(_T_9, _T_5[3]) @[FIR.FirFilter.scala 20:33]
    node _T_11 = tail(_T_10, 1) @[FIR.FirFilter.scala 20:33]
    io.out <= _T_11 @[FIR.FirFilter.scala 20:12]
    
