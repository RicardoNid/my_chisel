module CORDIC(
  input         clock,
  input         reset,
  input  [29:0] io_dataInPhase,
  output [29:0] io_dataOutX,
  output [29:0] io_dataOutY
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
`endif // RANDOMIZE_REG_INIT
  reg [29:0] regsX_1; // @[CORDIC.scala 34:18]
  reg [29:0] regsX_2; // @[CORDIC.scala 34:18]
  reg [29:0] regsX_3; // @[CORDIC.scala 34:18]
  reg [29:0] regsX_4; // @[CORDIC.scala 34:18]
  reg [29:0] regsX_5; // @[CORDIC.scala 34:18]
  reg [29:0] regsX_6; // @[CORDIC.scala 34:18]
  reg [29:0] regsX_7; // @[CORDIC.scala 34:18]
  reg [29:0] regsX_8; // @[CORDIC.scala 34:18]
  reg [29:0] regsX_9; // @[CORDIC.scala 34:18]
  reg [29:0] regsX_10; // @[CORDIC.scala 34:18]
  reg [29:0] regsX_11; // @[CORDIC.scala 34:18]
  reg [29:0] regsX_12; // @[CORDIC.scala 34:18]
  reg [29:0] regsX_13; // @[CORDIC.scala 34:18]
  reg [29:0] regsX_14; // @[CORDIC.scala 34:18]
  reg [29:0] regsX_15; // @[CORDIC.scala 34:18]
  reg [29:0] regsX_16; // @[CORDIC.scala 34:18]
  reg [29:0] regsX_17; // @[CORDIC.scala 34:18]
  reg [29:0] regsX_18; // @[CORDIC.scala 34:18]
  reg [29:0] regsX_19; // @[CORDIC.scala 34:18]
  reg [29:0] regsX_20; // @[CORDIC.scala 34:18]
  reg [29:0] regsY_1; // @[CORDIC.scala 35:18]
  reg [29:0] regsY_2; // @[CORDIC.scala 35:18]
  reg [29:0] regsY_3; // @[CORDIC.scala 35:18]
  reg [29:0] regsY_4; // @[CORDIC.scala 35:18]
  reg [29:0] regsY_5; // @[CORDIC.scala 35:18]
  reg [29:0] regsY_6; // @[CORDIC.scala 35:18]
  reg [29:0] regsY_7; // @[CORDIC.scala 35:18]
  reg [29:0] regsY_8; // @[CORDIC.scala 35:18]
  reg [29:0] regsY_9; // @[CORDIC.scala 35:18]
  reg [29:0] regsY_10; // @[CORDIC.scala 35:18]
  reg [29:0] regsY_11; // @[CORDIC.scala 35:18]
  reg [29:0] regsY_12; // @[CORDIC.scala 35:18]
  reg [29:0] regsY_13; // @[CORDIC.scala 35:18]
  reg [29:0] regsY_14; // @[CORDIC.scala 35:18]
  reg [29:0] regsY_15; // @[CORDIC.scala 35:18]
  reg [29:0] regsY_16; // @[CORDIC.scala 35:18]
  reg [29:0] regsY_17; // @[CORDIC.scala 35:18]
  reg [29:0] regsY_18; // @[CORDIC.scala 35:18]
  reg [29:0] regsY_19; // @[CORDIC.scala 35:18]
  reg [29:0] regsY_20; // @[CORDIC.scala 35:18]
  reg [29:0] regsPhase_0; // @[CORDIC.scala 36:22]
  reg [29:0] regsPhase_1; // @[CORDIC.scala 36:22]
  reg [29:0] regsPhase_2; // @[CORDIC.scala 36:22]
  reg [29:0] regsPhase_3; // @[CORDIC.scala 36:22]
  reg [29:0] regsPhase_4; // @[CORDIC.scala 36:22]
  reg [29:0] regsPhase_5; // @[CORDIC.scala 36:22]
  reg [29:0] regsPhase_6; // @[CORDIC.scala 36:22]
  reg [29:0] regsPhase_7; // @[CORDIC.scala 36:22]
  reg [29:0] regsPhase_8; // @[CORDIC.scala 36:22]
  reg [29:0] regsPhase_9; // @[CORDIC.scala 36:22]
  reg [29:0] regsPhase_10; // @[CORDIC.scala 36:22]
  reg [29:0] regsPhase_11; // @[CORDIC.scala 36:22]
  reg [29:0] regsPhase_12; // @[CORDIC.scala 36:22]
  reg [29:0] regsPhase_13; // @[CORDIC.scala 36:22]
  reg [29:0] regsPhase_14; // @[CORDIC.scala 36:22]
  reg [29:0] regsPhase_15; // @[CORDIC.scala 36:22]
  reg [29:0] regsPhase_16; // @[CORDIC.scala 36:22]
  reg [29:0] regsPhase_17; // @[CORDIC.scala 36:22]
  reg [29:0] regsPhase_18; // @[CORDIC.scala 36:22]
  reg [29:0] regsPhase_19; // @[CORDIC.scala 36:22]
  wire  _T_6 = $signed(regsPhase_0) > 30'sh0; // @[CORDIC.scala 49:37]
  wire [29:0] _T_9 = 30'sh8000000 - 30'sh0; // @[CORDIC.scala 51:44]
  wire [29:0] _T_19 = 30'sh0 - 30'sh8000000; // @[CORDIC.scala 52:69]
  wire [29:0] _T_23 = $signed(regsPhase_0) - 30'sh3243f6b; // @[CORDIC.scala 53:52]
  wire [29:0] _T_26 = $signed(regsPhase_0) + 30'sh3243f6b; // @[CORDIC.scala 53:91]
  wire [27:0] _T_29 = regsX_1[29:2]; // @[CORDIC.scala 46:30]
  wire [28:0] _T_30 = {$signed(_T_29), 1'h0}; // @[CORDIC.scala 46:35]
  wire [27:0] _T_32 = regsY_1[29:2]; // @[CORDIC.scala 48:30]
  wire [28:0] _T_33 = {$signed(_T_32), 1'h0}; // @[CORDIC.scala 48:35]
  wire  _T_34 = $signed(regsPhase_1) > 30'sh0; // @[CORDIC.scala 49:37]
  wire [8:0] _GEN_0 = _T_33[28:20]; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [9:0] _T_31 = {{1{_GEN_0[8]}},_GEN_0}; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [29:0] _GEN_1 = {$signed(_T_31), 20'h0}; // @[CORDIC.scala 51:44]
  wire [29:0] _T_37 = $signed(regsX_1) - $signed(_GEN_1); // @[CORDIC.scala 51:44]
  wire [29:0] _T_40 = $signed(regsX_1) + $signed(_GEN_1); // @[CORDIC.scala 51:69]
  wire [8:0] _GEN_3 = _T_30[28:20]; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [9:0] _T_28 = {{1{_GEN_3[8]}},_GEN_3}; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [29:0] _GEN_4 = {$signed(_T_28), 20'h0}; // @[CORDIC.scala 52:44]
  wire [29:0] _T_44 = $signed(regsY_1) + $signed(_GEN_4); // @[CORDIC.scala 52:44]
  wire [29:0] _T_47 = $signed(regsY_1) - $signed(_GEN_4); // @[CORDIC.scala 52:69]
  wire [29:0] _T_51 = $signed(regsPhase_1) - 30'sh1dac670; // @[CORDIC.scala 53:52]
  wire [29:0] _T_54 = $signed(regsPhase_1) + 30'sh1dac670; // @[CORDIC.scala 53:91]
  wire [26:0] _T_57 = regsX_2[29:3]; // @[CORDIC.scala 46:30]
  wire [27:0] _T_58 = {$signed(_T_57), 1'h0}; // @[CORDIC.scala 46:35]
  wire [26:0] _T_60 = regsY_2[29:3]; // @[CORDIC.scala 48:30]
  wire [27:0] _T_61 = {$signed(_T_60), 1'h0}; // @[CORDIC.scala 48:35]
  wire  _T_62 = $signed(regsPhase_2) > 30'sh0; // @[CORDIC.scala 49:37]
  wire [7:0] _GEN_6 = _T_61[27:20]; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [9:0] _T_59 = {{2{_GEN_6[7]}},_GEN_6}; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [29:0] _GEN_7 = {$signed(_T_59), 20'h0}; // @[CORDIC.scala 51:44]
  wire [29:0] _T_65 = $signed(regsX_2) - $signed(_GEN_7); // @[CORDIC.scala 51:44]
  wire [29:0] _T_68 = $signed(regsX_2) + $signed(_GEN_7); // @[CORDIC.scala 51:69]
  wire [7:0] _GEN_9 = _T_58[27:20]; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [9:0] _T_56 = {{2{_GEN_9[7]}},_GEN_9}; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [29:0] _GEN_10 = {$signed(_T_56), 20'h0}; // @[CORDIC.scala 52:44]
  wire [29:0] _T_72 = $signed(regsY_2) + $signed(_GEN_10); // @[CORDIC.scala 52:44]
  wire [29:0] _T_75 = $signed(regsY_2) - $signed(_GEN_10); // @[CORDIC.scala 52:69]
  wire [29:0] _T_79 = $signed(regsPhase_2) - 30'shfadbb0; // @[CORDIC.scala 53:52]
  wire [29:0] _T_82 = $signed(regsPhase_2) + 30'shfadbb0; // @[CORDIC.scala 53:91]
  wire [25:0] _T_85 = regsX_3[29:4]; // @[CORDIC.scala 46:30]
  wire [26:0] _T_86 = {$signed(_T_85), 1'h0}; // @[CORDIC.scala 46:35]
  wire [25:0] _T_88 = regsY_3[29:4]; // @[CORDIC.scala 48:30]
  wire [26:0] _T_89 = {$signed(_T_88), 1'h0}; // @[CORDIC.scala 48:35]
  wire  _T_90 = $signed(regsPhase_3) > 30'sh0; // @[CORDIC.scala 49:37]
  wire [6:0] _GEN_12 = _T_89[26:20]; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [9:0] _T_87 = {{3{_GEN_12[6]}},_GEN_12}; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [29:0] _GEN_13 = {$signed(_T_87), 20'h0}; // @[CORDIC.scala 51:44]
  wire [29:0] _T_93 = $signed(regsX_3) - $signed(_GEN_13); // @[CORDIC.scala 51:44]
  wire [29:0] _T_96 = $signed(regsX_3) + $signed(_GEN_13); // @[CORDIC.scala 51:69]
  wire [6:0] _GEN_15 = _T_86[26:20]; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [9:0] _T_84 = {{3{_GEN_15[6]}},_GEN_15}; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [29:0] _GEN_16 = {$signed(_T_84), 20'h0}; // @[CORDIC.scala 52:44]
  wire [29:0] _T_100 = $signed(regsY_3) + $signed(_GEN_16); // @[CORDIC.scala 52:44]
  wire [29:0] _T_103 = $signed(regsY_3) - $signed(_GEN_16); // @[CORDIC.scala 52:69]
  wire [29:0] _T_107 = $signed(regsPhase_3) - 30'sh7f56ea; // @[CORDIC.scala 53:52]
  wire [29:0] _T_110 = $signed(regsPhase_3) + 30'sh7f56ea; // @[CORDIC.scala 53:91]
  wire [24:0] _T_113 = regsX_4[29:5]; // @[CORDIC.scala 46:30]
  wire [25:0] _T_114 = {$signed(_T_113), 1'h0}; // @[CORDIC.scala 46:35]
  wire [24:0] _T_116 = regsY_4[29:5]; // @[CORDIC.scala 48:30]
  wire [25:0] _T_117 = {$signed(_T_116), 1'h0}; // @[CORDIC.scala 48:35]
  wire  _T_118 = $signed(regsPhase_4) > 30'sh0; // @[CORDIC.scala 49:37]
  wire [5:0] _GEN_18 = _T_117[25:20]; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [9:0] _T_115 = {{4{_GEN_18[5]}},_GEN_18}; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [29:0] _GEN_19 = {$signed(_T_115), 20'h0}; // @[CORDIC.scala 51:44]
  wire [29:0] _T_121 = $signed(regsX_4) - $signed(_GEN_19); // @[CORDIC.scala 51:44]
  wire [29:0] _T_124 = $signed(regsX_4) + $signed(_GEN_19); // @[CORDIC.scala 51:69]
  wire [5:0] _GEN_21 = _T_114[25:20]; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [9:0] _T_112 = {{4{_GEN_21[5]}},_GEN_21}; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [29:0] _GEN_22 = {$signed(_T_112), 20'h0}; // @[CORDIC.scala 52:44]
  wire [29:0] _T_128 = $signed(regsY_4) + $signed(_GEN_22); // @[CORDIC.scala 52:44]
  wire [29:0] _T_131 = $signed(regsY_4) - $signed(_GEN_22); // @[CORDIC.scala 52:69]
  wire [29:0] _T_135 = $signed(regsPhase_4) - 30'sh3feab7; // @[CORDIC.scala 53:52]
  wire [29:0] _T_138 = $signed(regsPhase_4) + 30'sh3feab7; // @[CORDIC.scala 53:91]
  wire [23:0] _T_141 = regsX_5[29:6]; // @[CORDIC.scala 46:30]
  wire [24:0] _T_142 = {$signed(_T_141), 1'h0}; // @[CORDIC.scala 46:35]
  wire [23:0] _T_144 = regsY_5[29:6]; // @[CORDIC.scala 48:30]
  wire [24:0] _T_145 = {$signed(_T_144), 1'h0}; // @[CORDIC.scala 48:35]
  wire  _T_146 = $signed(regsPhase_5) > 30'sh0; // @[CORDIC.scala 49:37]
  wire [4:0] _GEN_24 = _T_145[24:20]; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [9:0] _T_143 = {{5{_GEN_24[4]}},_GEN_24}; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [29:0] _GEN_25 = {$signed(_T_143), 20'h0}; // @[CORDIC.scala 51:44]
  wire [29:0] _T_149 = $signed(regsX_5) - $signed(_GEN_25); // @[CORDIC.scala 51:44]
  wire [29:0] _T_152 = $signed(regsX_5) + $signed(_GEN_25); // @[CORDIC.scala 51:69]
  wire [4:0] _GEN_27 = _T_142[24:20]; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [9:0] _T_140 = {{5{_GEN_27[4]}},_GEN_27}; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [29:0] _GEN_28 = {$signed(_T_140), 20'h0}; // @[CORDIC.scala 52:44]
  wire [29:0] _T_156 = $signed(regsY_5) + $signed(_GEN_28); // @[CORDIC.scala 52:44]
  wire [29:0] _T_159 = $signed(regsY_5) - $signed(_GEN_28); // @[CORDIC.scala 52:69]
  wire [29:0] _T_163 = $signed(regsPhase_5) - 30'sh1ffd56; // @[CORDIC.scala 53:52]
  wire [29:0] _T_166 = $signed(regsPhase_5) + 30'sh1ffd56; // @[CORDIC.scala 53:91]
  wire [22:0] _T_169 = regsX_6[29:7]; // @[CORDIC.scala 46:30]
  wire [23:0] _T_170 = {$signed(_T_169), 1'h0}; // @[CORDIC.scala 46:35]
  wire [22:0] _T_172 = regsY_6[29:7]; // @[CORDIC.scala 48:30]
  wire [23:0] _T_173 = {$signed(_T_172), 1'h0}; // @[CORDIC.scala 48:35]
  wire  _T_174 = $signed(regsPhase_6) > 30'sh0; // @[CORDIC.scala 49:37]
  wire [3:0] _GEN_30 = _T_173[23:20]; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [9:0] _T_171 = {{6{_GEN_30[3]}},_GEN_30}; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [29:0] _GEN_31 = {$signed(_T_171), 20'h0}; // @[CORDIC.scala 51:44]
  wire [29:0] _T_177 = $signed(regsX_6) - $signed(_GEN_31); // @[CORDIC.scala 51:44]
  wire [29:0] _T_180 = $signed(regsX_6) + $signed(_GEN_31); // @[CORDIC.scala 51:69]
  wire [3:0] _GEN_33 = _T_170[23:20]; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [9:0] _T_168 = {{6{_GEN_33[3]}},_GEN_33}; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [29:0] _GEN_34 = {$signed(_T_168), 20'h0}; // @[CORDIC.scala 52:44]
  wire [29:0] _T_184 = $signed(regsY_6) + $signed(_GEN_34); // @[CORDIC.scala 52:44]
  wire [29:0] _T_187 = $signed(regsY_6) - $signed(_GEN_34); // @[CORDIC.scala 52:69]
  wire [29:0] _T_191 = $signed(regsPhase_6) - 30'shfffab; // @[CORDIC.scala 53:52]
  wire [29:0] _T_194 = $signed(regsPhase_6) + 30'shfffab; // @[CORDIC.scala 53:91]
  wire [21:0] _T_197 = regsX_7[29:8]; // @[CORDIC.scala 46:30]
  wire [22:0] _T_198 = {$signed(_T_197), 1'h0}; // @[CORDIC.scala 46:35]
  wire [21:0] _T_200 = regsY_7[29:8]; // @[CORDIC.scala 48:30]
  wire [22:0] _T_201 = {$signed(_T_200), 1'h0}; // @[CORDIC.scala 48:35]
  wire  _T_202 = $signed(regsPhase_7) > 30'sh0; // @[CORDIC.scala 49:37]
  wire [2:0] _GEN_36 = _T_201[22:20]; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [9:0] _T_199 = {{7{_GEN_36[2]}},_GEN_36}; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [29:0] _GEN_37 = {$signed(_T_199), 20'h0}; // @[CORDIC.scala 51:44]
  wire [29:0] _T_205 = $signed(regsX_7) - $signed(_GEN_37); // @[CORDIC.scala 51:44]
  wire [29:0] _T_208 = $signed(regsX_7) + $signed(_GEN_37); // @[CORDIC.scala 51:69]
  wire [2:0] _GEN_39 = _T_198[22:20]; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [9:0] _T_196 = {{7{_GEN_39[2]}},_GEN_39}; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [29:0] _GEN_40 = {$signed(_T_196), 20'h0}; // @[CORDIC.scala 52:44]
  wire [29:0] _T_212 = $signed(regsY_7) + $signed(_GEN_40); // @[CORDIC.scala 52:44]
  wire [29:0] _T_215 = $signed(regsY_7) - $signed(_GEN_40); // @[CORDIC.scala 52:69]
  wire [29:0] _T_219 = $signed(regsPhase_7) - 30'sh7fff5; // @[CORDIC.scala 53:52]
  wire [29:0] _T_222 = $signed(regsPhase_7) + 30'sh7fff5; // @[CORDIC.scala 53:91]
  wire [20:0] _T_225 = regsX_8[29:9]; // @[CORDIC.scala 46:30]
  wire [21:0] _T_226 = {$signed(_T_225), 1'h0}; // @[CORDIC.scala 46:35]
  wire [20:0] _T_228 = regsY_8[29:9]; // @[CORDIC.scala 48:30]
  wire [21:0] _T_229 = {$signed(_T_228), 1'h0}; // @[CORDIC.scala 48:35]
  wire  _T_230 = $signed(regsPhase_8) > 30'sh0; // @[CORDIC.scala 49:37]
  wire [1:0] _GEN_42 = _T_229[21:20]; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [9:0] _T_227 = {{8{_GEN_42[1]}},_GEN_42}; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [29:0] _GEN_43 = {$signed(_T_227), 20'h0}; // @[CORDIC.scala 51:44]
  wire [29:0] _T_233 = $signed(regsX_8) - $signed(_GEN_43); // @[CORDIC.scala 51:44]
  wire [29:0] _T_236 = $signed(regsX_8) + $signed(_GEN_43); // @[CORDIC.scala 51:69]
  wire [1:0] _GEN_45 = _T_226[21:20]; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [9:0] _T_224 = {{8{_GEN_45[1]}},_GEN_45}; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [29:0] _GEN_46 = {$signed(_T_224), 20'h0}; // @[CORDIC.scala 52:44]
  wire [29:0] _T_240 = $signed(regsY_8) + $signed(_GEN_46); // @[CORDIC.scala 52:44]
  wire [29:0] _T_243 = $signed(regsY_8) - $signed(_GEN_46); // @[CORDIC.scala 52:69]
  wire [29:0] _T_247 = $signed(regsPhase_8) - 30'sh3ffff; // @[CORDIC.scala 53:52]
  wire [29:0] _T_250 = $signed(regsPhase_8) + 30'sh3ffff; // @[CORDIC.scala 53:91]
  wire [19:0] _T_253 = regsX_9[29:10]; // @[CORDIC.scala 46:30]
  wire [20:0] _T_254 = {$signed(_T_253), 1'h0}; // @[CORDIC.scala 46:35]
  wire [19:0] _T_256 = regsY_9[29:10]; // @[CORDIC.scala 48:30]
  wire [20:0] _T_257 = {$signed(_T_256), 1'h0}; // @[CORDIC.scala 48:35]
  wire  _T_258 = $signed(regsPhase_9) > 30'sh0; // @[CORDIC.scala 49:37]
  wire  _GEN_48 = _T_257[20]; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [9:0] _T_255 = {10{_GEN_48}}; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [29:0] _GEN_49 = {$signed(_T_255), 20'h0}; // @[CORDIC.scala 51:44]
  wire [29:0] _T_261 = $signed(regsX_9) - $signed(_GEN_49); // @[CORDIC.scala 51:44]
  wire [29:0] _T_264 = $signed(regsX_9) + $signed(_GEN_49); // @[CORDIC.scala 51:69]
  wire  _GEN_51 = _T_254[20]; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [9:0] _T_252 = {10{_GEN_51}}; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [29:0] _GEN_52 = {$signed(_T_252), 20'h0}; // @[CORDIC.scala 52:44]
  wire [29:0] _T_268 = $signed(regsY_9) + $signed(_GEN_52); // @[CORDIC.scala 52:44]
  wire [29:0] _T_271 = $signed(regsY_9) - $signed(_GEN_52); // @[CORDIC.scala 52:69]
  wire [29:0] _T_275 = $signed(regsPhase_9) - 30'sh20000; // @[CORDIC.scala 53:52]
  wire [29:0] _T_278 = $signed(regsPhase_9) + 30'sh20000; // @[CORDIC.scala 53:91]
  wire [18:0] _T_281 = regsX_10[29:11]; // @[CORDIC.scala 46:30]
  wire [19:0] _T_282 = {$signed(_T_281), 1'h0}; // @[CORDIC.scala 46:35]
  wire [18:0] _T_284 = regsY_10[29:11]; // @[CORDIC.scala 48:30]
  wire [19:0] _T_285 = {$signed(_T_284), 1'h0}; // @[CORDIC.scala 48:35]
  wire  _T_286 = $signed(regsPhase_10) > 30'sh0; // @[CORDIC.scala 49:37]
  wire  _GEN_55 = _T_285[19]; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [9:0] _T_283 = {10{_GEN_55}}; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [29:0] _GEN_56 = {$signed(_T_283), 20'h0}; // @[CORDIC.scala 51:44]
  wire [29:0] _T_289 = $signed(regsX_10) - $signed(_GEN_56); // @[CORDIC.scala 51:44]
  wire [29:0] _T_292 = $signed(regsX_10) + $signed(_GEN_56); // @[CORDIC.scala 51:69]
  wire  _GEN_59 = _T_282[19]; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [9:0] _T_280 = {10{_GEN_59}}; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [29:0] _GEN_60 = {$signed(_T_280), 20'h0}; // @[CORDIC.scala 52:44]
  wire [29:0] _T_296 = $signed(regsY_10) + $signed(_GEN_60); // @[CORDIC.scala 52:44]
  wire [29:0] _T_299 = $signed(regsY_10) - $signed(_GEN_60); // @[CORDIC.scala 52:69]
  wire [29:0] _T_303 = $signed(regsPhase_10) - 30'sh10000; // @[CORDIC.scala 53:52]
  wire [29:0] _T_306 = $signed(regsPhase_10) + 30'sh10000; // @[CORDIC.scala 53:91]
  wire [17:0] _T_309 = regsX_11[29:12]; // @[CORDIC.scala 46:30]
  wire [18:0] _T_310 = {$signed(_T_309), 1'h0}; // @[CORDIC.scala 46:35]
  wire [17:0] _T_312 = regsY_11[29:12]; // @[CORDIC.scala 48:30]
  wire [18:0] _T_313 = {$signed(_T_312), 1'h0}; // @[CORDIC.scala 48:35]
  wire  _T_314 = $signed(regsPhase_11) > 30'sh0; // @[CORDIC.scala 49:37]
  wire  _GEN_63 = _T_313[18]; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [9:0] _T_311 = {10{_GEN_63}}; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [29:0] _GEN_64 = {$signed(_T_311), 20'h0}; // @[CORDIC.scala 51:44]
  wire [29:0] _T_317 = $signed(regsX_11) - $signed(_GEN_64); // @[CORDIC.scala 51:44]
  wire [29:0] _T_320 = $signed(regsX_11) + $signed(_GEN_64); // @[CORDIC.scala 51:69]
  wire  _GEN_67 = _T_310[18]; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [9:0] _T_308 = {10{_GEN_67}}; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [29:0] _GEN_68 = {$signed(_T_308), 20'h0}; // @[CORDIC.scala 52:44]
  wire [29:0] _T_324 = $signed(regsY_11) + $signed(_GEN_68); // @[CORDIC.scala 52:44]
  wire [29:0] _T_327 = $signed(regsY_11) - $signed(_GEN_68); // @[CORDIC.scala 52:69]
  wire [29:0] _T_331 = $signed(regsPhase_11) - 30'sh8000; // @[CORDIC.scala 53:52]
  wire [29:0] _T_334 = $signed(regsPhase_11) + 30'sh8000; // @[CORDIC.scala 53:91]
  wire [16:0] _T_337 = regsX_12[29:13]; // @[CORDIC.scala 46:30]
  wire [17:0] _T_338 = {$signed(_T_337), 1'h0}; // @[CORDIC.scala 46:35]
  wire [16:0] _T_340 = regsY_12[29:13]; // @[CORDIC.scala 48:30]
  wire [17:0] _T_341 = {$signed(_T_340), 1'h0}; // @[CORDIC.scala 48:35]
  wire  _T_342 = $signed(regsPhase_12) > 30'sh0; // @[CORDIC.scala 49:37]
  wire  _GEN_71 = _T_341[17]; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [9:0] _T_339 = {10{_GEN_71}}; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [29:0] _GEN_72 = {$signed(_T_339), 20'h0}; // @[CORDIC.scala 51:44]
  wire [29:0] _T_345 = $signed(regsX_12) - $signed(_GEN_72); // @[CORDIC.scala 51:44]
  wire [29:0] _T_348 = $signed(regsX_12) + $signed(_GEN_72); // @[CORDIC.scala 51:69]
  wire  _GEN_75 = _T_338[17]; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [9:0] _T_336 = {10{_GEN_75}}; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [29:0] _GEN_76 = {$signed(_T_336), 20'h0}; // @[CORDIC.scala 52:44]
  wire [29:0] _T_352 = $signed(regsY_12) + $signed(_GEN_76); // @[CORDIC.scala 52:44]
  wire [29:0] _T_355 = $signed(regsY_12) - $signed(_GEN_76); // @[CORDIC.scala 52:69]
  wire [29:0] _T_359 = $signed(regsPhase_12) - 30'sh4000; // @[CORDIC.scala 53:52]
  wire [29:0] _T_362 = $signed(regsPhase_12) + 30'sh4000; // @[CORDIC.scala 53:91]
  wire [15:0] _T_365 = regsX_13[29:14]; // @[CORDIC.scala 46:30]
  wire [16:0] _T_366 = {$signed(_T_365), 1'h0}; // @[CORDIC.scala 46:35]
  wire [15:0] _T_368 = regsY_13[29:14]; // @[CORDIC.scala 48:30]
  wire [16:0] _T_369 = {$signed(_T_368), 1'h0}; // @[CORDIC.scala 48:35]
  wire  _T_370 = $signed(regsPhase_13) > 30'sh0; // @[CORDIC.scala 49:37]
  wire  _GEN_79 = _T_369[16]; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [9:0] _T_367 = {10{_GEN_79}}; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [29:0] _GEN_80 = {$signed(_T_367), 20'h0}; // @[CORDIC.scala 51:44]
  wire [29:0] _T_373 = $signed(regsX_13) - $signed(_GEN_80); // @[CORDIC.scala 51:44]
  wire [29:0] _T_376 = $signed(regsX_13) + $signed(_GEN_80); // @[CORDIC.scala 51:69]
  wire  _GEN_83 = _T_366[16]; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [9:0] _T_364 = {10{_GEN_83}}; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [29:0] _GEN_84 = {$signed(_T_364), 20'h0}; // @[CORDIC.scala 52:44]
  wire [29:0] _T_380 = $signed(regsY_13) + $signed(_GEN_84); // @[CORDIC.scala 52:44]
  wire [29:0] _T_383 = $signed(regsY_13) - $signed(_GEN_84); // @[CORDIC.scala 52:69]
  wire [29:0] _T_387 = $signed(regsPhase_13) - 30'sh2000; // @[CORDIC.scala 53:52]
  wire [29:0] _T_390 = $signed(regsPhase_13) + 30'sh2000; // @[CORDIC.scala 53:91]
  wire [14:0] _T_393 = regsX_14[29:15]; // @[CORDIC.scala 46:30]
  wire [15:0] _T_394 = {$signed(_T_393), 1'h0}; // @[CORDIC.scala 46:35]
  wire [14:0] _T_396 = regsY_14[29:15]; // @[CORDIC.scala 48:30]
  wire [15:0] _T_397 = {$signed(_T_396), 1'h0}; // @[CORDIC.scala 48:35]
  wire  _T_398 = $signed(regsPhase_14) > 30'sh0; // @[CORDIC.scala 49:37]
  wire  _GEN_87 = _T_397[15]; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [9:0] _T_395 = {10{_GEN_87}}; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [29:0] _GEN_88 = {$signed(_T_395), 20'h0}; // @[CORDIC.scala 51:44]
  wire [29:0] _T_401 = $signed(regsX_14) - $signed(_GEN_88); // @[CORDIC.scala 51:44]
  wire [29:0] _T_404 = $signed(regsX_14) + $signed(_GEN_88); // @[CORDIC.scala 51:69]
  wire  _GEN_91 = _T_394[15]; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [9:0] _T_392 = {10{_GEN_91}}; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [29:0] _GEN_92 = {$signed(_T_392), 20'h0}; // @[CORDIC.scala 52:44]
  wire [29:0] _T_408 = $signed(regsY_14) + $signed(_GEN_92); // @[CORDIC.scala 52:44]
  wire [29:0] _T_411 = $signed(regsY_14) - $signed(_GEN_92); // @[CORDIC.scala 52:69]
  wire [29:0] _T_415 = $signed(regsPhase_14) - 30'sh1000; // @[CORDIC.scala 53:52]
  wire [29:0] _T_418 = $signed(regsPhase_14) + 30'sh1000; // @[CORDIC.scala 53:91]
  wire [13:0] _T_421 = regsX_15[29:16]; // @[CORDIC.scala 46:30]
  wire [14:0] _T_422 = {$signed(_T_421), 1'h0}; // @[CORDIC.scala 46:35]
  wire [13:0] _T_424 = regsY_15[29:16]; // @[CORDIC.scala 48:30]
  wire [14:0] _T_425 = {$signed(_T_424), 1'h0}; // @[CORDIC.scala 48:35]
  wire  _T_426 = $signed(regsPhase_15) > 30'sh0; // @[CORDIC.scala 49:37]
  wire  _GEN_95 = _T_425[14]; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [9:0] _T_423 = {10{_GEN_95}}; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [29:0] _GEN_96 = {$signed(_T_423), 20'h0}; // @[CORDIC.scala 51:44]
  wire [29:0] _T_429 = $signed(regsX_15) - $signed(_GEN_96); // @[CORDIC.scala 51:44]
  wire [29:0] _T_432 = $signed(regsX_15) + $signed(_GEN_96); // @[CORDIC.scala 51:69]
  wire  _GEN_99 = _T_422[14]; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [9:0] _T_420 = {10{_GEN_99}}; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [29:0] _GEN_100 = {$signed(_T_420), 20'h0}; // @[CORDIC.scala 52:44]
  wire [29:0] _T_436 = $signed(regsY_15) + $signed(_GEN_100); // @[CORDIC.scala 52:44]
  wire [29:0] _T_439 = $signed(regsY_15) - $signed(_GEN_100); // @[CORDIC.scala 52:69]
  wire [29:0] _T_443 = $signed(regsPhase_15) - 30'sh800; // @[CORDIC.scala 53:52]
  wire [29:0] _T_446 = $signed(regsPhase_15) + 30'sh800; // @[CORDIC.scala 53:91]
  wire [12:0] _T_449 = regsX_16[29:17]; // @[CORDIC.scala 46:30]
  wire [13:0] _T_450 = {$signed(_T_449), 1'h0}; // @[CORDIC.scala 46:35]
  wire [12:0] _T_452 = regsY_16[29:17]; // @[CORDIC.scala 48:30]
  wire [13:0] _T_453 = {$signed(_T_452), 1'h0}; // @[CORDIC.scala 48:35]
  wire  _T_454 = $signed(regsPhase_16) > 30'sh0; // @[CORDIC.scala 49:37]
  wire  _GEN_103 = _T_453[13]; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [9:0] _T_451 = {10{_GEN_103}}; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [29:0] _GEN_104 = {$signed(_T_451), 20'h0}; // @[CORDIC.scala 51:44]
  wire [29:0] _T_457 = $signed(regsX_16) - $signed(_GEN_104); // @[CORDIC.scala 51:44]
  wire [29:0] _T_460 = $signed(regsX_16) + $signed(_GEN_104); // @[CORDIC.scala 51:69]
  wire  _GEN_107 = _T_450[13]; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [9:0] _T_448 = {10{_GEN_107}}; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [29:0] _GEN_108 = {$signed(_T_448), 20'h0}; // @[CORDIC.scala 52:44]
  wire [29:0] _T_464 = $signed(regsY_16) + $signed(_GEN_108); // @[CORDIC.scala 52:44]
  wire [29:0] _T_467 = $signed(regsY_16) - $signed(_GEN_108); // @[CORDIC.scala 52:69]
  wire [29:0] _T_471 = $signed(regsPhase_16) - 30'sh400; // @[CORDIC.scala 53:52]
  wire [29:0] _T_474 = $signed(regsPhase_16) + 30'sh400; // @[CORDIC.scala 53:91]
  wire [11:0] _T_477 = regsX_17[29:18]; // @[CORDIC.scala 46:30]
  wire [12:0] _T_478 = {$signed(_T_477), 1'h0}; // @[CORDIC.scala 46:35]
  wire [11:0] _T_480 = regsY_17[29:18]; // @[CORDIC.scala 48:30]
  wire [12:0] _T_481 = {$signed(_T_480), 1'h0}; // @[CORDIC.scala 48:35]
  wire  _T_482 = $signed(regsPhase_17) > 30'sh0; // @[CORDIC.scala 49:37]
  wire  _GEN_111 = _T_481[12]; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [9:0] _T_479 = {10{_GEN_111}}; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [29:0] _GEN_112 = {$signed(_T_479), 20'h0}; // @[CORDIC.scala 51:44]
  wire [29:0] _T_485 = $signed(regsX_17) - $signed(_GEN_112); // @[CORDIC.scala 51:44]
  wire [29:0] _T_488 = $signed(regsX_17) + $signed(_GEN_112); // @[CORDIC.scala 51:69]
  wire  _GEN_115 = _T_478[12]; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [9:0] _T_476 = {10{_GEN_115}}; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [29:0] _GEN_116 = {$signed(_T_476), 20'h0}; // @[CORDIC.scala 52:44]
  wire [29:0] _T_492 = $signed(regsY_17) + $signed(_GEN_116); // @[CORDIC.scala 52:44]
  wire [29:0] _T_495 = $signed(regsY_17) - $signed(_GEN_116); // @[CORDIC.scala 52:69]
  wire [29:0] _T_499 = $signed(regsPhase_17) - 30'sh200; // @[CORDIC.scala 53:52]
  wire [29:0] _T_502 = $signed(regsPhase_17) + 30'sh200; // @[CORDIC.scala 53:91]
  wire [10:0] _T_505 = regsX_18[29:19]; // @[CORDIC.scala 46:30]
  wire [11:0] _T_506 = {$signed(_T_505), 1'h0}; // @[CORDIC.scala 46:35]
  wire [10:0] _T_508 = regsY_18[29:19]; // @[CORDIC.scala 48:30]
  wire [11:0] _T_509 = {$signed(_T_508), 1'h0}; // @[CORDIC.scala 48:35]
  wire  _T_510 = $signed(regsPhase_18) > 30'sh0; // @[CORDIC.scala 49:37]
  wire  _GEN_119 = _T_509[11]; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [9:0] _T_507 = {10{_GEN_119}}; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [29:0] _GEN_120 = {$signed(_T_507), 20'h0}; // @[CORDIC.scala 51:44]
  wire [29:0] _T_513 = $signed(regsX_18) - $signed(_GEN_120); // @[CORDIC.scala 51:44]
  wire [29:0] _T_516 = $signed(regsX_18) + $signed(_GEN_120); // @[CORDIC.scala 51:69]
  wire  _GEN_123 = _T_506[11]; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [9:0] _T_504 = {10{_GEN_123}}; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [29:0] _GEN_124 = {$signed(_T_504), 20'h0}; // @[CORDIC.scala 52:44]
  wire [29:0] _T_520 = $signed(regsY_18) + $signed(_GEN_124); // @[CORDIC.scala 52:44]
  wire [29:0] _T_523 = $signed(regsY_18) - $signed(_GEN_124); // @[CORDIC.scala 52:69]
  wire [29:0] _T_527 = $signed(regsPhase_18) - 30'sh100; // @[CORDIC.scala 53:52]
  wire [29:0] _T_530 = $signed(regsPhase_18) + 30'sh100; // @[CORDIC.scala 53:91]
  wire [9:0] _T_533 = regsX_19[29:20]; // @[CORDIC.scala 46:30]
  wire [10:0] _T_534 = {$signed(_T_533), 1'h0}; // @[CORDIC.scala 46:35]
  wire [9:0] _T_536 = regsY_19[29:20]; // @[CORDIC.scala 48:30]
  wire [10:0] _T_537 = {$signed(_T_536), 1'h0}; // @[CORDIC.scala 48:35]
  wire  _T_538 = $signed(regsPhase_19) > 30'sh0; // @[CORDIC.scala 49:37]
  wire  _GEN_127 = _T_537[10]; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [9:0] _T_535 = {10{_GEN_127}}; // @[CORDIC.scala 47:24 CORDIC.scala 48:14]
  wire [29:0] _GEN_128 = {$signed(_T_535), 20'h0}; // @[CORDIC.scala 51:44]
  wire [29:0] _T_541 = $signed(regsX_19) - $signed(_GEN_128); // @[CORDIC.scala 51:44]
  wire [29:0] _T_544 = $signed(regsX_19) + $signed(_GEN_128); // @[CORDIC.scala 51:69]
  wire  _GEN_131 = _T_534[10]; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [9:0] _T_532 = {10{_GEN_131}}; // @[CORDIC.scala 45:24 CORDIC.scala 46:14]
  wire [29:0] _GEN_132 = {$signed(_T_532), 20'h0}; // @[CORDIC.scala 52:44]
  wire [29:0] _T_548 = $signed(regsY_19) + $signed(_GEN_132); // @[CORDIC.scala 52:44]
  wire [29:0] _T_551 = $signed(regsY_19) - $signed(_GEN_132); // @[CORDIC.scala 52:69]
  wire [59:0] _T_560 = $signed(regsX_20) * 30'sh4dba76d; // @[CORDIC.scala 56:29]
  wire [59:0] _T_561 = $signed(regsY_20) * 30'sh4dba76d; // @[CORDIC.scala 57:29]
  wire [32:0] _GEN_134 = _T_560[59:27]; // @[CORDIC.scala 56:15]
  wire [32:0] _GEN_136 = _T_561[59:27]; // @[CORDIC.scala 57:15]
  assign io_dataOutX = _GEN_134[29:0]; // @[CORDIC.scala 56:15]
  assign io_dataOutY = _GEN_136[29:0]; // @[CORDIC.scala 57:15]
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
  _RAND_0 = {1{`RANDOM}};
  regsX_1 = _RAND_0[29:0];
  _RAND_1 = {1{`RANDOM}};
  regsX_2 = _RAND_1[29:0];
  _RAND_2 = {1{`RANDOM}};
  regsX_3 = _RAND_2[29:0];
  _RAND_3 = {1{`RANDOM}};
  regsX_4 = _RAND_3[29:0];
  _RAND_4 = {1{`RANDOM}};
  regsX_5 = _RAND_4[29:0];
  _RAND_5 = {1{`RANDOM}};
  regsX_6 = _RAND_5[29:0];
  _RAND_6 = {1{`RANDOM}};
  regsX_7 = _RAND_6[29:0];
  _RAND_7 = {1{`RANDOM}};
  regsX_8 = _RAND_7[29:0];
  _RAND_8 = {1{`RANDOM}};
  regsX_9 = _RAND_8[29:0];
  _RAND_9 = {1{`RANDOM}};
  regsX_10 = _RAND_9[29:0];
  _RAND_10 = {1{`RANDOM}};
  regsX_11 = _RAND_10[29:0];
  _RAND_11 = {1{`RANDOM}};
  regsX_12 = _RAND_11[29:0];
  _RAND_12 = {1{`RANDOM}};
  regsX_13 = _RAND_12[29:0];
  _RAND_13 = {1{`RANDOM}};
  regsX_14 = _RAND_13[29:0];
  _RAND_14 = {1{`RANDOM}};
  regsX_15 = _RAND_14[29:0];
  _RAND_15 = {1{`RANDOM}};
  regsX_16 = _RAND_15[29:0];
  _RAND_16 = {1{`RANDOM}};
  regsX_17 = _RAND_16[29:0];
  _RAND_17 = {1{`RANDOM}};
  regsX_18 = _RAND_17[29:0];
  _RAND_18 = {1{`RANDOM}};
  regsX_19 = _RAND_18[29:0];
  _RAND_19 = {1{`RANDOM}};
  regsX_20 = _RAND_19[29:0];
  _RAND_20 = {1{`RANDOM}};
  regsY_1 = _RAND_20[29:0];
  _RAND_21 = {1{`RANDOM}};
  regsY_2 = _RAND_21[29:0];
  _RAND_22 = {1{`RANDOM}};
  regsY_3 = _RAND_22[29:0];
  _RAND_23 = {1{`RANDOM}};
  regsY_4 = _RAND_23[29:0];
  _RAND_24 = {1{`RANDOM}};
  regsY_5 = _RAND_24[29:0];
  _RAND_25 = {1{`RANDOM}};
  regsY_6 = _RAND_25[29:0];
  _RAND_26 = {1{`RANDOM}};
  regsY_7 = _RAND_26[29:0];
  _RAND_27 = {1{`RANDOM}};
  regsY_8 = _RAND_27[29:0];
  _RAND_28 = {1{`RANDOM}};
  regsY_9 = _RAND_28[29:0];
  _RAND_29 = {1{`RANDOM}};
  regsY_10 = _RAND_29[29:0];
  _RAND_30 = {1{`RANDOM}};
  regsY_11 = _RAND_30[29:0];
  _RAND_31 = {1{`RANDOM}};
  regsY_12 = _RAND_31[29:0];
  _RAND_32 = {1{`RANDOM}};
  regsY_13 = _RAND_32[29:0];
  _RAND_33 = {1{`RANDOM}};
  regsY_14 = _RAND_33[29:0];
  _RAND_34 = {1{`RANDOM}};
  regsY_15 = _RAND_34[29:0];
  _RAND_35 = {1{`RANDOM}};
  regsY_16 = _RAND_35[29:0];
  _RAND_36 = {1{`RANDOM}};
  regsY_17 = _RAND_36[29:0];
  _RAND_37 = {1{`RANDOM}};
  regsY_18 = _RAND_37[29:0];
  _RAND_38 = {1{`RANDOM}};
  regsY_19 = _RAND_38[29:0];
  _RAND_39 = {1{`RANDOM}};
  regsY_20 = _RAND_39[29:0];
  _RAND_40 = {1{`RANDOM}};
  regsPhase_0 = _RAND_40[29:0];
  _RAND_41 = {1{`RANDOM}};
  regsPhase_1 = _RAND_41[29:0];
  _RAND_42 = {1{`RANDOM}};
  regsPhase_2 = _RAND_42[29:0];
  _RAND_43 = {1{`RANDOM}};
  regsPhase_3 = _RAND_43[29:0];
  _RAND_44 = {1{`RANDOM}};
  regsPhase_4 = _RAND_44[29:0];
  _RAND_45 = {1{`RANDOM}};
  regsPhase_5 = _RAND_45[29:0];
  _RAND_46 = {1{`RANDOM}};
  regsPhase_6 = _RAND_46[29:0];
  _RAND_47 = {1{`RANDOM}};
  regsPhase_7 = _RAND_47[29:0];
  _RAND_48 = {1{`RANDOM}};
  regsPhase_8 = _RAND_48[29:0];
  _RAND_49 = {1{`RANDOM}};
  regsPhase_9 = _RAND_49[29:0];
  _RAND_50 = {1{`RANDOM}};
  regsPhase_10 = _RAND_50[29:0];
  _RAND_51 = {1{`RANDOM}};
  regsPhase_11 = _RAND_51[29:0];
  _RAND_52 = {1{`RANDOM}};
  regsPhase_12 = _RAND_52[29:0];
  _RAND_53 = {1{`RANDOM}};
  regsPhase_13 = _RAND_53[29:0];
  _RAND_54 = {1{`RANDOM}};
  regsPhase_14 = _RAND_54[29:0];
  _RAND_55 = {1{`RANDOM}};
  regsPhase_15 = _RAND_55[29:0];
  _RAND_56 = {1{`RANDOM}};
  regsPhase_16 = _RAND_56[29:0];
  _RAND_57 = {1{`RANDOM}};
  regsPhase_17 = _RAND_57[29:0];
  _RAND_58 = {1{`RANDOM}};
  regsPhase_18 = _RAND_58[29:0];
  _RAND_59 = {1{`RANDOM}};
  regsPhase_19 = _RAND_59[29:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (_T_6) begin
      regsX_1 <= _T_9;
    end else begin
      regsX_1 <= 30'sh8000000;
    end
    if (_T_34) begin
      regsX_2 <= _T_37;
    end else begin
      regsX_2 <= _T_40;
    end
    if (_T_62) begin
      regsX_3 <= _T_65;
    end else begin
      regsX_3 <= _T_68;
    end
    if (_T_90) begin
      regsX_4 <= _T_93;
    end else begin
      regsX_4 <= _T_96;
    end
    if (_T_118) begin
      regsX_5 <= _T_121;
    end else begin
      regsX_5 <= _T_124;
    end
    if (_T_146) begin
      regsX_6 <= _T_149;
    end else begin
      regsX_6 <= _T_152;
    end
    if (_T_174) begin
      regsX_7 <= _T_177;
    end else begin
      regsX_7 <= _T_180;
    end
    if (_T_202) begin
      regsX_8 <= _T_205;
    end else begin
      regsX_8 <= _T_208;
    end
    if (_T_230) begin
      regsX_9 <= _T_233;
    end else begin
      regsX_9 <= _T_236;
    end
    if (_T_258) begin
      regsX_10 <= _T_261;
    end else begin
      regsX_10 <= _T_264;
    end
    if (_T_286) begin
      regsX_11 <= _T_289;
    end else begin
      regsX_11 <= _T_292;
    end
    if (_T_314) begin
      regsX_12 <= _T_317;
    end else begin
      regsX_12 <= _T_320;
    end
    if (_T_342) begin
      regsX_13 <= _T_345;
    end else begin
      regsX_13 <= _T_348;
    end
    if (_T_370) begin
      regsX_14 <= _T_373;
    end else begin
      regsX_14 <= _T_376;
    end
    if (_T_398) begin
      regsX_15 <= _T_401;
    end else begin
      regsX_15 <= _T_404;
    end
    if (_T_426) begin
      regsX_16 <= _T_429;
    end else begin
      regsX_16 <= _T_432;
    end
    if (_T_454) begin
      regsX_17 <= _T_457;
    end else begin
      regsX_17 <= _T_460;
    end
    if (_T_482) begin
      regsX_18 <= _T_485;
    end else begin
      regsX_18 <= _T_488;
    end
    if (_T_510) begin
      regsX_19 <= _T_513;
    end else begin
      regsX_19 <= _T_516;
    end
    if (_T_538) begin
      regsX_20 <= _T_541;
    end else begin
      regsX_20 <= _T_544;
    end
    if (_T_6) begin
      regsY_1 <= 30'sh8000000;
    end else begin
      regsY_1 <= _T_19;
    end
    if (_T_34) begin
      regsY_2 <= _T_44;
    end else begin
      regsY_2 <= _T_47;
    end
    if (_T_62) begin
      regsY_3 <= _T_72;
    end else begin
      regsY_3 <= _T_75;
    end
    if (_T_90) begin
      regsY_4 <= _T_100;
    end else begin
      regsY_4 <= _T_103;
    end
    if (_T_118) begin
      regsY_5 <= _T_128;
    end else begin
      regsY_5 <= _T_131;
    end
    if (_T_146) begin
      regsY_6 <= _T_156;
    end else begin
      regsY_6 <= _T_159;
    end
    if (_T_174) begin
      regsY_7 <= _T_184;
    end else begin
      regsY_7 <= _T_187;
    end
    if (_T_202) begin
      regsY_8 <= _T_212;
    end else begin
      regsY_8 <= _T_215;
    end
    if (_T_230) begin
      regsY_9 <= _T_240;
    end else begin
      regsY_9 <= _T_243;
    end
    if (_T_258) begin
      regsY_10 <= _T_268;
    end else begin
      regsY_10 <= _T_271;
    end
    if (_T_286) begin
      regsY_11 <= _T_296;
    end else begin
      regsY_11 <= _T_299;
    end
    if (_T_314) begin
      regsY_12 <= _T_324;
    end else begin
      regsY_12 <= _T_327;
    end
    if (_T_342) begin
      regsY_13 <= _T_352;
    end else begin
      regsY_13 <= _T_355;
    end
    if (_T_370) begin
      regsY_14 <= _T_380;
    end else begin
      regsY_14 <= _T_383;
    end
    if (_T_398) begin
      regsY_15 <= _T_408;
    end else begin
      regsY_15 <= _T_411;
    end
    if (_T_426) begin
      regsY_16 <= _T_436;
    end else begin
      regsY_16 <= _T_439;
    end
    if (_T_454) begin
      regsY_17 <= _T_464;
    end else begin
      regsY_17 <= _T_467;
    end
    if (_T_482) begin
      regsY_18 <= _T_492;
    end else begin
      regsY_18 <= _T_495;
    end
    if (_T_510) begin
      regsY_19 <= _T_520;
    end else begin
      regsY_19 <= _T_523;
    end
    if (_T_538) begin
      regsY_20 <= _T_548;
    end else begin
      regsY_20 <= _T_551;
    end
    regsPhase_0 <= io_dataInPhase;
    if (_T_6) begin
      regsPhase_1 <= _T_23;
    end else begin
      regsPhase_1 <= _T_26;
    end
    if (_T_34) begin
      regsPhase_2 <= _T_51;
    end else begin
      regsPhase_2 <= _T_54;
    end
    if (_T_62) begin
      regsPhase_3 <= _T_79;
    end else begin
      regsPhase_3 <= _T_82;
    end
    if (_T_90) begin
      regsPhase_4 <= _T_107;
    end else begin
      regsPhase_4 <= _T_110;
    end
    if (_T_118) begin
      regsPhase_5 <= _T_135;
    end else begin
      regsPhase_5 <= _T_138;
    end
    if (_T_146) begin
      regsPhase_6 <= _T_163;
    end else begin
      regsPhase_6 <= _T_166;
    end
    if (_T_174) begin
      regsPhase_7 <= _T_191;
    end else begin
      regsPhase_7 <= _T_194;
    end
    if (_T_202) begin
      regsPhase_8 <= _T_219;
    end else begin
      regsPhase_8 <= _T_222;
    end
    if (_T_230) begin
      regsPhase_9 <= _T_247;
    end else begin
      regsPhase_9 <= _T_250;
    end
    if (_T_258) begin
      regsPhase_10 <= _T_275;
    end else begin
      regsPhase_10 <= _T_278;
    end
    if (_T_286) begin
      regsPhase_11 <= _T_303;
    end else begin
      regsPhase_11 <= _T_306;
    end
    if (_T_314) begin
      regsPhase_12 <= _T_331;
    end else begin
      regsPhase_12 <= _T_334;
    end
    if (_T_342) begin
      regsPhase_13 <= _T_359;
    end else begin
      regsPhase_13 <= _T_362;
    end
    if (_T_370) begin
      regsPhase_14 <= _T_387;
    end else begin
      regsPhase_14 <= _T_390;
    end
    if (_T_398) begin
      regsPhase_15 <= _T_415;
    end else begin
      regsPhase_15 <= _T_418;
    end
    if (_T_426) begin
      regsPhase_16 <= _T_443;
    end else begin
      regsPhase_16 <= _T_446;
    end
    if (_T_454) begin
      regsPhase_17 <= _T_471;
    end else begin
      regsPhase_17 <= _T_474;
    end
    if (_T_482) begin
      regsPhase_18 <= _T_499;
    end else begin
      regsPhase_18 <= _T_502;
    end
    if (_T_510) begin
      regsPhase_19 <= _T_527;
    end else begin
      regsPhase_19 <= _T_530;
    end
  end
endmodule
