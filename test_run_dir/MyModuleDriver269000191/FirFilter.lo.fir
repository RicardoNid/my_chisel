circuit FirFilter :
  module FirFilter :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<8>
    output io_out : UInt<8>
  
    reg _T__0 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), _T__0) @[FirFilter.scala 14:17]
    reg _T__1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), _T__1) @[FirFilter.scala 14:17]
    reg _T__2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), _T__2) @[FirFilter.scala 14:17]
    reg _T__3 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), _T__3) @[FirFilter.scala 14:17]
    node _T_1 = mul(_T__0, UInt<1>("h1")) @[FirFilter.scala 20:63]
    node _T_2 = mul(_T__1, UInt<1>("h1")) @[FirFilter.scala 20:63]
    node _T_3 = mul(_T__2, UInt<1>("h1")) @[FirFilter.scala 20:63]
    node _T_4 = mul(_T__3, UInt<1>("h1")) @[FirFilter.scala 20:63]
    node _T_5_0 = _T_1 @[FirFilter.scala 20:51 FirFilter.scala 20:51]
    node _T_5_1 = _T_2 @[FirFilter.scala 20:51 FirFilter.scala 20:51]
    node _T_6 = add(_T_5_0, _T_5_1) @[FirFilter.scala 22:33]
    node _T_7 = tail(_T_6, 1) @[FirFilter.scala 22:33]
    node _T_5_2 = _T_3 @[FirFilter.scala 20:51 FirFilter.scala 20:51]
    node _T_8 = add(_T_7, _T_5_2) @[FirFilter.scala 22:33]
    node _T_9 = tail(_T_8, 1) @[FirFilter.scala 22:33]
    node _T_5_3 = _T_4 @[FirFilter.scala 20:51 FirFilter.scala 20:51]
    node _T_10 = add(_T_9, _T_5_3) @[FirFilter.scala 22:33]
    node _T_11 = tail(_T_10, 1) @[FirFilter.scala 22:33]
    io_out <= bits(_T_11, 7, 0) @[FirFilter.scala 22:12]
    _T__0 <= io_in @[FirFilter.scala 15:11]
    _T__1 <= _T__0 @[FirFilter.scala 17:13]
    _T__2 <= _T__1 @[FirFilter.scala 17:13]
    _T__3 <= _T__2 @[FirFilter.scala 17:13]
