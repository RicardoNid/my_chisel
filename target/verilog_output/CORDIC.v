module CORDIC(
  input         clock,
  input         reset,
  input  [19:0] io_dataInX,
  input  [19:0] io_dataInY,
  output [49:0] io_dataOutX,
  output [49:0] io_dataOutPhase
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [63:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [63:0] _RAND_23;
  reg [63:0] _RAND_24;
  reg [63:0] _RAND_25;
  reg [63:0] _RAND_26;
  reg [63:0] _RAND_27;
  reg [63:0] _RAND_28;
  reg [63:0] _RAND_29;
  reg [63:0] _RAND_30;
  reg [63:0] _RAND_31;
  reg [63:0] _RAND_32;
  reg [63:0] _RAND_33;
  reg [63:0] _RAND_34;
  reg [63:0] _RAND_35;
  reg [63:0] _RAND_36;
  reg [63:0] _RAND_37;
  reg [63:0] _RAND_38;
  reg [63:0] _RAND_39;
  reg [63:0] _RAND_40;
  reg [63:0] _RAND_41;
  reg [63:0] _RAND_42;
  reg [63:0] _RAND_43;
  reg [63:0] _RAND_44;
  reg [63:0] _RAND_45;
  reg [63:0] _RAND_46;
  reg [63:0] _RAND_47;
  reg [63:0] _RAND_48;
  reg [63:0] _RAND_49;
  reg [63:0] _RAND_50;
  reg [63:0] _RAND_51;
  reg [63:0] _RAND_52;
  reg [63:0] _RAND_53;
  reg [63:0] _RAND_54;
  reg [63:0] _RAND_55;
  reg [63:0] _RAND_56;
  reg [63:0] _RAND_57;
  reg [63:0] _RAND_58;
  reg [63:0] _RAND_59;
  reg [63:0] _RAND_60;
  reg [63:0] _RAND_61;
  reg [63:0] _RAND_62;
  reg [63:0] _RAND_63;
  reg [63:0] _RAND_64;
  reg [63:0] _RAND_65;
  reg [63:0] _RAND_66;
  reg [63:0] _RAND_67;
  reg [63:0] _RAND_68;
  reg [63:0] _RAND_69;
  reg [63:0] _RAND_70;
  reg [63:0] _RAND_71;
  reg [63:0] _RAND_72;
  reg [63:0] _RAND_73;
  reg [63:0] _RAND_74;
  reg [63:0] _RAND_75;
  reg [63:0] _RAND_76;
  reg [63:0] _RAND_77;
  reg [63:0] _RAND_78;
  reg [63:0] _RAND_79;
  reg [63:0] _RAND_80;
  reg [63:0] _RAND_81;
  reg [63:0] _RAND_82;
  reg [63:0] _RAND_83;
  reg [63:0] _RAND_84;
  reg [63:0] _RAND_85;
  reg [63:0] _RAND_86;
  reg [63:0] _RAND_87;
  reg [63:0] _RAND_88;
  reg [63:0] _RAND_89;
  reg [63:0] _RAND_90;
  reg [63:0] _RAND_91;
`endif // RANDOMIZE_REG_INIT
  reg [49:0] regsX_0; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_1; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_2; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_3; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_4; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_5; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_6; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_7; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_8; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_9; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_10; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_11; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_12; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_13; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_14; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_15; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_16; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_17; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_18; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_19; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_20; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_21; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_22; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_23; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_24; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_25; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_26; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_27; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_28; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_29; // @[CORDIC.scala 55:18]
  reg [49:0] regsX_30; // @[CORDIC.scala 55:18]
  reg [49:0] regsY_0; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_1; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_2; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_3; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_4; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_5; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_6; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_7; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_8; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_9; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_10; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_11; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_12; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_13; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_14; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_15; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_16; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_17; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_18; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_19; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_20; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_21; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_22; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_23; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_24; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_25; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_26; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_27; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_28; // @[CORDIC.scala 56:18]
  reg [49:0] regsY_29; // @[CORDIC.scala 56:18]
  reg [49:0] regsPhase_0; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_1; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_2; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_3; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_4; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_5; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_6; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_7; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_8; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_9; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_10; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_11; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_12; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_13; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_14; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_15; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_16; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_17; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_18; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_19; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_20; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_21; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_22; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_23; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_24; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_25; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_26; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_27; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_28; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_29; // @[CORDIC.scala 57:22]
  reg [49:0] regsPhase_30; // @[CORDIC.scala 57:22]
  wire [20:0] _GEN_6 = {{1{io_dataInY[19]}},io_dataInY}; // @[CORDIC.scala 67:39]
  wire  _T = $signed(_GEN_6) > 21'sh0; // @[CORDIC.scala 67:39]
  wire [1:0] plusOrMinus = _T ? 2'h2 : 2'h1; // @[CORDIC.scala 67:23]
  wire [20:0] _GEN_7 = {{1{io_dataInX[19]}},io_dataInX}; // @[CORDIC.scala 68:33]
  wire  _T_2 = $signed(_GEN_7) > 21'sh0; // @[CORDIC.scala 68:33]
  wire [1:0] phase = _T_2 ? 2'h0 : plusOrMinus; // @[CORDIC.scala 68:17]
  wire  _T_4 = phase == 2'h0; // @[CORDIC.scala 76:14]
  wire  _T_5 = phase == 2'h1; // @[CORDIC.scala 80:20]
  wire [20:0] _T_8 = 21'sh0 - $signed(_GEN_6); // @[CORDIC.scala 81:22]
  wire [19:0] _T_11 = 20'sh0 - 20'sh3243f; // @[CORDIC.scala 83:36]
  wire [20:0] _T_14 = 21'sh0 - $signed(_GEN_7); // @[CORDIC.scala 86:22]
  wire [20:0] _GEN_0 = _T_5 ? $signed(_T_8) : $signed({{1{io_dataInY[19]}},io_dataInY}); // @[CORDIC.scala 80:32]
  wire [20:0] _GEN_1 = _T_5 ? $signed({{1{io_dataInX[19]}},io_dataInX}) : $signed(_T_14); // @[CORDIC.scala 80:32]
  wire [19:0] _GEN_2 = _T_5 ? $signed(_T_11) : $signed(20'sh3243f); // @[CORDIC.scala 80:32]
  wire [20:0] _GEN_3 = _T_4 ? $signed({{1{io_dataInX[19]}},io_dataInX}) : $signed(_GEN_0); // @[CORDIC.scala 76:24]
  wire [20:0] _GEN_4 = _T_4 ? $signed({{1{io_dataInY[19]}},io_dataInY}) : $signed(_GEN_1); // @[CORDIC.scala 76:24]
  wire [19:0] _GEN_5 = _T_4 ? $signed(20'sh0) : $signed(_GEN_2); // @[CORDIC.scala 76:24]
  wire [48:0] _T_20 = regsX_0[49:1]; // @[CORDIC.scala 97:32]
  wire [49:0] _T_21 = {$signed(_T_20), 1'h0}; // @[CORDIC.scala 97:37]
  wire [48:0] _T_22 = regsY_0[49:1]; // @[CORDIC.scala 98:32]
  wire [49:0] _T_23 = {$signed(_T_22), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_25 = $signed(regsY_0) < 50'sh0; // @[CORDIC.scala 109:40]
  wire [20:0] _GEN_10 = _T_23[49:29]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_19 = _GEN_10[19:0]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_12 = {$signed(_T_19), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_13 = {{1{_GEN_12[48]}},_GEN_12}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_29 = $signed(regsX_0) - $signed(_GEN_13); // @[CORDIC.scala 117:53]
  wire [49:0] _T_32 = $signed(regsX_0) + $signed(_GEN_13); // @[CORDIC.scala 117:78]
  wire [20:0] _GEN_16 = _T_21[49:29]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_18 = _GEN_16[19:0]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_18 = {$signed(_T_18), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_19 = {{1{_GEN_18[48]}},_GEN_18}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_36 = $signed(regsY_0) + $signed(_GEN_19); // @[CORDIC.scala 118:52]
  wire [49:0] _T_39 = $signed(regsY_0) - $signed(_GEN_19); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_22 = {{1{regsPhase_0[49]}},regsPhase_0}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_43 = $signed(_GEN_22) - 51'sh648800000000; // @[CORDIC.scala 119:60]
  wire [50:0] _T_46 = $signed(_GEN_22) + 51'sh648800000000; // @[CORDIC.scala 119:99]
  wire [50:0] _T_47 = _T_25 ? $signed(_T_43) : $signed(_T_46); // @[CORDIC.scala 119:24]
  wire [47:0] _T_50 = regsX_1[49:2]; // @[CORDIC.scala 97:32]
  wire [48:0] _T_51 = {$signed(_T_50), 1'h0}; // @[CORDIC.scala 97:37]
  wire [47:0] _T_52 = regsY_1[49:2]; // @[CORDIC.scala 98:32]
  wire [48:0] _T_53 = {$signed(_T_52), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_55 = $signed(regsY_1) < 50'sh0; // @[CORDIC.scala 109:40]
  wire [19:0] _T_49 = _T_53[48:29]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_24 = {$signed(_T_49), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_25 = {{1{_GEN_24[48]}},_GEN_24}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_59 = $signed(regsX_1) - $signed(_GEN_25); // @[CORDIC.scala 117:53]
  wire [49:0] _T_62 = $signed(regsX_1) + $signed(_GEN_25); // @[CORDIC.scala 117:78]
  wire [19:0] _T_48 = _T_51[48:29]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_28 = {$signed(_T_48), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_29 = {{1{_GEN_28[48]}},_GEN_28}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_66 = $signed(regsY_1) + $signed(_GEN_29); // @[CORDIC.scala 118:52]
  wire [49:0] _T_69 = $signed(regsY_1) - $signed(_GEN_29); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_32 = {{1{regsPhase_1[49]}},regsPhase_1}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_73 = $signed(_GEN_32) - 51'sh3b5900000000; // @[CORDIC.scala 119:60]
  wire [50:0] _T_76 = $signed(_GEN_32) + 51'sh3b5900000000; // @[CORDIC.scala 119:99]
  wire [50:0] _T_77 = _T_55 ? $signed(_T_73) : $signed(_T_76); // @[CORDIC.scala 119:24]
  wire [46:0] _T_80 = regsX_2[49:3]; // @[CORDIC.scala 97:32]
  wire [47:0] _T_81 = {$signed(_T_80), 1'h0}; // @[CORDIC.scala 97:37]
  wire [46:0] _T_82 = regsY_2[49:3]; // @[CORDIC.scala 98:32]
  wire [47:0] _T_83 = {$signed(_T_82), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_85 = $signed(regsY_2) < 50'sh0; // @[CORDIC.scala 109:40]
  wire [18:0] _GEN_34 = _T_83[47:29]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_79 = {{1{_GEN_34[18]}},_GEN_34}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_35 = {$signed(_T_79), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_36 = {{1{_GEN_35[48]}},_GEN_35}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_89 = $signed(regsX_2) - $signed(_GEN_36); // @[CORDIC.scala 117:53]
  wire [49:0] _T_92 = $signed(regsX_2) + $signed(_GEN_36); // @[CORDIC.scala 117:78]
  wire [18:0] _GEN_39 = _T_81[47:29]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_78 = {{1{_GEN_39[18]}},_GEN_39}; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_40 = {$signed(_T_78), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_41 = {{1{_GEN_40[48]}},_GEN_40}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_96 = $signed(regsY_2) + $signed(_GEN_41); // @[CORDIC.scala 118:52]
  wire [49:0] _T_99 = $signed(regsY_2) - $signed(_GEN_41); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_44 = {{1{regsPhase_2[49]}},regsPhase_2}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_103 = $signed(_GEN_44) - 51'sh1f5b80000000; // @[CORDIC.scala 119:60]
  wire [50:0] _T_106 = $signed(_GEN_44) + 51'sh1f5b80000000; // @[CORDIC.scala 119:99]
  wire [50:0] _T_107 = _T_85 ? $signed(_T_103) : $signed(_T_106); // @[CORDIC.scala 119:24]
  wire [45:0] _T_110 = regsX_3[49:4]; // @[CORDIC.scala 97:32]
  wire [46:0] _T_111 = {$signed(_T_110), 1'h0}; // @[CORDIC.scala 97:37]
  wire [45:0] _T_112 = regsY_3[49:4]; // @[CORDIC.scala 98:32]
  wire [46:0] _T_113 = {$signed(_T_112), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_115 = $signed(regsY_3) < 50'sh0; // @[CORDIC.scala 109:40]
  wire [17:0] _GEN_46 = _T_113[46:29]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_109 = {{2{_GEN_46[17]}},_GEN_46}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_47 = {$signed(_T_109), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_48 = {{1{_GEN_47[48]}},_GEN_47}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_119 = $signed(regsX_3) - $signed(_GEN_48); // @[CORDIC.scala 117:53]
  wire [49:0] _T_122 = $signed(regsX_3) + $signed(_GEN_48); // @[CORDIC.scala 117:78]
  wire [17:0] _GEN_51 = _T_111[46:29]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_108 = {{2{_GEN_51[17]}},_GEN_51}; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_52 = {$signed(_T_108), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_53 = {{1{_GEN_52[48]}},_GEN_52}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_126 = $signed(regsY_3) + $signed(_GEN_53); // @[CORDIC.scala 118:52]
  wire [49:0] _T_129 = $signed(regsY_3) - $signed(_GEN_53); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_56 = {{1{regsPhase_3[49]}},regsPhase_3}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_133 = $signed(_GEN_56) - 51'shfeb00000000; // @[CORDIC.scala 119:60]
  wire [50:0] _T_136 = $signed(_GEN_56) + 51'shfeb00000000; // @[CORDIC.scala 119:99]
  wire [50:0] _T_137 = _T_115 ? $signed(_T_133) : $signed(_T_136); // @[CORDIC.scala 119:24]
  wire [44:0] _T_140 = regsX_4[49:5]; // @[CORDIC.scala 97:32]
  wire [45:0] _T_141 = {$signed(_T_140), 1'h0}; // @[CORDIC.scala 97:37]
  wire [44:0] _T_142 = regsY_4[49:5]; // @[CORDIC.scala 98:32]
  wire [45:0] _T_143 = {$signed(_T_142), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_145 = $signed(regsY_4) < 50'sh0; // @[CORDIC.scala 109:40]
  wire [16:0] _GEN_58 = _T_143[45:29]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_139 = {{3{_GEN_58[16]}},_GEN_58}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_59 = {$signed(_T_139), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_60 = {{1{_GEN_59[48]}},_GEN_59}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_149 = $signed(regsX_4) - $signed(_GEN_60); // @[CORDIC.scala 117:53]
  wire [49:0] _T_152 = $signed(regsX_4) + $signed(_GEN_60); // @[CORDIC.scala 117:78]
  wire [16:0] _GEN_63 = _T_141[45:29]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_138 = {{3{_GEN_63[16]}},_GEN_63}; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_64 = {$signed(_T_138), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_65 = {{1{_GEN_64[48]}},_GEN_64}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_156 = $signed(regsY_4) + $signed(_GEN_65); // @[CORDIC.scala 118:52]
  wire [49:0] _T_159 = $signed(regsY_4) - $signed(_GEN_65); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_68 = {{1{regsPhase_4[49]}},regsPhase_4}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_163 = $signed(_GEN_68) - 51'sh7fd80000000; // @[CORDIC.scala 119:60]
  wire [50:0] _T_166 = $signed(_GEN_68) + 51'sh7fd80000000; // @[CORDIC.scala 119:99]
  wire [50:0] _T_167 = _T_145 ? $signed(_T_163) : $signed(_T_166); // @[CORDIC.scala 119:24]
  wire [43:0] _T_170 = regsX_5[49:6]; // @[CORDIC.scala 97:32]
  wire [44:0] _T_171 = {$signed(_T_170), 1'h0}; // @[CORDIC.scala 97:37]
  wire [43:0] _T_172 = regsY_5[49:6]; // @[CORDIC.scala 98:32]
  wire [44:0] _T_173 = {$signed(_T_172), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_175 = $signed(regsY_5) < 50'sh0; // @[CORDIC.scala 109:40]
  wire [15:0] _GEN_70 = _T_173[44:29]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_169 = {{4{_GEN_70[15]}},_GEN_70}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_71 = {$signed(_T_169), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_72 = {{1{_GEN_71[48]}},_GEN_71}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_179 = $signed(regsX_5) - $signed(_GEN_72); // @[CORDIC.scala 117:53]
  wire [49:0] _T_182 = $signed(regsX_5) + $signed(_GEN_72); // @[CORDIC.scala 117:78]
  wire [15:0] _GEN_75 = _T_171[44:29]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_168 = {{4{_GEN_75[15]}},_GEN_75}; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_76 = {$signed(_T_168), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_77 = {{1{_GEN_76[48]}},_GEN_76}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_186 = $signed(regsY_5) + $signed(_GEN_77); // @[CORDIC.scala 118:52]
  wire [49:0] _T_189 = $signed(regsY_5) - $signed(_GEN_77); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_80 = {{1{regsPhase_5[49]}},regsPhase_5}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_193 = $signed(_GEN_80) - 51'sh3ff80000000; // @[CORDIC.scala 119:60]
  wire [50:0] _T_196 = $signed(_GEN_80) + 51'sh3ff80000000; // @[CORDIC.scala 119:99]
  wire [50:0] _T_197 = _T_175 ? $signed(_T_193) : $signed(_T_196); // @[CORDIC.scala 119:24]
  wire [42:0] _T_200 = regsX_6[49:7]; // @[CORDIC.scala 97:32]
  wire [43:0] _T_201 = {$signed(_T_200), 1'h0}; // @[CORDIC.scala 97:37]
  wire [42:0] _T_202 = regsY_6[49:7]; // @[CORDIC.scala 98:32]
  wire [43:0] _T_203 = {$signed(_T_202), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_205 = $signed(regsY_6) < 50'sh0; // @[CORDIC.scala 109:40]
  wire [14:0] _GEN_82 = _T_203[43:29]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_199 = {{5{_GEN_82[14]}},_GEN_82}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_83 = {$signed(_T_199), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_84 = {{1{_GEN_83[48]}},_GEN_83}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_209 = $signed(regsX_6) - $signed(_GEN_84); // @[CORDIC.scala 117:53]
  wire [49:0] _T_212 = $signed(regsX_6) + $signed(_GEN_84); // @[CORDIC.scala 117:78]
  wire [14:0] _GEN_87 = _T_201[43:29]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_198 = {{5{_GEN_87[14]}},_GEN_87}; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_88 = {$signed(_T_198), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_89 = {{1{_GEN_88[48]}},_GEN_88}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_216 = $signed(regsY_6) + $signed(_GEN_89); // @[CORDIC.scala 118:52]
  wire [49:0] _T_219 = $signed(regsY_6) - $signed(_GEN_89); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_92 = {{1{regsPhase_6[49]}},regsPhase_6}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_223 = $signed(_GEN_92) - 51'sh20000000000; // @[CORDIC.scala 119:60]
  wire [50:0] _T_226 = $signed(_GEN_92) + 51'sh20000000000; // @[CORDIC.scala 119:99]
  wire [50:0] _T_227 = _T_205 ? $signed(_T_223) : $signed(_T_226); // @[CORDIC.scala 119:24]
  wire [41:0] _T_230 = regsX_7[49:8]; // @[CORDIC.scala 97:32]
  wire [42:0] _T_231 = {$signed(_T_230), 1'h0}; // @[CORDIC.scala 97:37]
  wire [41:0] _T_232 = regsY_7[49:8]; // @[CORDIC.scala 98:32]
  wire [42:0] _T_233 = {$signed(_T_232), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_235 = $signed(regsY_7) < 50'sh0; // @[CORDIC.scala 109:40]
  wire [13:0] _GEN_94 = _T_233[42:29]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_229 = {{6{_GEN_94[13]}},_GEN_94}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_95 = {$signed(_T_229), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_96 = {{1{_GEN_95[48]}},_GEN_95}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_239 = $signed(regsX_7) - $signed(_GEN_96); // @[CORDIC.scala 117:53]
  wire [49:0] _T_242 = $signed(regsX_7) + $signed(_GEN_96); // @[CORDIC.scala 117:78]
  wire [13:0] _GEN_99 = _T_231[42:29]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_228 = {{6{_GEN_99[13]}},_GEN_99}; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_100 = {$signed(_T_228), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_101 = {{1{_GEN_100[48]}},_GEN_100}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_246 = $signed(regsY_7) + $signed(_GEN_101); // @[CORDIC.scala 118:52]
  wire [49:0] _T_249 = $signed(regsY_7) - $signed(_GEN_101); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_104 = {{1{regsPhase_7[49]}},regsPhase_7}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_253 = $signed(_GEN_104) - 51'sh10000000000; // @[CORDIC.scala 119:60]
  wire [50:0] _T_256 = $signed(_GEN_104) + 51'sh10000000000; // @[CORDIC.scala 119:99]
  wire [50:0] _T_257 = _T_235 ? $signed(_T_253) : $signed(_T_256); // @[CORDIC.scala 119:24]
  wire [40:0] _T_260 = regsX_8[49:9]; // @[CORDIC.scala 97:32]
  wire [41:0] _T_261 = {$signed(_T_260), 1'h0}; // @[CORDIC.scala 97:37]
  wire [40:0] _T_262 = regsY_8[49:9]; // @[CORDIC.scala 98:32]
  wire [41:0] _T_263 = {$signed(_T_262), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_265 = $signed(regsY_8) < 50'sh0; // @[CORDIC.scala 109:40]
  wire [12:0] _GEN_106 = _T_263[41:29]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_259 = {{7{_GEN_106[12]}},_GEN_106}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_107 = {$signed(_T_259), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_108 = {{1{_GEN_107[48]}},_GEN_107}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_269 = $signed(regsX_8) - $signed(_GEN_108); // @[CORDIC.scala 117:53]
  wire [49:0] _T_272 = $signed(regsX_8) + $signed(_GEN_108); // @[CORDIC.scala 117:78]
  wire [12:0] _GEN_111 = _T_261[41:29]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_258 = {{7{_GEN_111[12]}},_GEN_111}; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_112 = {$signed(_T_258), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_113 = {{1{_GEN_112[48]}},_GEN_112}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_276 = $signed(regsY_8) + $signed(_GEN_113); // @[CORDIC.scala 118:52]
  wire [49:0] _T_279 = $signed(regsY_8) - $signed(_GEN_113); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_116 = {{1{regsPhase_8[49]}},regsPhase_8}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_283 = $signed(_GEN_116) - 51'sh8000000000; // @[CORDIC.scala 119:60]
  wire [50:0] _T_286 = $signed(_GEN_116) + 51'sh8000000000; // @[CORDIC.scala 119:99]
  wire [50:0] _T_287 = _T_265 ? $signed(_T_283) : $signed(_T_286); // @[CORDIC.scala 119:24]
  wire [39:0] _T_290 = regsX_9[49:10]; // @[CORDIC.scala 97:32]
  wire [40:0] _T_291 = {$signed(_T_290), 1'h0}; // @[CORDIC.scala 97:37]
  wire [39:0] _T_292 = regsY_9[49:10]; // @[CORDIC.scala 98:32]
  wire [40:0] _T_293 = {$signed(_T_292), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_295 = $signed(regsY_9) < 50'sh0; // @[CORDIC.scala 109:40]
  wire [11:0] _GEN_118 = _T_293[40:29]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_289 = {{8{_GEN_118[11]}},_GEN_118}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_119 = {$signed(_T_289), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_120 = {{1{_GEN_119[48]}},_GEN_119}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_299 = $signed(regsX_9) - $signed(_GEN_120); // @[CORDIC.scala 117:53]
  wire [49:0] _T_302 = $signed(regsX_9) + $signed(_GEN_120); // @[CORDIC.scala 117:78]
  wire [11:0] _GEN_123 = _T_291[40:29]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_288 = {{8{_GEN_123[11]}},_GEN_123}; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_124 = {$signed(_T_288), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_125 = {{1{_GEN_124[48]}},_GEN_124}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_306 = $signed(regsY_9) + $signed(_GEN_125); // @[CORDIC.scala 118:52]
  wire [49:0] _T_309 = $signed(regsY_9) - $signed(_GEN_125); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_128 = {{1{regsPhase_9[49]}},regsPhase_9}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_313 = $signed(_GEN_128) - 51'sh4000000000; // @[CORDIC.scala 119:60]
  wire [50:0] _T_316 = $signed(_GEN_128) + 51'sh4000000000; // @[CORDIC.scala 119:99]
  wire [50:0] _T_317 = _T_295 ? $signed(_T_313) : $signed(_T_316); // @[CORDIC.scala 119:24]
  wire [38:0] _T_320 = regsX_10[49:11]; // @[CORDIC.scala 97:32]
  wire [39:0] _T_321 = {$signed(_T_320), 1'h0}; // @[CORDIC.scala 97:37]
  wire [38:0] _T_322 = regsY_10[49:11]; // @[CORDIC.scala 98:32]
  wire [39:0] _T_323 = {$signed(_T_322), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_325 = $signed(regsY_10) < 50'sh0; // @[CORDIC.scala 109:40]
  wire [10:0] _GEN_130 = _T_323[39:29]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_319 = {{9{_GEN_130[10]}},_GEN_130}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_131 = {$signed(_T_319), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_132 = {{1{_GEN_131[48]}},_GEN_131}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_329 = $signed(regsX_10) - $signed(_GEN_132); // @[CORDIC.scala 117:53]
  wire [49:0] _T_332 = $signed(regsX_10) + $signed(_GEN_132); // @[CORDIC.scala 117:78]
  wire [10:0] _GEN_135 = _T_321[39:29]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_318 = {{9{_GEN_135[10]}},_GEN_135}; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_136 = {$signed(_T_318), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_137 = {{1{_GEN_136[48]}},_GEN_136}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_336 = $signed(regsY_10) + $signed(_GEN_137); // @[CORDIC.scala 118:52]
  wire [49:0] _T_339 = $signed(regsY_10) - $signed(_GEN_137); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_140 = {{1{regsPhase_10[49]}},regsPhase_10}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_343 = $signed(_GEN_140) - 51'sh2000000000; // @[CORDIC.scala 119:60]
  wire [50:0] _T_346 = $signed(_GEN_140) + 51'sh2000000000; // @[CORDIC.scala 119:99]
  wire [50:0] _T_347 = _T_325 ? $signed(_T_343) : $signed(_T_346); // @[CORDIC.scala 119:24]
  wire [37:0] _T_350 = regsX_11[49:12]; // @[CORDIC.scala 97:32]
  wire [38:0] _T_351 = {$signed(_T_350), 1'h0}; // @[CORDIC.scala 97:37]
  wire [37:0] _T_352 = regsY_11[49:12]; // @[CORDIC.scala 98:32]
  wire [38:0] _T_353 = {$signed(_T_352), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_355 = $signed(regsY_11) < 50'sh0; // @[CORDIC.scala 109:40]
  wire [9:0] _GEN_142 = _T_353[38:29]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_349 = {{10{_GEN_142[9]}},_GEN_142}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_143 = {$signed(_T_349), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_144 = {{1{_GEN_143[48]}},_GEN_143}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_359 = $signed(regsX_11) - $signed(_GEN_144); // @[CORDIC.scala 117:53]
  wire [49:0] _T_362 = $signed(regsX_11) + $signed(_GEN_144); // @[CORDIC.scala 117:78]
  wire [9:0] _GEN_147 = _T_351[38:29]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_348 = {{10{_GEN_147[9]}},_GEN_147}; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_148 = {$signed(_T_348), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_149 = {{1{_GEN_148[48]}},_GEN_148}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_366 = $signed(regsY_11) + $signed(_GEN_149); // @[CORDIC.scala 118:52]
  wire [49:0] _T_369 = $signed(regsY_11) - $signed(_GEN_149); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_152 = {{1{regsPhase_11[49]}},regsPhase_11}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_373 = $signed(_GEN_152) - 51'sh1000000000; // @[CORDIC.scala 119:60]
  wire [50:0] _T_376 = $signed(_GEN_152) + 51'sh1000000000; // @[CORDIC.scala 119:99]
  wire [50:0] _T_377 = _T_355 ? $signed(_T_373) : $signed(_T_376); // @[CORDIC.scala 119:24]
  wire [36:0] _T_380 = regsX_12[49:13]; // @[CORDIC.scala 97:32]
  wire [37:0] _T_381 = {$signed(_T_380), 1'h0}; // @[CORDIC.scala 97:37]
  wire [36:0] _T_382 = regsY_12[49:13]; // @[CORDIC.scala 98:32]
  wire [37:0] _T_383 = {$signed(_T_382), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_385 = $signed(regsY_12) < 50'sh0; // @[CORDIC.scala 109:40]
  wire [8:0] _GEN_154 = _T_383[37:29]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_379 = {{11{_GEN_154[8]}},_GEN_154}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_155 = {$signed(_T_379), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_156 = {{1{_GEN_155[48]}},_GEN_155}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_389 = $signed(regsX_12) - $signed(_GEN_156); // @[CORDIC.scala 117:53]
  wire [49:0] _T_392 = $signed(regsX_12) + $signed(_GEN_156); // @[CORDIC.scala 117:78]
  wire [8:0] _GEN_159 = _T_381[37:29]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_378 = {{11{_GEN_159[8]}},_GEN_159}; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_160 = {$signed(_T_378), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_161 = {{1{_GEN_160[48]}},_GEN_160}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_396 = $signed(regsY_12) + $signed(_GEN_161); // @[CORDIC.scala 118:52]
  wire [49:0] _T_399 = $signed(regsY_12) - $signed(_GEN_161); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_164 = {{1{regsPhase_12[49]}},regsPhase_12}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_403 = $signed(_GEN_164) - 51'sh800000000; // @[CORDIC.scala 119:60]
  wire [50:0] _T_406 = $signed(_GEN_164) + 51'sh800000000; // @[CORDIC.scala 119:99]
  wire [50:0] _T_407 = _T_385 ? $signed(_T_403) : $signed(_T_406); // @[CORDIC.scala 119:24]
  wire [35:0] _T_410 = regsX_13[49:14]; // @[CORDIC.scala 97:32]
  wire [36:0] _T_411 = {$signed(_T_410), 1'h0}; // @[CORDIC.scala 97:37]
  wire [35:0] _T_412 = regsY_13[49:14]; // @[CORDIC.scala 98:32]
  wire [36:0] _T_413 = {$signed(_T_412), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_415 = $signed(regsY_13) < 50'sh0; // @[CORDIC.scala 109:40]
  wire [7:0] _GEN_166 = _T_413[36:29]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_409 = {{12{_GEN_166[7]}},_GEN_166}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_167 = {$signed(_T_409), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_168 = {{1{_GEN_167[48]}},_GEN_167}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_419 = $signed(regsX_13) - $signed(_GEN_168); // @[CORDIC.scala 117:53]
  wire [49:0] _T_422 = $signed(regsX_13) + $signed(_GEN_168); // @[CORDIC.scala 117:78]
  wire [7:0] _GEN_171 = _T_411[36:29]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_408 = {{12{_GEN_171[7]}},_GEN_171}; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_172 = {$signed(_T_408), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_173 = {{1{_GEN_172[48]}},_GEN_172}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_426 = $signed(regsY_13) + $signed(_GEN_173); // @[CORDIC.scala 118:52]
  wire [49:0] _T_429 = $signed(regsY_13) - $signed(_GEN_173); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_176 = {{1{regsPhase_13[49]}},regsPhase_13}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_433 = $signed(_GEN_176) - 51'sh400000000; // @[CORDIC.scala 119:60]
  wire [50:0] _T_436 = $signed(_GEN_176) + 51'sh400000000; // @[CORDIC.scala 119:99]
  wire [50:0] _T_437 = _T_415 ? $signed(_T_433) : $signed(_T_436); // @[CORDIC.scala 119:24]
  wire [34:0] _T_440 = regsX_14[49:15]; // @[CORDIC.scala 97:32]
  wire [35:0] _T_441 = {$signed(_T_440), 1'h0}; // @[CORDIC.scala 97:37]
  wire [34:0] _T_442 = regsY_14[49:15]; // @[CORDIC.scala 98:32]
  wire [35:0] _T_443 = {$signed(_T_442), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_445 = $signed(regsY_14) < 50'sh0; // @[CORDIC.scala 109:40]
  wire [6:0] _GEN_178 = _T_443[35:29]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_439 = {{13{_GEN_178[6]}},_GEN_178}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_179 = {$signed(_T_439), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_180 = {{1{_GEN_179[48]}},_GEN_179}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_449 = $signed(regsX_14) - $signed(_GEN_180); // @[CORDIC.scala 117:53]
  wire [49:0] _T_452 = $signed(regsX_14) + $signed(_GEN_180); // @[CORDIC.scala 117:78]
  wire [6:0] _GEN_183 = _T_441[35:29]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_438 = {{13{_GEN_183[6]}},_GEN_183}; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_184 = {$signed(_T_438), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_185 = {{1{_GEN_184[48]}},_GEN_184}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_456 = $signed(regsY_14) + $signed(_GEN_185); // @[CORDIC.scala 118:52]
  wire [49:0] _T_459 = $signed(regsY_14) - $signed(_GEN_185); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_188 = {{1{regsPhase_14[49]}},regsPhase_14}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_463 = $signed(_GEN_188) - 51'sh200000000; // @[CORDIC.scala 119:60]
  wire [50:0] _T_466 = $signed(_GEN_188) + 51'sh200000000; // @[CORDIC.scala 119:99]
  wire [50:0] _T_467 = _T_445 ? $signed(_T_463) : $signed(_T_466); // @[CORDIC.scala 119:24]
  wire [33:0] _T_470 = regsX_15[49:16]; // @[CORDIC.scala 97:32]
  wire [34:0] _T_471 = {$signed(_T_470), 1'h0}; // @[CORDIC.scala 97:37]
  wire [33:0] _T_472 = regsY_15[49:16]; // @[CORDIC.scala 98:32]
  wire [34:0] _T_473 = {$signed(_T_472), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_475 = $signed(regsY_15) < 50'sh0; // @[CORDIC.scala 109:40]
  wire [5:0] _GEN_190 = _T_473[34:29]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_469 = {{14{_GEN_190[5]}},_GEN_190}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_191 = {$signed(_T_469), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_192 = {{1{_GEN_191[48]}},_GEN_191}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_479 = $signed(regsX_15) - $signed(_GEN_192); // @[CORDIC.scala 117:53]
  wire [49:0] _T_482 = $signed(regsX_15) + $signed(_GEN_192); // @[CORDIC.scala 117:78]
  wire [5:0] _GEN_195 = _T_471[34:29]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_468 = {{14{_GEN_195[5]}},_GEN_195}; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_196 = {$signed(_T_468), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_197 = {{1{_GEN_196[48]}},_GEN_196}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_486 = $signed(regsY_15) + $signed(_GEN_197); // @[CORDIC.scala 118:52]
  wire [49:0] _T_489 = $signed(regsY_15) - $signed(_GEN_197); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_200 = {{1{regsPhase_15[49]}},regsPhase_15}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_493 = $signed(_GEN_200) - 51'sh100000000; // @[CORDIC.scala 119:60]
  wire [50:0] _T_496 = $signed(_GEN_200) + 51'sh100000000; // @[CORDIC.scala 119:99]
  wire [50:0] _T_497 = _T_475 ? $signed(_T_493) : $signed(_T_496); // @[CORDIC.scala 119:24]
  wire [32:0] _T_500 = regsX_16[49:17]; // @[CORDIC.scala 97:32]
  wire [33:0] _T_501 = {$signed(_T_500), 1'h0}; // @[CORDIC.scala 97:37]
  wire [32:0] _T_502 = regsY_16[49:17]; // @[CORDIC.scala 98:32]
  wire [33:0] _T_503 = {$signed(_T_502), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_505 = $signed(regsY_16) < 50'sh0; // @[CORDIC.scala 109:40]
  wire [4:0] _GEN_202 = _T_503[33:29]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_499 = {{15{_GEN_202[4]}},_GEN_202}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_203 = {$signed(_T_499), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_204 = {{1{_GEN_203[48]}},_GEN_203}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_509 = $signed(regsX_16) - $signed(_GEN_204); // @[CORDIC.scala 117:53]
  wire [49:0] _T_512 = $signed(regsX_16) + $signed(_GEN_204); // @[CORDIC.scala 117:78]
  wire [4:0] _GEN_207 = _T_501[33:29]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_498 = {{15{_GEN_207[4]}},_GEN_207}; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_208 = {$signed(_T_498), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_209 = {{1{_GEN_208[48]}},_GEN_208}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_516 = $signed(regsY_16) + $signed(_GEN_209); // @[CORDIC.scala 118:52]
  wire [49:0] _T_519 = $signed(regsY_16) - $signed(_GEN_209); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_212 = {{1{regsPhase_16[49]}},regsPhase_16}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_523 = $signed(_GEN_212) - 51'sh80000000; // @[CORDIC.scala 119:60]
  wire [50:0] _T_526 = $signed(_GEN_212) + 51'sh80000000; // @[CORDIC.scala 119:99]
  wire [50:0] _T_527 = _T_505 ? $signed(_T_523) : $signed(_T_526); // @[CORDIC.scala 119:24]
  wire [31:0] _T_530 = regsX_17[49:18]; // @[CORDIC.scala 97:32]
  wire [32:0] _T_531 = {$signed(_T_530), 1'h0}; // @[CORDIC.scala 97:37]
  wire [31:0] _T_532 = regsY_17[49:18]; // @[CORDIC.scala 98:32]
  wire [32:0] _T_533 = {$signed(_T_532), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_535 = $signed(regsY_17) < 50'sh0; // @[CORDIC.scala 109:40]
  wire [3:0] _GEN_214 = _T_533[32:29]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_529 = {{16{_GEN_214[3]}},_GEN_214}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_215 = {$signed(_T_529), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_216 = {{1{_GEN_215[48]}},_GEN_215}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_539 = $signed(regsX_17) - $signed(_GEN_216); // @[CORDIC.scala 117:53]
  wire [49:0] _T_542 = $signed(regsX_17) + $signed(_GEN_216); // @[CORDIC.scala 117:78]
  wire [3:0] _GEN_219 = _T_531[32:29]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_528 = {{16{_GEN_219[3]}},_GEN_219}; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_220 = {$signed(_T_528), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_221 = {{1{_GEN_220[48]}},_GEN_220}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_546 = $signed(regsY_17) + $signed(_GEN_221); // @[CORDIC.scala 118:52]
  wire [49:0] _T_549 = $signed(regsY_17) - $signed(_GEN_221); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_224 = {{1{regsPhase_17[49]}},regsPhase_17}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_553 = $signed(_GEN_224) - 51'sh0; // @[CORDIC.scala 119:60]
  wire [51:0] _T_554 = {{2{regsPhase_17[49]}},regsPhase_17}; // @[CORDIC.scala 119:99]
  wire [50:0] _T_556 = _T_554[50:0]; // @[CORDIC.scala 119:99]
  wire [50:0] _T_557 = _T_535 ? $signed(_T_553) : $signed(_T_556); // @[CORDIC.scala 119:24]
  wire [30:0] _T_560 = regsX_18[49:19]; // @[CORDIC.scala 97:32]
  wire [31:0] _T_561 = {$signed(_T_560), 1'h0}; // @[CORDIC.scala 97:37]
  wire [30:0] _T_562 = regsY_18[49:19]; // @[CORDIC.scala 98:32]
  wire [31:0] _T_563 = {$signed(_T_562), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_565 = $signed(regsY_18) < 50'sh0; // @[CORDIC.scala 109:40]
  wire [2:0] _GEN_225 = _T_563[31:29]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_559 = {{17{_GEN_225[2]}},_GEN_225}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_226 = {$signed(_T_559), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_227 = {{1{_GEN_226[48]}},_GEN_226}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_569 = $signed(regsX_18) - $signed(_GEN_227); // @[CORDIC.scala 117:53]
  wire [49:0] _T_572 = $signed(regsX_18) + $signed(_GEN_227); // @[CORDIC.scala 117:78]
  wire [2:0] _GEN_230 = _T_561[31:29]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_558 = {{17{_GEN_230[2]}},_GEN_230}; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_231 = {$signed(_T_558), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_232 = {{1{_GEN_231[48]}},_GEN_231}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_576 = $signed(regsY_18) + $signed(_GEN_232); // @[CORDIC.scala 118:52]
  wire [49:0] _T_579 = $signed(regsY_18) - $signed(_GEN_232); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_235 = {{1{regsPhase_18[49]}},regsPhase_18}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_583 = $signed(_GEN_235) - 51'sh0; // @[CORDIC.scala 119:60]
  wire [51:0] _T_584 = {{2{regsPhase_18[49]}},regsPhase_18}; // @[CORDIC.scala 119:99]
  wire [50:0] _T_586 = _T_584[50:0]; // @[CORDIC.scala 119:99]
  wire [50:0] _T_587 = _T_565 ? $signed(_T_583) : $signed(_T_586); // @[CORDIC.scala 119:24]
  wire [29:0] _T_590 = regsX_19[49:20]; // @[CORDIC.scala 97:32]
  wire [30:0] _T_591 = {$signed(_T_590), 1'h0}; // @[CORDIC.scala 97:37]
  wire [29:0] _T_592 = regsY_19[49:20]; // @[CORDIC.scala 98:32]
  wire [30:0] _T_593 = {$signed(_T_592), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_595 = $signed(regsY_19) < 50'sh0; // @[CORDIC.scala 109:40]
  wire [1:0] _GEN_236 = _T_593[30:29]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_589 = {{18{_GEN_236[1]}},_GEN_236}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_237 = {$signed(_T_589), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_238 = {{1{_GEN_237[48]}},_GEN_237}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_599 = $signed(regsX_19) - $signed(_GEN_238); // @[CORDIC.scala 117:53]
  wire [49:0] _T_602 = $signed(regsX_19) + $signed(_GEN_238); // @[CORDIC.scala 117:78]
  wire [1:0] _GEN_241 = _T_591[30:29]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_588 = {{18{_GEN_241[1]}},_GEN_241}; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_242 = {$signed(_T_588), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_243 = {{1{_GEN_242[48]}},_GEN_242}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_606 = $signed(regsY_19) + $signed(_GEN_243); // @[CORDIC.scala 118:52]
  wire [49:0] _T_609 = $signed(regsY_19) - $signed(_GEN_243); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_246 = {{1{regsPhase_19[49]}},regsPhase_19}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_613 = $signed(_GEN_246) - 51'sh0; // @[CORDIC.scala 119:60]
  wire [51:0] _T_614 = {{2{regsPhase_19[49]}},regsPhase_19}; // @[CORDIC.scala 119:99]
  wire [50:0] _T_616 = _T_614[50:0]; // @[CORDIC.scala 119:99]
  wire [50:0] _T_617 = _T_595 ? $signed(_T_613) : $signed(_T_616); // @[CORDIC.scala 119:24]
  wire [28:0] _T_620 = regsX_20[49:21]; // @[CORDIC.scala 97:32]
  wire [29:0] _T_621 = {$signed(_T_620), 1'h0}; // @[CORDIC.scala 97:37]
  wire [28:0] _T_622 = regsY_20[49:21]; // @[CORDIC.scala 98:32]
  wire [29:0] _T_623 = {$signed(_T_622), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_625 = $signed(regsY_20) < 50'sh0; // @[CORDIC.scala 109:40]
  wire  _GEN_247 = _T_623[29]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_619 = {20{_GEN_247}}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_248 = {$signed(_T_619), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_249 = {{1{_GEN_248[48]}},_GEN_248}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_629 = $signed(regsX_20) - $signed(_GEN_249); // @[CORDIC.scala 117:53]
  wire [49:0] _T_632 = $signed(regsX_20) + $signed(_GEN_249); // @[CORDIC.scala 117:78]
  wire  _GEN_252 = _T_621[29]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_618 = {20{_GEN_252}}; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_253 = {$signed(_T_618), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_254 = {{1{_GEN_253[48]}},_GEN_253}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_636 = $signed(regsY_20) + $signed(_GEN_254); // @[CORDIC.scala 118:52]
  wire [49:0] _T_639 = $signed(regsY_20) - $signed(_GEN_254); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_257 = {{1{regsPhase_20[49]}},regsPhase_20}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_643 = $signed(_GEN_257) - 51'sh0; // @[CORDIC.scala 119:60]
  wire [51:0] _T_644 = {{2{regsPhase_20[49]}},regsPhase_20}; // @[CORDIC.scala 119:99]
  wire [50:0] _T_646 = _T_644[50:0]; // @[CORDIC.scala 119:99]
  wire [50:0] _T_647 = _T_625 ? $signed(_T_643) : $signed(_T_646); // @[CORDIC.scala 119:24]
  wire [27:0] _T_650 = regsX_21[49:22]; // @[CORDIC.scala 97:32]
  wire [28:0] _T_651 = {$signed(_T_650), 1'h0}; // @[CORDIC.scala 97:37]
  wire [27:0] _T_652 = regsY_21[49:22]; // @[CORDIC.scala 98:32]
  wire [28:0] _T_653 = {$signed(_T_652), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_655 = $signed(regsY_21) < 50'sh0; // @[CORDIC.scala 109:40]
  wire  _GEN_259 = _T_653[28]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_649 = {20{_GEN_259}}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_260 = {$signed(_T_649), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_261 = {{1{_GEN_260[48]}},_GEN_260}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_659 = $signed(regsX_21) - $signed(_GEN_261); // @[CORDIC.scala 117:53]
  wire [49:0] _T_662 = $signed(regsX_21) + $signed(_GEN_261); // @[CORDIC.scala 117:78]
  wire  _GEN_265 = _T_651[28]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_648 = {20{_GEN_265}}; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_266 = {$signed(_T_648), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_267 = {{1{_GEN_266[48]}},_GEN_266}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_666 = $signed(regsY_21) + $signed(_GEN_267); // @[CORDIC.scala 118:52]
  wire [49:0] _T_669 = $signed(regsY_21) - $signed(_GEN_267); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_270 = {{1{regsPhase_21[49]}},regsPhase_21}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_673 = $signed(_GEN_270) - 51'sh0; // @[CORDIC.scala 119:60]
  wire [51:0] _T_674 = {{2{regsPhase_21[49]}},regsPhase_21}; // @[CORDIC.scala 119:99]
  wire [50:0] _T_676 = _T_674[50:0]; // @[CORDIC.scala 119:99]
  wire [50:0] _T_677 = _T_655 ? $signed(_T_673) : $signed(_T_676); // @[CORDIC.scala 119:24]
  wire [26:0] _T_680 = regsX_22[49:23]; // @[CORDIC.scala 97:32]
  wire [27:0] _T_681 = {$signed(_T_680), 1'h0}; // @[CORDIC.scala 97:37]
  wire [26:0] _T_682 = regsY_22[49:23]; // @[CORDIC.scala 98:32]
  wire [27:0] _T_683 = {$signed(_T_682), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_685 = $signed(regsY_22) < 50'sh0; // @[CORDIC.scala 109:40]
  wire  _GEN_272 = _T_683[27]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_679 = {20{_GEN_272}}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_273 = {$signed(_T_679), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_274 = {{1{_GEN_273[48]}},_GEN_273}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_689 = $signed(regsX_22) - $signed(_GEN_274); // @[CORDIC.scala 117:53]
  wire [49:0] _T_692 = $signed(regsX_22) + $signed(_GEN_274); // @[CORDIC.scala 117:78]
  wire  _GEN_278 = _T_681[27]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_678 = {20{_GEN_278}}; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_279 = {$signed(_T_678), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_280 = {{1{_GEN_279[48]}},_GEN_279}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_696 = $signed(regsY_22) + $signed(_GEN_280); // @[CORDIC.scala 118:52]
  wire [49:0] _T_699 = $signed(regsY_22) - $signed(_GEN_280); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_283 = {{1{regsPhase_22[49]}},regsPhase_22}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_703 = $signed(_GEN_283) - 51'sh0; // @[CORDIC.scala 119:60]
  wire [51:0] _T_704 = {{2{regsPhase_22[49]}},regsPhase_22}; // @[CORDIC.scala 119:99]
  wire [50:0] _T_706 = _T_704[50:0]; // @[CORDIC.scala 119:99]
  wire [50:0] _T_707 = _T_685 ? $signed(_T_703) : $signed(_T_706); // @[CORDIC.scala 119:24]
  wire [25:0] _T_710 = regsX_23[49:24]; // @[CORDIC.scala 97:32]
  wire [26:0] _T_711 = {$signed(_T_710), 1'h0}; // @[CORDIC.scala 97:37]
  wire [25:0] _T_712 = regsY_23[49:24]; // @[CORDIC.scala 98:32]
  wire [26:0] _T_713 = {$signed(_T_712), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_715 = $signed(regsY_23) < 50'sh0; // @[CORDIC.scala 109:40]
  wire  _GEN_285 = _T_713[26]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_709 = {20{_GEN_285}}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_286 = {$signed(_T_709), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_287 = {{1{_GEN_286[48]}},_GEN_286}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_719 = $signed(regsX_23) - $signed(_GEN_287); // @[CORDIC.scala 117:53]
  wire [49:0] _T_722 = $signed(regsX_23) + $signed(_GEN_287); // @[CORDIC.scala 117:78]
  wire  _GEN_291 = _T_711[26]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_708 = {20{_GEN_291}}; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_292 = {$signed(_T_708), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_293 = {{1{_GEN_292[48]}},_GEN_292}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_726 = $signed(regsY_23) + $signed(_GEN_293); // @[CORDIC.scala 118:52]
  wire [49:0] _T_729 = $signed(regsY_23) - $signed(_GEN_293); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_296 = {{1{regsPhase_23[49]}},regsPhase_23}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_733 = $signed(_GEN_296) - 51'sh0; // @[CORDIC.scala 119:60]
  wire [51:0] _T_734 = {{2{regsPhase_23[49]}},regsPhase_23}; // @[CORDIC.scala 119:99]
  wire [50:0] _T_736 = _T_734[50:0]; // @[CORDIC.scala 119:99]
  wire [50:0] _T_737 = _T_715 ? $signed(_T_733) : $signed(_T_736); // @[CORDIC.scala 119:24]
  wire [24:0] _T_740 = regsX_24[49:25]; // @[CORDIC.scala 97:32]
  wire [25:0] _T_741 = {$signed(_T_740), 1'h0}; // @[CORDIC.scala 97:37]
  wire [24:0] _T_742 = regsY_24[49:25]; // @[CORDIC.scala 98:32]
  wire [25:0] _T_743 = {$signed(_T_742), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_745 = $signed(regsY_24) < 50'sh0; // @[CORDIC.scala 109:40]
  wire  _GEN_298 = _T_743[25]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_739 = {20{_GEN_298}}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_299 = {$signed(_T_739), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_300 = {{1{_GEN_299[48]}},_GEN_299}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_749 = $signed(regsX_24) - $signed(_GEN_300); // @[CORDIC.scala 117:53]
  wire [49:0] _T_752 = $signed(regsX_24) + $signed(_GEN_300); // @[CORDIC.scala 117:78]
  wire  _GEN_304 = _T_741[25]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_738 = {20{_GEN_304}}; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_305 = {$signed(_T_738), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_306 = {{1{_GEN_305[48]}},_GEN_305}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_756 = $signed(regsY_24) + $signed(_GEN_306); // @[CORDIC.scala 118:52]
  wire [49:0] _T_759 = $signed(regsY_24) - $signed(_GEN_306); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_309 = {{1{regsPhase_24[49]}},regsPhase_24}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_763 = $signed(_GEN_309) - 51'sh0; // @[CORDIC.scala 119:60]
  wire [51:0] _T_764 = {{2{regsPhase_24[49]}},regsPhase_24}; // @[CORDIC.scala 119:99]
  wire [50:0] _T_766 = _T_764[50:0]; // @[CORDIC.scala 119:99]
  wire [50:0] _T_767 = _T_745 ? $signed(_T_763) : $signed(_T_766); // @[CORDIC.scala 119:24]
  wire [23:0] _T_770 = regsX_25[49:26]; // @[CORDIC.scala 97:32]
  wire [24:0] _T_771 = {$signed(_T_770), 1'h0}; // @[CORDIC.scala 97:37]
  wire [23:0] _T_772 = regsY_25[49:26]; // @[CORDIC.scala 98:32]
  wire [24:0] _T_773 = {$signed(_T_772), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_775 = $signed(regsY_25) < 50'sh0; // @[CORDIC.scala 109:40]
  wire  _GEN_311 = _T_773[24]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_769 = {20{_GEN_311}}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_312 = {$signed(_T_769), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_313 = {{1{_GEN_312[48]}},_GEN_312}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_779 = $signed(regsX_25) - $signed(_GEN_313); // @[CORDIC.scala 117:53]
  wire [49:0] _T_782 = $signed(regsX_25) + $signed(_GEN_313); // @[CORDIC.scala 117:78]
  wire  _GEN_317 = _T_771[24]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_768 = {20{_GEN_317}}; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_318 = {$signed(_T_768), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_319 = {{1{_GEN_318[48]}},_GEN_318}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_786 = $signed(regsY_25) + $signed(_GEN_319); // @[CORDIC.scala 118:52]
  wire [49:0] _T_789 = $signed(regsY_25) - $signed(_GEN_319); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_322 = {{1{regsPhase_25[49]}},regsPhase_25}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_793 = $signed(_GEN_322) - 51'sh0; // @[CORDIC.scala 119:60]
  wire [51:0] _T_794 = {{2{regsPhase_25[49]}},regsPhase_25}; // @[CORDIC.scala 119:99]
  wire [50:0] _T_796 = _T_794[50:0]; // @[CORDIC.scala 119:99]
  wire [50:0] _T_797 = _T_775 ? $signed(_T_793) : $signed(_T_796); // @[CORDIC.scala 119:24]
  wire [22:0] _T_800 = regsX_26[49:27]; // @[CORDIC.scala 97:32]
  wire [23:0] _T_801 = {$signed(_T_800), 1'h0}; // @[CORDIC.scala 97:37]
  wire [22:0] _T_802 = regsY_26[49:27]; // @[CORDIC.scala 98:32]
  wire [23:0] _T_803 = {$signed(_T_802), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_805 = $signed(regsY_26) < 50'sh0; // @[CORDIC.scala 109:40]
  wire  _GEN_324 = _T_803[23]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_799 = {20{_GEN_324}}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_325 = {$signed(_T_799), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_326 = {{1{_GEN_325[48]}},_GEN_325}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_809 = $signed(regsX_26) - $signed(_GEN_326); // @[CORDIC.scala 117:53]
  wire [49:0] _T_812 = $signed(regsX_26) + $signed(_GEN_326); // @[CORDIC.scala 117:78]
  wire  _GEN_330 = _T_801[23]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_798 = {20{_GEN_330}}; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_331 = {$signed(_T_798), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_332 = {{1{_GEN_331[48]}},_GEN_331}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_816 = $signed(regsY_26) + $signed(_GEN_332); // @[CORDIC.scala 118:52]
  wire [49:0] _T_819 = $signed(regsY_26) - $signed(_GEN_332); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_335 = {{1{regsPhase_26[49]}},regsPhase_26}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_823 = $signed(_GEN_335) - 51'sh0; // @[CORDIC.scala 119:60]
  wire [51:0] _T_824 = {{2{regsPhase_26[49]}},regsPhase_26}; // @[CORDIC.scala 119:99]
  wire [50:0] _T_826 = _T_824[50:0]; // @[CORDIC.scala 119:99]
  wire [50:0] _T_827 = _T_805 ? $signed(_T_823) : $signed(_T_826); // @[CORDIC.scala 119:24]
  wire [21:0] _T_830 = regsX_27[49:28]; // @[CORDIC.scala 97:32]
  wire [22:0] _T_831 = {$signed(_T_830), 1'h0}; // @[CORDIC.scala 97:37]
  wire [21:0] _T_832 = regsY_27[49:28]; // @[CORDIC.scala 98:32]
  wire [22:0] _T_833 = {$signed(_T_832), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_835 = $signed(regsY_27) < 50'sh0; // @[CORDIC.scala 109:40]
  wire  _GEN_337 = _T_833[22]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_829 = {20{_GEN_337}}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_338 = {$signed(_T_829), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_339 = {{1{_GEN_338[48]}},_GEN_338}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_839 = $signed(regsX_27) - $signed(_GEN_339); // @[CORDIC.scala 117:53]
  wire [49:0] _T_842 = $signed(regsX_27) + $signed(_GEN_339); // @[CORDIC.scala 117:78]
  wire  _GEN_343 = _T_831[22]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_828 = {20{_GEN_343}}; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_344 = {$signed(_T_828), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_345 = {{1{_GEN_344[48]}},_GEN_344}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_846 = $signed(regsY_27) + $signed(_GEN_345); // @[CORDIC.scala 118:52]
  wire [49:0] _T_849 = $signed(regsY_27) - $signed(_GEN_345); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_348 = {{1{regsPhase_27[49]}},regsPhase_27}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_853 = $signed(_GEN_348) - 51'sh0; // @[CORDIC.scala 119:60]
  wire [51:0] _T_854 = {{2{regsPhase_27[49]}},regsPhase_27}; // @[CORDIC.scala 119:99]
  wire [50:0] _T_856 = _T_854[50:0]; // @[CORDIC.scala 119:99]
  wire [50:0] _T_857 = _T_835 ? $signed(_T_853) : $signed(_T_856); // @[CORDIC.scala 119:24]
  wire [20:0] _T_860 = regsX_28[49:29]; // @[CORDIC.scala 97:32]
  wire [21:0] _T_861 = {$signed(_T_860), 1'h0}; // @[CORDIC.scala 97:37]
  wire [20:0] _T_862 = regsY_28[49:29]; // @[CORDIC.scala 98:32]
  wire [21:0] _T_863 = {$signed(_T_862), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_865 = $signed(regsY_28) < 50'sh0; // @[CORDIC.scala 109:40]
  wire  _GEN_350 = _T_863[21]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_859 = {20{_GEN_350}}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_351 = {$signed(_T_859), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_352 = {{1{_GEN_351[48]}},_GEN_351}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_869 = $signed(regsX_28) - $signed(_GEN_352); // @[CORDIC.scala 117:53]
  wire [49:0] _T_872 = $signed(regsX_28) + $signed(_GEN_352); // @[CORDIC.scala 117:78]
  wire  _GEN_356 = _T_861[21]; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [19:0] _T_858 = {20{_GEN_356}}; // @[CORDIC.scala 94:24 CORDIC.scala 97:16]
  wire [48:0] _GEN_357 = {$signed(_T_858), 29'h0}; // @[CORDIC.scala 118:52]
  wire [49:0] _GEN_358 = {{1{_GEN_357[48]}},_GEN_357}; // @[CORDIC.scala 118:52]
  wire [49:0] _T_876 = $signed(regsY_28) + $signed(_GEN_358); // @[CORDIC.scala 118:52]
  wire [49:0] _T_879 = $signed(regsY_28) - $signed(_GEN_358); // @[CORDIC.scala 118:77]
  wire [50:0] _GEN_361 = {{1{regsPhase_28[49]}},regsPhase_28}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_883 = $signed(_GEN_361) - 51'sh0; // @[CORDIC.scala 119:60]
  wire [51:0] _T_884 = {{2{regsPhase_28[49]}},regsPhase_28}; // @[CORDIC.scala 119:99]
  wire [50:0] _T_886 = _T_884[50:0]; // @[CORDIC.scala 119:99]
  wire [50:0] _T_887 = _T_865 ? $signed(_T_883) : $signed(_T_886); // @[CORDIC.scala 119:24]
  wire [19:0] _T_892 = regsY_29[49:30]; // @[CORDIC.scala 98:32]
  wire [20:0] _T_893 = {$signed(_T_892), 1'h0}; // @[CORDIC.scala 98:37]
  wire  _T_895 = $signed(regsY_29) < 50'sh0; // @[CORDIC.scala 109:40]
  wire  _GEN_363 = _T_893[20]; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [19:0] _T_889 = {20{_GEN_363}}; // @[CORDIC.scala 95:24 CORDIC.scala 98:16]
  wire [48:0] _GEN_364 = {$signed(_T_889), 29'h0}; // @[CORDIC.scala 117:53]
  wire [49:0] _GEN_365 = {{1{_GEN_364[48]}},_GEN_364}; // @[CORDIC.scala 117:53]
  wire [49:0] _T_899 = $signed(regsX_29) - $signed(_GEN_365); // @[CORDIC.scala 117:53]
  wire [49:0] _T_902 = $signed(regsX_29) + $signed(_GEN_365); // @[CORDIC.scala 117:78]
  wire [50:0] _GEN_374 = {{1{regsPhase_29[49]}},regsPhase_29}; // @[CORDIC.scala 119:60]
  wire [50:0] _T_913 = $signed(_GEN_374) - 51'sh0; // @[CORDIC.scala 119:60]
  wire [51:0] _T_914 = {{2{regsPhase_29[49]}},regsPhase_29}; // @[CORDIC.scala 119:99]
  wire [50:0] _T_916 = _T_914[50:0]; // @[CORDIC.scala 119:99]
  wire [50:0] _T_917 = _T_895 ? $signed(_T_913) : $signed(_T_916); // @[CORDIC.scala 119:24]
  wire [99:0] _T_918 = $signed(regsX_30) * 50'sh4dba76d421af; // @[CORDIC.scala 130:35]
  wire [52:0] _GEN_375 = _T_918[99:47]; // @[CORDIC.scala 130:21]
  assign io_dataOutX = _GEN_375[49:0]; // @[CORDIC.scala 130:21]
  assign io_dataOutPhase = regsPhase_30; // @[CORDIC.scala 134:25]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  regsX_0 = _RAND_0[49:0];
  _RAND_1 = {2{`RANDOM}};
  regsX_1 = _RAND_1[49:0];
  _RAND_2 = {2{`RANDOM}};
  regsX_2 = _RAND_2[49:0];
  _RAND_3 = {2{`RANDOM}};
  regsX_3 = _RAND_3[49:0];
  _RAND_4 = {2{`RANDOM}};
  regsX_4 = _RAND_4[49:0];
  _RAND_5 = {2{`RANDOM}};
  regsX_5 = _RAND_5[49:0];
  _RAND_6 = {2{`RANDOM}};
  regsX_6 = _RAND_6[49:0];
  _RAND_7 = {2{`RANDOM}};
  regsX_7 = _RAND_7[49:0];
  _RAND_8 = {2{`RANDOM}};
  regsX_8 = _RAND_8[49:0];
  _RAND_9 = {2{`RANDOM}};
  regsX_9 = _RAND_9[49:0];
  _RAND_10 = {2{`RANDOM}};
  regsX_10 = _RAND_10[49:0];
  _RAND_11 = {2{`RANDOM}};
  regsX_11 = _RAND_11[49:0];
  _RAND_12 = {2{`RANDOM}};
  regsX_12 = _RAND_12[49:0];
  _RAND_13 = {2{`RANDOM}};
  regsX_13 = _RAND_13[49:0];
  _RAND_14 = {2{`RANDOM}};
  regsX_14 = _RAND_14[49:0];
  _RAND_15 = {2{`RANDOM}};
  regsX_15 = _RAND_15[49:0];
  _RAND_16 = {2{`RANDOM}};
  regsX_16 = _RAND_16[49:0];
  _RAND_17 = {2{`RANDOM}};
  regsX_17 = _RAND_17[49:0];
  _RAND_18 = {2{`RANDOM}};
  regsX_18 = _RAND_18[49:0];
  _RAND_19 = {2{`RANDOM}};
  regsX_19 = _RAND_19[49:0];
  _RAND_20 = {2{`RANDOM}};
  regsX_20 = _RAND_20[49:0];
  _RAND_21 = {2{`RANDOM}};
  regsX_21 = _RAND_21[49:0];
  _RAND_22 = {2{`RANDOM}};
  regsX_22 = _RAND_22[49:0];
  _RAND_23 = {2{`RANDOM}};
  regsX_23 = _RAND_23[49:0];
  _RAND_24 = {2{`RANDOM}};
  regsX_24 = _RAND_24[49:0];
  _RAND_25 = {2{`RANDOM}};
  regsX_25 = _RAND_25[49:0];
  _RAND_26 = {2{`RANDOM}};
  regsX_26 = _RAND_26[49:0];
  _RAND_27 = {2{`RANDOM}};
  regsX_27 = _RAND_27[49:0];
  _RAND_28 = {2{`RANDOM}};
  regsX_28 = _RAND_28[49:0];
  _RAND_29 = {2{`RANDOM}};
  regsX_29 = _RAND_29[49:0];
  _RAND_30 = {2{`RANDOM}};
  regsX_30 = _RAND_30[49:0];
  _RAND_31 = {2{`RANDOM}};
  regsY_0 = _RAND_31[49:0];
  _RAND_32 = {2{`RANDOM}};
  regsY_1 = _RAND_32[49:0];
  _RAND_33 = {2{`RANDOM}};
  regsY_2 = _RAND_33[49:0];
  _RAND_34 = {2{`RANDOM}};
  regsY_3 = _RAND_34[49:0];
  _RAND_35 = {2{`RANDOM}};
  regsY_4 = _RAND_35[49:0];
  _RAND_36 = {2{`RANDOM}};
  regsY_5 = _RAND_36[49:0];
  _RAND_37 = {2{`RANDOM}};
  regsY_6 = _RAND_37[49:0];
  _RAND_38 = {2{`RANDOM}};
  regsY_7 = _RAND_38[49:0];
  _RAND_39 = {2{`RANDOM}};
  regsY_8 = _RAND_39[49:0];
  _RAND_40 = {2{`RANDOM}};
  regsY_9 = _RAND_40[49:0];
  _RAND_41 = {2{`RANDOM}};
  regsY_10 = _RAND_41[49:0];
  _RAND_42 = {2{`RANDOM}};
  regsY_11 = _RAND_42[49:0];
  _RAND_43 = {2{`RANDOM}};
  regsY_12 = _RAND_43[49:0];
  _RAND_44 = {2{`RANDOM}};
  regsY_13 = _RAND_44[49:0];
  _RAND_45 = {2{`RANDOM}};
  regsY_14 = _RAND_45[49:0];
  _RAND_46 = {2{`RANDOM}};
  regsY_15 = _RAND_46[49:0];
  _RAND_47 = {2{`RANDOM}};
  regsY_16 = _RAND_47[49:0];
  _RAND_48 = {2{`RANDOM}};
  regsY_17 = _RAND_48[49:0];
  _RAND_49 = {2{`RANDOM}};
  regsY_18 = _RAND_49[49:0];
  _RAND_50 = {2{`RANDOM}};
  regsY_19 = _RAND_50[49:0];
  _RAND_51 = {2{`RANDOM}};
  regsY_20 = _RAND_51[49:0];
  _RAND_52 = {2{`RANDOM}};
  regsY_21 = _RAND_52[49:0];
  _RAND_53 = {2{`RANDOM}};
  regsY_22 = _RAND_53[49:0];
  _RAND_54 = {2{`RANDOM}};
  regsY_23 = _RAND_54[49:0];
  _RAND_55 = {2{`RANDOM}};
  regsY_24 = _RAND_55[49:0];
  _RAND_56 = {2{`RANDOM}};
  regsY_25 = _RAND_56[49:0];
  _RAND_57 = {2{`RANDOM}};
  regsY_26 = _RAND_57[49:0];
  _RAND_58 = {2{`RANDOM}};
  regsY_27 = _RAND_58[49:0];
  _RAND_59 = {2{`RANDOM}};
  regsY_28 = _RAND_59[49:0];
  _RAND_60 = {2{`RANDOM}};
  regsY_29 = _RAND_60[49:0];
  _RAND_61 = {2{`RANDOM}};
  regsPhase_0 = _RAND_61[49:0];
  _RAND_62 = {2{`RANDOM}};
  regsPhase_1 = _RAND_62[49:0];
  _RAND_63 = {2{`RANDOM}};
  regsPhase_2 = _RAND_63[49:0];
  _RAND_64 = {2{`RANDOM}};
  regsPhase_3 = _RAND_64[49:0];
  _RAND_65 = {2{`RANDOM}};
  regsPhase_4 = _RAND_65[49:0];
  _RAND_66 = {2{`RANDOM}};
  regsPhase_5 = _RAND_66[49:0];
  _RAND_67 = {2{`RANDOM}};
  regsPhase_6 = _RAND_67[49:0];
  _RAND_68 = {2{`RANDOM}};
  regsPhase_7 = _RAND_68[49:0];
  _RAND_69 = {2{`RANDOM}};
  regsPhase_8 = _RAND_69[49:0];
  _RAND_70 = {2{`RANDOM}};
  regsPhase_9 = _RAND_70[49:0];
  _RAND_71 = {2{`RANDOM}};
  regsPhase_10 = _RAND_71[49:0];
  _RAND_72 = {2{`RANDOM}};
  regsPhase_11 = _RAND_72[49:0];
  _RAND_73 = {2{`RANDOM}};
  regsPhase_12 = _RAND_73[49:0];
  _RAND_74 = {2{`RANDOM}};
  regsPhase_13 = _RAND_74[49:0];
  _RAND_75 = {2{`RANDOM}};
  regsPhase_14 = _RAND_75[49:0];
  _RAND_76 = {2{`RANDOM}};
  regsPhase_15 = _RAND_76[49:0];
  _RAND_77 = {2{`RANDOM}};
  regsPhase_16 = _RAND_77[49:0];
  _RAND_78 = {2{`RANDOM}};
  regsPhase_17 = _RAND_78[49:0];
  _RAND_79 = {2{`RANDOM}};
  regsPhase_18 = _RAND_79[49:0];
  _RAND_80 = {2{`RANDOM}};
  regsPhase_19 = _RAND_80[49:0];
  _RAND_81 = {2{`RANDOM}};
  regsPhase_20 = _RAND_81[49:0];
  _RAND_82 = {2{`RANDOM}};
  regsPhase_21 = _RAND_82[49:0];
  _RAND_83 = {2{`RANDOM}};
  regsPhase_22 = _RAND_83[49:0];
  _RAND_84 = {2{`RANDOM}};
  regsPhase_23 = _RAND_84[49:0];
  _RAND_85 = {2{`RANDOM}};
  regsPhase_24 = _RAND_85[49:0];
  _RAND_86 = {2{`RANDOM}};
  regsPhase_25 = _RAND_86[49:0];
  _RAND_87 = {2{`RANDOM}};
  regsPhase_26 = _RAND_87[49:0];
  _RAND_88 = {2{`RANDOM}};
  regsPhase_27 = _RAND_88[49:0];
  _RAND_89 = {2{`RANDOM}};
  regsPhase_28 = _RAND_89[49:0];
  _RAND_90 = {2{`RANDOM}};
  regsPhase_29 = _RAND_90[49:0];
  _RAND_91 = {2{`RANDOM}};
  regsPhase_30 = _RAND_91[49:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    regsX_0 <= {$signed(_GEN_3), 29'h0};
    if (_T_25) begin
      regsX_1 <= _T_29;
    end else begin
      regsX_1 <= _T_32;
    end
    if (_T_55) begin
      regsX_2 <= _T_59;
    end else begin
      regsX_2 <= _T_62;
    end
    if (_T_85) begin
      regsX_3 <= _T_89;
    end else begin
      regsX_3 <= _T_92;
    end
    if (_T_115) begin
      regsX_4 <= _T_119;
    end else begin
      regsX_4 <= _T_122;
    end
    if (_T_145) begin
      regsX_5 <= _T_149;
    end else begin
      regsX_5 <= _T_152;
    end
    if (_T_175) begin
      regsX_6 <= _T_179;
    end else begin
      regsX_6 <= _T_182;
    end
    if (_T_205) begin
      regsX_7 <= _T_209;
    end else begin
      regsX_7 <= _T_212;
    end
    if (_T_235) begin
      regsX_8 <= _T_239;
    end else begin
      regsX_8 <= _T_242;
    end
    if (_T_265) begin
      regsX_9 <= _T_269;
    end else begin
      regsX_9 <= _T_272;
    end
    if (_T_295) begin
      regsX_10 <= _T_299;
    end else begin
      regsX_10 <= _T_302;
    end
    if (_T_325) begin
      regsX_11 <= _T_329;
    end else begin
      regsX_11 <= _T_332;
    end
    if (_T_355) begin
      regsX_12 <= _T_359;
    end else begin
      regsX_12 <= _T_362;
    end
    if (_T_385) begin
      regsX_13 <= _T_389;
    end else begin
      regsX_13 <= _T_392;
    end
    if (_T_415) begin
      regsX_14 <= _T_419;
    end else begin
      regsX_14 <= _T_422;
    end
    if (_T_445) begin
      regsX_15 <= _T_449;
    end else begin
      regsX_15 <= _T_452;
    end
    if (_T_475) begin
      regsX_16 <= _T_479;
    end else begin
      regsX_16 <= _T_482;
    end
    if (_T_505) begin
      regsX_17 <= _T_509;
    end else begin
      regsX_17 <= _T_512;
    end
    if (_T_535) begin
      regsX_18 <= _T_539;
    end else begin
      regsX_18 <= _T_542;
    end
    if (_T_565) begin
      regsX_19 <= _T_569;
    end else begin
      regsX_19 <= _T_572;
    end
    if (_T_595) begin
      regsX_20 <= _T_599;
    end else begin
      regsX_20 <= _T_602;
    end
    if (_T_625) begin
      regsX_21 <= _T_629;
    end else begin
      regsX_21 <= _T_632;
    end
    if (_T_655) begin
      regsX_22 <= _T_659;
    end else begin
      regsX_22 <= _T_662;
    end
    if (_T_685) begin
      regsX_23 <= _T_689;
    end else begin
      regsX_23 <= _T_692;
    end
    if (_T_715) begin
      regsX_24 <= _T_719;
    end else begin
      regsX_24 <= _T_722;
    end
    if (_T_745) begin
      regsX_25 <= _T_749;
    end else begin
      regsX_25 <= _T_752;
    end
    if (_T_775) begin
      regsX_26 <= _T_779;
    end else begin
      regsX_26 <= _T_782;
    end
    if (_T_805) begin
      regsX_27 <= _T_809;
    end else begin
      regsX_27 <= _T_812;
    end
    if (_T_835) begin
      regsX_28 <= _T_839;
    end else begin
      regsX_28 <= _T_842;
    end
    if (_T_865) begin
      regsX_29 <= _T_869;
    end else begin
      regsX_29 <= _T_872;
    end
    if (_T_895) begin
      regsX_30 <= _T_899;
    end else begin
      regsX_30 <= _T_902;
    end
    regsY_0 <= {$signed(_GEN_4), 29'h0};
    if (_T_25) begin
      regsY_1 <= _T_36;
    end else begin
      regsY_1 <= _T_39;
    end
    if (_T_55) begin
      regsY_2 <= _T_66;
    end else begin
      regsY_2 <= _T_69;
    end
    if (_T_85) begin
      regsY_3 <= _T_96;
    end else begin
      regsY_3 <= _T_99;
    end
    if (_T_115) begin
      regsY_4 <= _T_126;
    end else begin
      regsY_4 <= _T_129;
    end
    if (_T_145) begin
      regsY_5 <= _T_156;
    end else begin
      regsY_5 <= _T_159;
    end
    if (_T_175) begin
      regsY_6 <= _T_186;
    end else begin
      regsY_6 <= _T_189;
    end
    if (_T_205) begin
      regsY_7 <= _T_216;
    end else begin
      regsY_7 <= _T_219;
    end
    if (_T_235) begin
      regsY_8 <= _T_246;
    end else begin
      regsY_8 <= _T_249;
    end
    if (_T_265) begin
      regsY_9 <= _T_276;
    end else begin
      regsY_9 <= _T_279;
    end
    if (_T_295) begin
      regsY_10 <= _T_306;
    end else begin
      regsY_10 <= _T_309;
    end
    if (_T_325) begin
      regsY_11 <= _T_336;
    end else begin
      regsY_11 <= _T_339;
    end
    if (_T_355) begin
      regsY_12 <= _T_366;
    end else begin
      regsY_12 <= _T_369;
    end
    if (_T_385) begin
      regsY_13 <= _T_396;
    end else begin
      regsY_13 <= _T_399;
    end
    if (_T_415) begin
      regsY_14 <= _T_426;
    end else begin
      regsY_14 <= _T_429;
    end
    if (_T_445) begin
      regsY_15 <= _T_456;
    end else begin
      regsY_15 <= _T_459;
    end
    if (_T_475) begin
      regsY_16 <= _T_486;
    end else begin
      regsY_16 <= _T_489;
    end
    if (_T_505) begin
      regsY_17 <= _T_516;
    end else begin
      regsY_17 <= _T_519;
    end
    if (_T_535) begin
      regsY_18 <= _T_546;
    end else begin
      regsY_18 <= _T_549;
    end
    if (_T_565) begin
      regsY_19 <= _T_576;
    end else begin
      regsY_19 <= _T_579;
    end
    if (_T_595) begin
      regsY_20 <= _T_606;
    end else begin
      regsY_20 <= _T_609;
    end
    if (_T_625) begin
      regsY_21 <= _T_636;
    end else begin
      regsY_21 <= _T_639;
    end
    if (_T_655) begin
      regsY_22 <= _T_666;
    end else begin
      regsY_22 <= _T_669;
    end
    if (_T_685) begin
      regsY_23 <= _T_696;
    end else begin
      regsY_23 <= _T_699;
    end
    if (_T_715) begin
      regsY_24 <= _T_726;
    end else begin
      regsY_24 <= _T_729;
    end
    if (_T_745) begin
      regsY_25 <= _T_756;
    end else begin
      regsY_25 <= _T_759;
    end
    if (_T_775) begin
      regsY_26 <= _T_786;
    end else begin
      regsY_26 <= _T_789;
    end
    if (_T_805) begin
      regsY_27 <= _T_816;
    end else begin
      regsY_27 <= _T_819;
    end
    if (_T_835) begin
      regsY_28 <= _T_846;
    end else begin
      regsY_28 <= _T_849;
    end
    if (_T_865) begin
      regsY_29 <= _T_876;
    end else begin
      regsY_29 <= _T_879;
    end
    regsPhase_0 <= {$signed(_GEN_5), 30'h0};
    regsPhase_1 <= _T_47[49:0];
    regsPhase_2 <= _T_77[49:0];
    regsPhase_3 <= _T_107[49:0];
    regsPhase_4 <= _T_137[49:0];
    regsPhase_5 <= _T_167[49:0];
    regsPhase_6 <= _T_197[49:0];
    regsPhase_7 <= _T_227[49:0];
    regsPhase_8 <= _T_257[49:0];
    regsPhase_9 <= _T_287[49:0];
    regsPhase_10 <= _T_317[49:0];
    regsPhase_11 <= _T_347[49:0];
    regsPhase_12 <= _T_377[49:0];
    regsPhase_13 <= _T_407[49:0];
    regsPhase_14 <= _T_437[49:0];
    regsPhase_15 <= _T_467[49:0];
    regsPhase_16 <= _T_497[49:0];
    regsPhase_17 <= _T_527[49:0];
    regsPhase_18 <= _T_557[49:0];
    regsPhase_19 <= _T_587[49:0];
    regsPhase_20 <= _T_617[49:0];
    regsPhase_21 <= _T_647[49:0];
    regsPhase_22 <= _T_677[49:0];
    regsPhase_23 <= _T_707[49:0];
    regsPhase_24 <= _T_737[49:0];
    regsPhase_25 <= _T_767[49:0];
    regsPhase_26 <= _T_797[49:0];
    regsPhase_27 <= _T_827[49:0];
    regsPhase_28 <= _T_857[49:0];
    regsPhase_29 <= _T_887[49:0];
    regsPhase_30 <= _T_917[49:0];
  end
endmodule
