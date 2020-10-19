;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit FirFilter : 
  module FirFilter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    reg _T : UInt<8>[3], clock @[FirFilter.scala 35:17]
    reg _T_1 : UInt<8>[3], clock @[FirFilter.scala 36:22]
    _T[0] <= io.in @[FirFilter.scala 37:11]
    node _T_2 = mul(_T[0], UInt<1>("h01")) @[FirFilter.scala 38:25]
    _T_1[0] <= _T_2 @[FirFilter.scala 38:16]
    _T[1] <= _T[0] @[FirFilter.scala 40:13]
    node _T_3 = mul(_T[1], UInt<1>("h01")) @[FirFilter.scala 41:44]
    node _T_4 = add(_T_1[0], _T_3) @[FirFilter.scala 41:36]
    node _T_5 = tail(_T_4, 1) @[FirFilter.scala 41:36]
    _T_1[1] <= _T_5 @[FirFilter.scala 41:18]
    _T[2] <= _T[1] @[FirFilter.scala 40:13]
    node _T_6 = mul(_T[2], UInt<1>("h01")) @[FirFilter.scala 41:44]
    node _T_7 = add(_T_1[1], _T_6) @[FirFilter.scala 41:36]
    node _T_8 = tail(_T_7, 1) @[FirFilter.scala 41:36]
    _T_1[2] <= _T_8 @[FirFilter.scala 41:18]
    io.out <= _T_1[2] @[FirFilter.scala 43:12]
    
