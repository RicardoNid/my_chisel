circuit FIR.FirFilter :
  module FIR.FirFilter :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<16>
    output io_out : UInt<16>
  
    reg _T__0 : UInt<16>, clock with :
      reset => (UInt<1>("h0"), _T__0) @[FIR.FirFilter.scala 14:17]
    reg _T__1 : UInt<16>, clock with :
      reset => (UInt<1>("h0"), _T__1) @[FIR.FirFilter.scala 14:17]
    reg _T__2 : UInt<16>, clock with :
      reset => (UInt<1>("h0"), _T__2) @[FIR.FirFilter.scala 14:17]
    reg _T__3 : UInt<16>, clock with :
      reset => (UInt<1>("h0"), _T__3) @[FIR.FirFilter.scala 14:17]
    node _T_1 = mul(_T__0, UInt<1>("h1")) @[FIR.FirFilter.scala 20:63]
    node _T_2 = mul(_T__1, UInt<1>("h1")) @[FIR.FirFilter.scala 20:63]
    node _T_3 = mul(_T__2, UInt<1>("h1")) @[FIR.FirFilter.scala 20:63]
    node _T_4 = mul(_T__3, UInt<1>("h1")) @[FIR.FirFilter.scala 20:63]
    node _T_5_0 = _T_1 @[FIR.FirFilter.scala 20:51 FIR.FirFilter.scala 20:51]
    node _T_5_1 = _T_2 @[FIR.FirFilter.scala 20:51 FIR.FirFilter.scala 20:51]
    node _T_6 = add(_T_5_0, _T_5_1) @[FIR.FirFilter.scala 22:33]
    node _T_7 = tail(_T_6, 1) @[FIR.FirFilter.scala 22:33]
    node _T_5_2 = _T_3 @[FIR.FirFilter.scala 20:51 FIR.FirFilter.scala 20:51]
    node _T_8 = add(_T_7, _T_5_2) @[FIR.FirFilter.scala 22:33]
    node _T_9 = tail(_T_8, 1) @[FIR.FirFilter.scala 22:33]
    node _T_5_3 = _T_4 @[FIR.FirFilter.scala 20:51 FIR.FirFilter.scala 20:51]
    node _T_10 = add(_T_9, _T_5_3) @[FIR.FirFilter.scala 22:33]
    node _T_11 = tail(_T_10, 1) @[FIR.FirFilter.scala 22:33]
    io_out <= bits(_T_11, 15, 0) @[FIR.FirFilter.scala 22:12]
    _T__0 <= io_in @[FIR.FirFilter.scala 15:11]
    _T__1 <= _T__0 @[FIR.FirFilter.scala 17:13]
    _T__2 <= _T__1 @[FIR.FirFilter.scala 17:13]
    _T__3 <= _T__2 @[FIR.FirFilter.scala 17:13]
