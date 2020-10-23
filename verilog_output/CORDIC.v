module CORDIC(
  input         clock,
  input         reset,
  input  [9:0]  io_dataInX,
  input  [9:0]  io_dataInY,
  input  [9:0]  io_dataInPhase,
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
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
`endif // RANDOMIZE_REG_INIT
  reg [29:0] regsX_0; // @[CORDIC.scala 52:18]
  reg [29:0] regsX_1; // @[CORDIC.scala 52:18]
  reg [29:0] regsX_2; // @[CORDIC.scala 52:18]
  reg [29:0] regsX_3; // @[CORDIC.scala 52:18]
  reg [29:0] regsX_4; // @[CORDIC.scala 52:18]
  reg [29:0] regsX_5; // @[CORDIC.scala 52:18]
  reg [29:0] regsX_6; // @[CORDIC.scala 52:18]
  reg [29:0] regsX_7; // @[CORDIC.scala 52:18]
  reg [29:0] regsX_8; // @[CORDIC.scala 52:18]
  reg [29:0] regsX_9; // @[CORDIC.scala 52:18]
  reg [29:0] regsX_10; // @[CORDIC.scala 52:18]
  reg [29:0] regsX_11; // @[CORDIC.scala 52:18]
  reg [29:0] regsX_12; // @[CORDIC.scala 52:18]
  reg [29:0] regsX_13; // @[CORDIC.scala 52:18]
  reg [29:0] regsX_14; // @[CORDIC.scala 52:18]
  reg [29:0] regsX_15; // @[CORDIC.scala 52:18]
  reg [29:0] regsX_16; // @[CORDIC.scala 52:18]
  reg [29:0] regsX_17; // @[CORDIC.scala 52:18]
  reg [29:0] regsX_18; // @[CORDIC.scala 52:18]
  reg [29:0] regsX_19; // @[CORDIC.scala 52:18]
  reg [29:0] regsX_20; // @[CORDIC.scala 52:18]
  reg [29:0] regsY_0; // @[CORDIC.scala 53:18]
  reg [29:0] regsY_1; // @[CORDIC.scala 53:18]
  reg [29:0] regsY_2; // @[CORDIC.scala 53:18]
  reg [29:0] regsY_3; // @[CORDIC.scala 53:18]
  reg [29:0] regsY_4; // @[CORDIC.scala 53:18]
  reg [29:0] regsY_5; // @[CORDIC.scala 53:18]
  reg [29:0] regsY_6; // @[CORDIC.scala 53:18]
  reg [29:0] regsY_7; // @[CORDIC.scala 53:18]
  reg [29:0] regsY_8; // @[CORDIC.scala 53:18]
  reg [29:0] regsY_9; // @[CORDIC.scala 53:18]
  reg [29:0] regsY_10; // @[CORDIC.scala 53:18]
  reg [29:0] regsY_11; // @[CORDIC.scala 53:18]
  reg [29:0] regsY_12; // @[CORDIC.scala 53:18]
  reg [29:0] regsY_13; // @[CORDIC.scala 53:18]
  reg [29:0] regsY_14; // @[CORDIC.scala 53:18]
  reg [29:0] regsY_15; // @[CORDIC.scala 53:18]
  reg [29:0] regsY_16; // @[CORDIC.scala 53:18]
  reg [29:0] regsY_17; // @[CORDIC.scala 53:18]
  reg [29:0] regsY_18; // @[CORDIC.scala 53:18]
  reg [29:0] regsY_19; // @[CORDIC.scala 53:18]
  reg [29:0] regsY_20; // @[CORDIC.scala 53:18]
  reg [29:0] regsPhase_0; // @[CORDIC.scala 54:22]
  reg [29:0] regsPhase_1; // @[CORDIC.scala 54:22]
  reg [29:0] regsPhase_2; // @[CORDIC.scala 54:22]
  reg [29:0] regsPhase_3; // @[CORDIC.scala 54:22]
  reg [29:0] regsPhase_4; // @[CORDIC.scala 54:22]
  reg [29:0] regsPhase_5; // @[CORDIC.scala 54:22]
  reg [29:0] regsPhase_6; // @[CORDIC.scala 54:22]
  reg [29:0] regsPhase_7; // @[CORDIC.scala 54:22]
  reg [29:0] regsPhase_8; // @[CORDIC.scala 54:22]
  reg [29:0] regsPhase_9; // @[CORDIC.scala 54:22]
  reg [29:0] regsPhase_10; // @[CORDIC.scala 54:22]
  reg [29:0] regsPhase_11; // @[CORDIC.scala 54:22]
  reg [29:0] regsPhase_12; // @[CORDIC.scala 54:22]
  reg [29:0] regsPhase_13; // @[CORDIC.scala 54:22]
  reg [29:0] regsPhase_14; // @[CORDIC.scala 54:22]
  reg [29:0] regsPhase_15; // @[CORDIC.scala 54:22]
  reg [29:0] regsPhase_16; // @[CORDIC.scala 54:22]
  reg [29:0] regsPhase_17; // @[CORDIC.scala 54:22]
  reg [29:0] regsPhase_18; // @[CORDIC.scala 54:22]
  reg [29:0] regsPhase_19; // @[CORDIC.scala 54:22]
  wire  _T = $signed(io_dataInPhase) > 10'sh0; // @[CORDIC.scala 61:43]
  wire [1:0] plusOrMinus = _T ? 2'h1 : 2'h2; // @[CORDIC.scala 61:23]
  wire  _T_2 = $signed(io_dataInPhase) < 10'sh0; // @[CORDIC.scala 62:41]
  wire [9:0] _T_5 = 10'sh0 - $signed(io_dataInPhase); // @[CORDIC.scala 62:41]
  wire [9:0] _T_6 = _T_2 ? $signed(_T_5) : $signed(io_dataInPhase); // @[CORDIC.scala 62:41]
  wire  _T_7 = $signed(_T_6) < 10'shc9; // @[CORDIC.scala 62:45]
  wire [1:0] phase = _T_7 ? 2'h0 : plusOrMinus; // @[CORDIC.scala 62:17]
  wire  _T_9 = phase == 2'h0; // @[CORDIC.scala 72:14]
  wire  _T_10 = phase == 2'h1; // @[CORDIC.scala 76:20]
  wire [10:0] _GEN_6 = {{1{io_dataInY[9]}},io_dataInY}; // @[CORDIC.scala 77:22]
  wire [10:0] _T_13 = 11'sh0 - $signed(_GEN_6); // @[CORDIC.scala 77:22]
  wire [9:0] _T_16 = $signed(io_dataInPhase) - 10'shc9; // @[CORDIC.scala 79:36]
  wire [10:0] _GEN_7 = {{1{io_dataInX[9]}},io_dataInX}; // @[CORDIC.scala 82:22]
  wire [10:0] _T_19 = 11'sh0 - $signed(_GEN_7); // @[CORDIC.scala 82:22]
  wire [9:0] _T_22 = $signed(io_dataInPhase) + 10'shc9; // @[CORDIC.scala 83:36]
  wire [10:0] _GEN_0 = _T_10 ? $signed(_T_13) : $signed({{1{io_dataInY[9]}},io_dataInY}); // @[CORDIC.scala 76:31]
  wire [10:0] _GEN_1 = _T_10 ? $signed({{1{io_dataInX[9]}},io_dataInX}) : $signed(_T_19); // @[CORDIC.scala 76:31]
  wire [9:0] _GEN_2 = _T_10 ? $signed(_T_16) : $signed(_T_22); // @[CORDIC.scala 76:31]
  wire [10:0] _GEN_3 = _T_9 ? $signed({{1{io_dataInX[9]}},io_dataInX}) : $signed(_GEN_0); // @[CORDIC.scala 72:23]
  wire [10:0] _GEN_4 = _T_9 ? $signed({{1{io_dataInY[9]}},io_dataInY}) : $signed(_GEN_1); // @[CORDIC.scala 72:23]
  wire [9:0] _GEN_5 = _T_9 ? $signed(io_dataInPhase) : $signed(_GEN_2); // @[CORDIC.scala 72:23]
  wire [28:0] _T_24 = regsX_0[29:1]; // @[CORDIC.scala 90:30]
  wire [29:0] _T_25 = {$signed(_T_24), 1'h0}; // @[CORDIC.scala 90:35]
  wire [28:0] _T_27 = regsY_0[29:1]; // @[CORDIC.scala 92:30]
  wire [29:0] _T_28 = {$signed(_T_27), 1'h0}; // @[CORDIC.scala 92:35]
  wire  _T_30 = $signed(regsPhase_0) > 30'sh0; // @[CORDIC.scala 96:44]
  wire [10:0] _GEN_8 = _T_28[29:19]; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [9:0] _T_26 = _GEN_8[9:0]; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [28:0] _GEN_10 = {$signed(_T_26), 19'h0}; // @[CORDIC.scala 100:52]
  wire [29:0] _GEN_11 = {{1{_GEN_10[28]}},_GEN_10}; // @[CORDIC.scala 100:52]
  wire [29:0] _T_33 = $signed(regsX_0) - $signed(_GEN_11); // @[CORDIC.scala 100:52]
  wire [29:0] _T_36 = $signed(regsX_0) + $signed(_GEN_11); // @[CORDIC.scala 100:77]
  wire [10:0] _GEN_14 = _T_25[29:19]; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [9:0] _T_23 = _GEN_14[9:0]; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [28:0] _GEN_16 = {$signed(_T_23), 19'h0}; // @[CORDIC.scala 101:52]
  wire [29:0] _GEN_17 = {{1{_GEN_16[28]}},_GEN_16}; // @[CORDIC.scala 101:52]
  wire [29:0] _T_40 = $signed(regsY_0) + $signed(_GEN_17); // @[CORDIC.scala 101:52]
  wire [29:0] _T_43 = $signed(regsY_0) - $signed(_GEN_17); // @[CORDIC.scala 101:77]
  wire [30:0] _GEN_20 = {{1{regsPhase_0[29]}},regsPhase_0}; // @[CORDIC.scala 102:60]
  wire [30:0] _T_47 = $signed(_GEN_20) - 31'sh6400000; // @[CORDIC.scala 102:60]
  wire [30:0] _T_50 = $signed(_GEN_20) + 31'sh6400000; // @[CORDIC.scala 102:99]
  wire [30:0] _T_51 = _T_30 ? $signed(_T_47) : $signed(_T_50); // @[CORDIC.scala 102:24]
  wire [27:0] _T_53 = regsX_1[29:2]; // @[CORDIC.scala 90:30]
  wire [28:0] _T_54 = {$signed(_T_53), 1'h0}; // @[CORDIC.scala 90:35]
  wire [27:0] _T_56 = regsY_1[29:2]; // @[CORDIC.scala 92:30]
  wire [28:0] _T_57 = {$signed(_T_56), 1'h0}; // @[CORDIC.scala 92:35]
  wire  _T_59 = $signed(regsPhase_1) > 30'sh0; // @[CORDIC.scala 96:44]
  wire [9:0] _T_55 = _T_57[28:19]; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [28:0] _GEN_22 = {$signed(_T_55), 19'h0}; // @[CORDIC.scala 100:52]
  wire [29:0] _GEN_23 = {{1{_GEN_22[28]}},_GEN_22}; // @[CORDIC.scala 100:52]
  wire [29:0] _T_62 = $signed(regsX_1) - $signed(_GEN_23); // @[CORDIC.scala 100:52]
  wire [29:0] _T_65 = $signed(regsX_1) + $signed(_GEN_23); // @[CORDIC.scala 100:77]
  wire [9:0] _T_52 = _T_54[28:19]; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [28:0] _GEN_26 = {$signed(_T_52), 19'h0}; // @[CORDIC.scala 101:52]
  wire [29:0] _GEN_27 = {{1{_GEN_26[28]}},_GEN_26}; // @[CORDIC.scala 101:52]
  wire [29:0] _T_69 = $signed(regsY_1) + $signed(_GEN_27); // @[CORDIC.scala 101:52]
  wire [29:0] _T_72 = $signed(regsY_1) - $signed(_GEN_27); // @[CORDIC.scala 101:77]
  wire [30:0] _GEN_30 = {{1{regsPhase_1[29]}},regsPhase_1}; // @[CORDIC.scala 102:60]
  wire [30:0] _T_76 = $signed(_GEN_30) - 31'sh3c00000; // @[CORDIC.scala 102:60]
  wire [30:0] _T_79 = $signed(_GEN_30) + 31'sh3c00000; // @[CORDIC.scala 102:99]
  wire [30:0] _T_80 = _T_59 ? $signed(_T_76) : $signed(_T_79); // @[CORDIC.scala 102:24]
  wire [26:0] _T_82 = regsX_2[29:3]; // @[CORDIC.scala 90:30]
  wire [27:0] _T_83 = {$signed(_T_82), 1'h0}; // @[CORDIC.scala 90:35]
  wire [26:0] _T_85 = regsY_2[29:3]; // @[CORDIC.scala 92:30]
  wire [27:0] _T_86 = {$signed(_T_85), 1'h0}; // @[CORDIC.scala 92:35]
  wire  _T_88 = $signed(regsPhase_2) > 30'sh0; // @[CORDIC.scala 96:44]
  wire [8:0] _GEN_32 = _T_86[27:19]; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [9:0] _T_84 = {{1{_GEN_32[8]}},_GEN_32}; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [28:0] _GEN_33 = {$signed(_T_84), 19'h0}; // @[CORDIC.scala 100:52]
  wire [29:0] _GEN_34 = {{1{_GEN_33[28]}},_GEN_33}; // @[CORDIC.scala 100:52]
  wire [29:0] _T_91 = $signed(regsX_2) - $signed(_GEN_34); // @[CORDIC.scala 100:52]
  wire [29:0] _T_94 = $signed(regsX_2) + $signed(_GEN_34); // @[CORDIC.scala 100:77]
  wire [8:0] _GEN_37 = _T_83[27:19]; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [9:0] _T_81 = {{1{_GEN_37[8]}},_GEN_37}; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [28:0] _GEN_38 = {$signed(_T_81), 19'h0}; // @[CORDIC.scala 101:52]
  wire [29:0] _GEN_39 = {{1{_GEN_38[28]}},_GEN_38}; // @[CORDIC.scala 101:52]
  wire [29:0] _T_98 = $signed(regsY_2) + $signed(_GEN_39); // @[CORDIC.scala 101:52]
  wire [29:0] _T_101 = $signed(regsY_2) - $signed(_GEN_39); // @[CORDIC.scala 101:77]
  wire [30:0] _GEN_42 = {{1{regsPhase_2[29]}},regsPhase_2}; // @[CORDIC.scala 102:60]
  wire [30:0] _T_105 = $signed(_GEN_42) - 31'sh2000000; // @[CORDIC.scala 102:60]
  wire [30:0] _T_108 = $signed(_GEN_42) + 31'sh2000000; // @[CORDIC.scala 102:99]
  wire [30:0] _T_109 = _T_88 ? $signed(_T_105) : $signed(_T_108); // @[CORDIC.scala 102:24]
  wire [25:0] _T_111 = regsX_3[29:4]; // @[CORDIC.scala 90:30]
  wire [26:0] _T_112 = {$signed(_T_111), 1'h0}; // @[CORDIC.scala 90:35]
  wire [25:0] _T_114 = regsY_3[29:4]; // @[CORDIC.scala 92:30]
  wire [26:0] _T_115 = {$signed(_T_114), 1'h0}; // @[CORDIC.scala 92:35]
  wire  _T_117 = $signed(regsPhase_3) > 30'sh0; // @[CORDIC.scala 96:44]
  wire [7:0] _GEN_44 = _T_115[26:19]; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [9:0] _T_113 = {{2{_GEN_44[7]}},_GEN_44}; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [28:0] _GEN_45 = {$signed(_T_113), 19'h0}; // @[CORDIC.scala 100:52]
  wire [29:0] _GEN_46 = {{1{_GEN_45[28]}},_GEN_45}; // @[CORDIC.scala 100:52]
  wire [29:0] _T_120 = $signed(regsX_3) - $signed(_GEN_46); // @[CORDIC.scala 100:52]
  wire [29:0] _T_123 = $signed(regsX_3) + $signed(_GEN_46); // @[CORDIC.scala 100:77]
  wire [7:0] _GEN_49 = _T_112[26:19]; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [9:0] _T_110 = {{2{_GEN_49[7]}},_GEN_49}; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [28:0] _GEN_50 = {$signed(_T_110), 19'h0}; // @[CORDIC.scala 101:52]
  wire [29:0] _GEN_51 = {{1{_GEN_50[28]}},_GEN_50}; // @[CORDIC.scala 101:52]
  wire [29:0] _T_127 = $signed(regsY_3) + $signed(_GEN_51); // @[CORDIC.scala 101:52]
  wire [29:0] _T_130 = $signed(regsY_3) - $signed(_GEN_51); // @[CORDIC.scala 101:77]
  wire [30:0] _GEN_54 = {{1{regsPhase_3[29]}},regsPhase_3}; // @[CORDIC.scala 102:60]
  wire [30:0] _T_134 = $signed(_GEN_54) - 31'sh1000000; // @[CORDIC.scala 102:60]
  wire [30:0] _T_137 = $signed(_GEN_54) + 31'sh1000000; // @[CORDIC.scala 102:99]
  wire [30:0] _T_138 = _T_117 ? $signed(_T_134) : $signed(_T_137); // @[CORDIC.scala 102:24]
  wire [24:0] _T_140 = regsX_4[29:5]; // @[CORDIC.scala 90:30]
  wire [25:0] _T_141 = {$signed(_T_140), 1'h0}; // @[CORDIC.scala 90:35]
  wire [24:0] _T_143 = regsY_4[29:5]; // @[CORDIC.scala 92:30]
  wire [25:0] _T_144 = {$signed(_T_143), 1'h0}; // @[CORDIC.scala 92:35]
  wire  _T_146 = $signed(regsPhase_4) > 30'sh0; // @[CORDIC.scala 96:44]
  wire [6:0] _GEN_56 = _T_144[25:19]; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [9:0] _T_142 = {{3{_GEN_56[6]}},_GEN_56}; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [28:0] _GEN_57 = {$signed(_T_142), 19'h0}; // @[CORDIC.scala 100:52]
  wire [29:0] _GEN_58 = {{1{_GEN_57[28]}},_GEN_57}; // @[CORDIC.scala 100:52]
  wire [29:0] _T_149 = $signed(regsX_4) - $signed(_GEN_58); // @[CORDIC.scala 100:52]
  wire [29:0] _T_152 = $signed(regsX_4) + $signed(_GEN_58); // @[CORDIC.scala 100:77]
  wire [6:0] _GEN_61 = _T_141[25:19]; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [9:0] _T_139 = {{3{_GEN_61[6]}},_GEN_61}; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [28:0] _GEN_62 = {$signed(_T_139), 19'h0}; // @[CORDIC.scala 101:52]
  wire [29:0] _GEN_63 = {{1{_GEN_62[28]}},_GEN_62}; // @[CORDIC.scala 101:52]
  wire [29:0] _T_156 = $signed(regsY_4) + $signed(_GEN_63); // @[CORDIC.scala 101:52]
  wire [29:0] _T_159 = $signed(regsY_4) - $signed(_GEN_63); // @[CORDIC.scala 101:77]
  wire [30:0] _GEN_66 = {{1{regsPhase_4[29]}},regsPhase_4}; // @[CORDIC.scala 102:60]
  wire [30:0] _T_163 = $signed(_GEN_66) - 31'sh800000; // @[CORDIC.scala 102:60]
  wire [30:0] _T_166 = $signed(_GEN_66) + 31'sh800000; // @[CORDIC.scala 102:99]
  wire [30:0] _T_167 = _T_146 ? $signed(_T_163) : $signed(_T_166); // @[CORDIC.scala 102:24]
  wire [23:0] _T_169 = regsX_5[29:6]; // @[CORDIC.scala 90:30]
  wire [24:0] _T_170 = {$signed(_T_169), 1'h0}; // @[CORDIC.scala 90:35]
  wire [23:0] _T_172 = regsY_5[29:6]; // @[CORDIC.scala 92:30]
  wire [24:0] _T_173 = {$signed(_T_172), 1'h0}; // @[CORDIC.scala 92:35]
  wire  _T_175 = $signed(regsPhase_5) > 30'sh0; // @[CORDIC.scala 96:44]
  wire [5:0] _GEN_68 = _T_173[24:19]; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [9:0] _T_171 = {{4{_GEN_68[5]}},_GEN_68}; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [28:0] _GEN_69 = {$signed(_T_171), 19'h0}; // @[CORDIC.scala 100:52]
  wire [29:0] _GEN_70 = {{1{_GEN_69[28]}},_GEN_69}; // @[CORDIC.scala 100:52]
  wire [29:0] _T_178 = $signed(regsX_5) - $signed(_GEN_70); // @[CORDIC.scala 100:52]
  wire [29:0] _T_181 = $signed(regsX_5) + $signed(_GEN_70); // @[CORDIC.scala 100:77]
  wire [5:0] _GEN_73 = _T_170[24:19]; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [9:0] _T_168 = {{4{_GEN_73[5]}},_GEN_73}; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [28:0] _GEN_74 = {$signed(_T_168), 19'h0}; // @[CORDIC.scala 101:52]
  wire [29:0] _GEN_75 = {{1{_GEN_74[28]}},_GEN_74}; // @[CORDIC.scala 101:52]
  wire [29:0] _T_185 = $signed(regsY_5) + $signed(_GEN_75); // @[CORDIC.scala 101:52]
  wire [29:0] _T_188 = $signed(regsY_5) - $signed(_GEN_75); // @[CORDIC.scala 101:77]
  wire [30:0] _GEN_78 = {{1{regsPhase_5[29]}},regsPhase_5}; // @[CORDIC.scala 102:60]
  wire [30:0] _T_192 = $signed(_GEN_78) - 31'sh400000; // @[CORDIC.scala 102:60]
  wire [30:0] _T_195 = $signed(_GEN_78) + 31'sh400000; // @[CORDIC.scala 102:99]
  wire [30:0] _T_196 = _T_175 ? $signed(_T_192) : $signed(_T_195); // @[CORDIC.scala 102:24]
  wire [22:0] _T_198 = regsX_6[29:7]; // @[CORDIC.scala 90:30]
  wire [23:0] _T_199 = {$signed(_T_198), 1'h0}; // @[CORDIC.scala 90:35]
  wire [22:0] _T_201 = regsY_6[29:7]; // @[CORDIC.scala 92:30]
  wire [23:0] _T_202 = {$signed(_T_201), 1'h0}; // @[CORDIC.scala 92:35]
  wire  _T_204 = $signed(regsPhase_6) > 30'sh0; // @[CORDIC.scala 96:44]
  wire [4:0] _GEN_80 = _T_202[23:19]; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [9:0] _T_200 = {{5{_GEN_80[4]}},_GEN_80}; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [28:0] _GEN_81 = {$signed(_T_200), 19'h0}; // @[CORDIC.scala 100:52]
  wire [29:0] _GEN_82 = {{1{_GEN_81[28]}},_GEN_81}; // @[CORDIC.scala 100:52]
  wire [29:0] _T_207 = $signed(regsX_6) - $signed(_GEN_82); // @[CORDIC.scala 100:52]
  wire [29:0] _T_210 = $signed(regsX_6) + $signed(_GEN_82); // @[CORDIC.scala 100:77]
  wire [4:0] _GEN_85 = _T_199[23:19]; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [9:0] _T_197 = {{5{_GEN_85[4]}},_GEN_85}; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [28:0] _GEN_86 = {$signed(_T_197), 19'h0}; // @[CORDIC.scala 101:52]
  wire [29:0] _GEN_87 = {{1{_GEN_86[28]}},_GEN_86}; // @[CORDIC.scala 101:52]
  wire [29:0] _T_214 = $signed(regsY_6) + $signed(_GEN_87); // @[CORDIC.scala 101:52]
  wire [29:0] _T_217 = $signed(regsY_6) - $signed(_GEN_87); // @[CORDIC.scala 101:77]
  wire [30:0] _GEN_90 = {{1{regsPhase_6[29]}},regsPhase_6}; // @[CORDIC.scala 102:60]
  wire [30:0] _T_221 = $signed(_GEN_90) - 31'sh200000; // @[CORDIC.scala 102:60]
  wire [30:0] _T_224 = $signed(_GEN_90) + 31'sh200000; // @[CORDIC.scala 102:99]
  wire [30:0] _T_225 = _T_204 ? $signed(_T_221) : $signed(_T_224); // @[CORDIC.scala 102:24]
  wire [21:0] _T_227 = regsX_7[29:8]; // @[CORDIC.scala 90:30]
  wire [22:0] _T_228 = {$signed(_T_227), 1'h0}; // @[CORDIC.scala 90:35]
  wire [21:0] _T_230 = regsY_7[29:8]; // @[CORDIC.scala 92:30]
  wire [22:0] _T_231 = {$signed(_T_230), 1'h0}; // @[CORDIC.scala 92:35]
  wire  _T_233 = $signed(regsPhase_7) > 30'sh0; // @[CORDIC.scala 96:44]
  wire [3:0] _GEN_92 = _T_231[22:19]; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [9:0] _T_229 = {{6{_GEN_92[3]}},_GEN_92}; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [28:0] _GEN_93 = {$signed(_T_229), 19'h0}; // @[CORDIC.scala 100:52]
  wire [29:0] _GEN_94 = {{1{_GEN_93[28]}},_GEN_93}; // @[CORDIC.scala 100:52]
  wire [29:0] _T_236 = $signed(regsX_7) - $signed(_GEN_94); // @[CORDIC.scala 100:52]
  wire [29:0] _T_239 = $signed(regsX_7) + $signed(_GEN_94); // @[CORDIC.scala 100:77]
  wire [3:0] _GEN_97 = _T_228[22:19]; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [9:0] _T_226 = {{6{_GEN_97[3]}},_GEN_97}; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [28:0] _GEN_98 = {$signed(_T_226), 19'h0}; // @[CORDIC.scala 101:52]
  wire [29:0] _GEN_99 = {{1{_GEN_98[28]}},_GEN_98}; // @[CORDIC.scala 101:52]
  wire [29:0] _T_243 = $signed(regsY_7) + $signed(_GEN_99); // @[CORDIC.scala 101:52]
  wire [29:0] _T_246 = $signed(regsY_7) - $signed(_GEN_99); // @[CORDIC.scala 101:77]
  wire [30:0] _GEN_102 = {{1{regsPhase_7[29]}},regsPhase_7}; // @[CORDIC.scala 102:60]
  wire [30:0] _T_250 = $signed(_GEN_102) - 31'sh0; // @[CORDIC.scala 102:60]
  wire [31:0] _T_251 = {{2{regsPhase_7[29]}},regsPhase_7}; // @[CORDIC.scala 102:99]
  wire [30:0] _T_253 = _T_251[30:0]; // @[CORDIC.scala 102:99]
  wire [30:0] _T_254 = _T_233 ? $signed(_T_250) : $signed(_T_253); // @[CORDIC.scala 102:24]
  wire [20:0] _T_256 = regsX_8[29:9]; // @[CORDIC.scala 90:30]
  wire [21:0] _T_257 = {$signed(_T_256), 1'h0}; // @[CORDIC.scala 90:35]
  wire [20:0] _T_259 = regsY_8[29:9]; // @[CORDIC.scala 92:30]
  wire [21:0] _T_260 = {$signed(_T_259), 1'h0}; // @[CORDIC.scala 92:35]
  wire  _T_262 = $signed(regsPhase_8) > 30'sh0; // @[CORDIC.scala 96:44]
  wire [2:0] _GEN_103 = _T_260[21:19]; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [9:0] _T_258 = {{7{_GEN_103[2]}},_GEN_103}; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [28:0] _GEN_104 = {$signed(_T_258), 19'h0}; // @[CORDIC.scala 100:52]
  wire [29:0] _GEN_105 = {{1{_GEN_104[28]}},_GEN_104}; // @[CORDIC.scala 100:52]
  wire [29:0] _T_265 = $signed(regsX_8) - $signed(_GEN_105); // @[CORDIC.scala 100:52]
  wire [29:0] _T_268 = $signed(regsX_8) + $signed(_GEN_105); // @[CORDIC.scala 100:77]
  wire [2:0] _GEN_108 = _T_257[21:19]; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [9:0] _T_255 = {{7{_GEN_108[2]}},_GEN_108}; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [28:0] _GEN_109 = {$signed(_T_255), 19'h0}; // @[CORDIC.scala 101:52]
  wire [29:0] _GEN_110 = {{1{_GEN_109[28]}},_GEN_109}; // @[CORDIC.scala 101:52]
  wire [29:0] _T_272 = $signed(regsY_8) + $signed(_GEN_110); // @[CORDIC.scala 101:52]
  wire [29:0] _T_275 = $signed(regsY_8) - $signed(_GEN_110); // @[CORDIC.scala 101:77]
  wire [30:0] _GEN_113 = {{1{regsPhase_8[29]}},regsPhase_8}; // @[CORDIC.scala 102:60]
  wire [30:0] _T_279 = $signed(_GEN_113) - 31'sh0; // @[CORDIC.scala 102:60]
  wire [31:0] _T_280 = {{2{regsPhase_8[29]}},regsPhase_8}; // @[CORDIC.scala 102:99]
  wire [30:0] _T_282 = _T_280[30:0]; // @[CORDIC.scala 102:99]
  wire [30:0] _T_283 = _T_262 ? $signed(_T_279) : $signed(_T_282); // @[CORDIC.scala 102:24]
  wire [19:0] _T_285 = regsX_9[29:10]; // @[CORDIC.scala 90:30]
  wire [20:0] _T_286 = {$signed(_T_285), 1'h0}; // @[CORDIC.scala 90:35]
  wire [19:0] _T_288 = regsY_9[29:10]; // @[CORDIC.scala 92:30]
  wire [20:0] _T_289 = {$signed(_T_288), 1'h0}; // @[CORDIC.scala 92:35]
  wire  _T_291 = $signed(regsPhase_9) > 30'sh0; // @[CORDIC.scala 96:44]
  wire [1:0] _GEN_114 = _T_289[20:19]; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [9:0] _T_287 = {{8{_GEN_114[1]}},_GEN_114}; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [28:0] _GEN_115 = {$signed(_T_287), 19'h0}; // @[CORDIC.scala 100:52]
  wire [29:0] _GEN_116 = {{1{_GEN_115[28]}},_GEN_115}; // @[CORDIC.scala 100:52]
  wire [29:0] _T_294 = $signed(regsX_9) - $signed(_GEN_116); // @[CORDIC.scala 100:52]
  wire [29:0] _T_297 = $signed(regsX_9) + $signed(_GEN_116); // @[CORDIC.scala 100:77]
  wire [1:0] _GEN_119 = _T_286[20:19]; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [9:0] _T_284 = {{8{_GEN_119[1]}},_GEN_119}; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [28:0] _GEN_120 = {$signed(_T_284), 19'h0}; // @[CORDIC.scala 101:52]
  wire [29:0] _GEN_121 = {{1{_GEN_120[28]}},_GEN_120}; // @[CORDIC.scala 101:52]
  wire [29:0] _T_301 = $signed(regsY_9) + $signed(_GEN_121); // @[CORDIC.scala 101:52]
  wire [29:0] _T_304 = $signed(regsY_9) - $signed(_GEN_121); // @[CORDIC.scala 101:77]
  wire [30:0] _GEN_124 = {{1{regsPhase_9[29]}},regsPhase_9}; // @[CORDIC.scala 102:60]
  wire [30:0] _T_308 = $signed(_GEN_124) - 31'sh0; // @[CORDIC.scala 102:60]
  wire [31:0] _T_309 = {{2{regsPhase_9[29]}},regsPhase_9}; // @[CORDIC.scala 102:99]
  wire [30:0] _T_311 = _T_309[30:0]; // @[CORDIC.scala 102:99]
  wire [30:0] _T_312 = _T_291 ? $signed(_T_308) : $signed(_T_311); // @[CORDIC.scala 102:24]
  wire [18:0] _T_314 = regsX_10[29:11]; // @[CORDIC.scala 90:30]
  wire [19:0] _T_315 = {$signed(_T_314), 1'h0}; // @[CORDIC.scala 90:35]
  wire [18:0] _T_317 = regsY_10[29:11]; // @[CORDIC.scala 92:30]
  wire [19:0] _T_318 = {$signed(_T_317), 1'h0}; // @[CORDIC.scala 92:35]
  wire  _T_320 = $signed(regsPhase_10) > 30'sh0; // @[CORDIC.scala 96:44]
  wire  _GEN_125 = _T_318[19]; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [9:0] _T_316 = {10{_GEN_125}}; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [28:0] _GEN_126 = {$signed(_T_316), 19'h0}; // @[CORDIC.scala 100:52]
  wire [29:0] _GEN_127 = {{1{_GEN_126[28]}},_GEN_126}; // @[CORDIC.scala 100:52]
  wire [29:0] _T_323 = $signed(regsX_10) - $signed(_GEN_127); // @[CORDIC.scala 100:52]
  wire [29:0] _T_326 = $signed(regsX_10) + $signed(_GEN_127); // @[CORDIC.scala 100:77]
  wire  _GEN_130 = _T_315[19]; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [9:0] _T_313 = {10{_GEN_130}}; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [28:0] _GEN_131 = {$signed(_T_313), 19'h0}; // @[CORDIC.scala 101:52]
  wire [29:0] _GEN_132 = {{1{_GEN_131[28]}},_GEN_131}; // @[CORDIC.scala 101:52]
  wire [29:0] _T_330 = $signed(regsY_10) + $signed(_GEN_132); // @[CORDIC.scala 101:52]
  wire [29:0] _T_333 = $signed(regsY_10) - $signed(_GEN_132); // @[CORDIC.scala 101:77]
  wire [30:0] _GEN_135 = {{1{regsPhase_10[29]}},regsPhase_10}; // @[CORDIC.scala 102:60]
  wire [30:0] _T_337 = $signed(_GEN_135) - 31'sh0; // @[CORDIC.scala 102:60]
  wire [31:0] _T_338 = {{2{regsPhase_10[29]}},regsPhase_10}; // @[CORDIC.scala 102:99]
  wire [30:0] _T_340 = _T_338[30:0]; // @[CORDIC.scala 102:99]
  wire [30:0] _T_341 = _T_320 ? $signed(_T_337) : $signed(_T_340); // @[CORDIC.scala 102:24]
  wire [17:0] _T_343 = regsX_11[29:12]; // @[CORDIC.scala 90:30]
  wire [18:0] _T_344 = {$signed(_T_343), 1'h0}; // @[CORDIC.scala 90:35]
  wire [17:0] _T_346 = regsY_11[29:12]; // @[CORDIC.scala 92:30]
  wire [18:0] _T_347 = {$signed(_T_346), 1'h0}; // @[CORDIC.scala 92:35]
  wire  _T_349 = $signed(regsPhase_11) > 30'sh0; // @[CORDIC.scala 96:44]
  wire  _GEN_137 = _T_347[18]; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [9:0] _T_345 = {10{_GEN_137}}; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [28:0] _GEN_138 = {$signed(_T_345), 19'h0}; // @[CORDIC.scala 100:52]
  wire [29:0] _GEN_139 = {{1{_GEN_138[28]}},_GEN_138}; // @[CORDIC.scala 100:52]
  wire [29:0] _T_352 = $signed(regsX_11) - $signed(_GEN_139); // @[CORDIC.scala 100:52]
  wire [29:0] _T_355 = $signed(regsX_11) + $signed(_GEN_139); // @[CORDIC.scala 100:77]
  wire  _GEN_143 = _T_344[18]; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [9:0] _T_342 = {10{_GEN_143}}; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [28:0] _GEN_144 = {$signed(_T_342), 19'h0}; // @[CORDIC.scala 101:52]
  wire [29:0] _GEN_145 = {{1{_GEN_144[28]}},_GEN_144}; // @[CORDIC.scala 101:52]
  wire [29:0] _T_359 = $signed(regsY_11) + $signed(_GEN_145); // @[CORDIC.scala 101:52]
  wire [29:0] _T_362 = $signed(regsY_11) - $signed(_GEN_145); // @[CORDIC.scala 101:77]
  wire [30:0] _GEN_148 = {{1{regsPhase_11[29]}},regsPhase_11}; // @[CORDIC.scala 102:60]
  wire [30:0] _T_366 = $signed(_GEN_148) - 31'sh0; // @[CORDIC.scala 102:60]
  wire [31:0] _T_367 = {{2{regsPhase_11[29]}},regsPhase_11}; // @[CORDIC.scala 102:99]
  wire [30:0] _T_369 = _T_367[30:0]; // @[CORDIC.scala 102:99]
  wire [30:0] _T_370 = _T_349 ? $signed(_T_366) : $signed(_T_369); // @[CORDIC.scala 102:24]
  wire [16:0] _T_372 = regsX_12[29:13]; // @[CORDIC.scala 90:30]
  wire [17:0] _T_373 = {$signed(_T_372), 1'h0}; // @[CORDIC.scala 90:35]
  wire [16:0] _T_375 = regsY_12[29:13]; // @[CORDIC.scala 92:30]
  wire [17:0] _T_376 = {$signed(_T_375), 1'h0}; // @[CORDIC.scala 92:35]
  wire  _T_378 = $signed(regsPhase_12) > 30'sh0; // @[CORDIC.scala 96:44]
  wire  _GEN_150 = _T_376[17]; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [9:0] _T_374 = {10{_GEN_150}}; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [28:0] _GEN_151 = {$signed(_T_374), 19'h0}; // @[CORDIC.scala 100:52]
  wire [29:0] _GEN_152 = {{1{_GEN_151[28]}},_GEN_151}; // @[CORDIC.scala 100:52]
  wire [29:0] _T_381 = $signed(regsX_12) - $signed(_GEN_152); // @[CORDIC.scala 100:52]
  wire [29:0] _T_384 = $signed(regsX_12) + $signed(_GEN_152); // @[CORDIC.scala 100:77]
  wire  _GEN_156 = _T_373[17]; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [9:0] _T_371 = {10{_GEN_156}}; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [28:0] _GEN_157 = {$signed(_T_371), 19'h0}; // @[CORDIC.scala 101:52]
  wire [29:0] _GEN_158 = {{1{_GEN_157[28]}},_GEN_157}; // @[CORDIC.scala 101:52]
  wire [29:0] _T_388 = $signed(regsY_12) + $signed(_GEN_158); // @[CORDIC.scala 101:52]
  wire [29:0] _T_391 = $signed(regsY_12) - $signed(_GEN_158); // @[CORDIC.scala 101:77]
  wire [30:0] _GEN_161 = {{1{regsPhase_12[29]}},regsPhase_12}; // @[CORDIC.scala 102:60]
  wire [30:0] _T_395 = $signed(_GEN_161) - 31'sh0; // @[CORDIC.scala 102:60]
  wire [31:0] _T_396 = {{2{regsPhase_12[29]}},regsPhase_12}; // @[CORDIC.scala 102:99]
  wire [30:0] _T_398 = _T_396[30:0]; // @[CORDIC.scala 102:99]
  wire [30:0] _T_399 = _T_378 ? $signed(_T_395) : $signed(_T_398); // @[CORDIC.scala 102:24]
  wire [15:0] _T_401 = regsX_13[29:14]; // @[CORDIC.scala 90:30]
  wire [16:0] _T_402 = {$signed(_T_401), 1'h0}; // @[CORDIC.scala 90:35]
  wire [15:0] _T_404 = regsY_13[29:14]; // @[CORDIC.scala 92:30]
  wire [16:0] _T_405 = {$signed(_T_404), 1'h0}; // @[CORDIC.scala 92:35]
  wire  _T_407 = $signed(regsPhase_13) > 30'sh0; // @[CORDIC.scala 96:44]
  wire  _GEN_163 = _T_405[16]; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [9:0] _T_403 = {10{_GEN_163}}; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [28:0] _GEN_164 = {$signed(_T_403), 19'h0}; // @[CORDIC.scala 100:52]
  wire [29:0] _GEN_165 = {{1{_GEN_164[28]}},_GEN_164}; // @[CORDIC.scala 100:52]
  wire [29:0] _T_410 = $signed(regsX_13) - $signed(_GEN_165); // @[CORDIC.scala 100:52]
  wire [29:0] _T_413 = $signed(regsX_13) + $signed(_GEN_165); // @[CORDIC.scala 100:77]
  wire  _GEN_169 = _T_402[16]; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [9:0] _T_400 = {10{_GEN_169}}; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [28:0] _GEN_170 = {$signed(_T_400), 19'h0}; // @[CORDIC.scala 101:52]
  wire [29:0] _GEN_171 = {{1{_GEN_170[28]}},_GEN_170}; // @[CORDIC.scala 101:52]
  wire [29:0] _T_417 = $signed(regsY_13) + $signed(_GEN_171); // @[CORDIC.scala 101:52]
  wire [29:0] _T_420 = $signed(regsY_13) - $signed(_GEN_171); // @[CORDIC.scala 101:77]
  wire [30:0] _GEN_174 = {{1{regsPhase_13[29]}},regsPhase_13}; // @[CORDIC.scala 102:60]
  wire [30:0] _T_424 = $signed(_GEN_174) - 31'sh0; // @[CORDIC.scala 102:60]
  wire [31:0] _T_425 = {{2{regsPhase_13[29]}},regsPhase_13}; // @[CORDIC.scala 102:99]
  wire [30:0] _T_427 = _T_425[30:0]; // @[CORDIC.scala 102:99]
  wire [30:0] _T_428 = _T_407 ? $signed(_T_424) : $signed(_T_427); // @[CORDIC.scala 102:24]
  wire [14:0] _T_430 = regsX_14[29:15]; // @[CORDIC.scala 90:30]
  wire [15:0] _T_431 = {$signed(_T_430), 1'h0}; // @[CORDIC.scala 90:35]
  wire [14:0] _T_433 = regsY_14[29:15]; // @[CORDIC.scala 92:30]
  wire [15:0] _T_434 = {$signed(_T_433), 1'h0}; // @[CORDIC.scala 92:35]
  wire  _T_436 = $signed(regsPhase_14) > 30'sh0; // @[CORDIC.scala 96:44]
  wire  _GEN_176 = _T_434[15]; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [9:0] _T_432 = {10{_GEN_176}}; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [28:0] _GEN_177 = {$signed(_T_432), 19'h0}; // @[CORDIC.scala 100:52]
  wire [29:0] _GEN_178 = {{1{_GEN_177[28]}},_GEN_177}; // @[CORDIC.scala 100:52]
  wire [29:0] _T_439 = $signed(regsX_14) - $signed(_GEN_178); // @[CORDIC.scala 100:52]
  wire [29:0] _T_442 = $signed(regsX_14) + $signed(_GEN_178); // @[CORDIC.scala 100:77]
  wire  _GEN_182 = _T_431[15]; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [9:0] _T_429 = {10{_GEN_182}}; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [28:0] _GEN_183 = {$signed(_T_429), 19'h0}; // @[CORDIC.scala 101:52]
  wire [29:0] _GEN_184 = {{1{_GEN_183[28]}},_GEN_183}; // @[CORDIC.scala 101:52]
  wire [29:0] _T_446 = $signed(regsY_14) + $signed(_GEN_184); // @[CORDIC.scala 101:52]
  wire [29:0] _T_449 = $signed(regsY_14) - $signed(_GEN_184); // @[CORDIC.scala 101:77]
  wire [30:0] _GEN_187 = {{1{regsPhase_14[29]}},regsPhase_14}; // @[CORDIC.scala 102:60]
  wire [30:0] _T_453 = $signed(_GEN_187) - 31'sh0; // @[CORDIC.scala 102:60]
  wire [31:0] _T_454 = {{2{regsPhase_14[29]}},regsPhase_14}; // @[CORDIC.scala 102:99]
  wire [30:0] _T_456 = _T_454[30:0]; // @[CORDIC.scala 102:99]
  wire [30:0] _T_457 = _T_436 ? $signed(_T_453) : $signed(_T_456); // @[CORDIC.scala 102:24]
  wire [13:0] _T_459 = regsX_15[29:16]; // @[CORDIC.scala 90:30]
  wire [14:0] _T_460 = {$signed(_T_459), 1'h0}; // @[CORDIC.scala 90:35]
  wire [13:0] _T_462 = regsY_15[29:16]; // @[CORDIC.scala 92:30]
  wire [14:0] _T_463 = {$signed(_T_462), 1'h0}; // @[CORDIC.scala 92:35]
  wire  _T_465 = $signed(regsPhase_15) > 30'sh0; // @[CORDIC.scala 96:44]
  wire  _GEN_189 = _T_463[14]; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [9:0] _T_461 = {10{_GEN_189}}; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [28:0] _GEN_190 = {$signed(_T_461), 19'h0}; // @[CORDIC.scala 100:52]
  wire [29:0] _GEN_191 = {{1{_GEN_190[28]}},_GEN_190}; // @[CORDIC.scala 100:52]
  wire [29:0] _T_468 = $signed(regsX_15) - $signed(_GEN_191); // @[CORDIC.scala 100:52]
  wire [29:0] _T_471 = $signed(regsX_15) + $signed(_GEN_191); // @[CORDIC.scala 100:77]
  wire  _GEN_195 = _T_460[14]; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [9:0] _T_458 = {10{_GEN_195}}; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [28:0] _GEN_196 = {$signed(_T_458), 19'h0}; // @[CORDIC.scala 101:52]
  wire [29:0] _GEN_197 = {{1{_GEN_196[28]}},_GEN_196}; // @[CORDIC.scala 101:52]
  wire [29:0] _T_475 = $signed(regsY_15) + $signed(_GEN_197); // @[CORDIC.scala 101:52]
  wire [29:0] _T_478 = $signed(regsY_15) - $signed(_GEN_197); // @[CORDIC.scala 101:77]
  wire [30:0] _GEN_200 = {{1{regsPhase_15[29]}},regsPhase_15}; // @[CORDIC.scala 102:60]
  wire [30:0] _T_482 = $signed(_GEN_200) - 31'sh0; // @[CORDIC.scala 102:60]
  wire [31:0] _T_483 = {{2{regsPhase_15[29]}},regsPhase_15}; // @[CORDIC.scala 102:99]
  wire [30:0] _T_485 = _T_483[30:0]; // @[CORDIC.scala 102:99]
  wire [30:0] _T_486 = _T_465 ? $signed(_T_482) : $signed(_T_485); // @[CORDIC.scala 102:24]
  wire [12:0] _T_488 = regsX_16[29:17]; // @[CORDIC.scala 90:30]
  wire [13:0] _T_489 = {$signed(_T_488), 1'h0}; // @[CORDIC.scala 90:35]
  wire [12:0] _T_491 = regsY_16[29:17]; // @[CORDIC.scala 92:30]
  wire [13:0] _T_492 = {$signed(_T_491), 1'h0}; // @[CORDIC.scala 92:35]
  wire  _T_494 = $signed(regsPhase_16) > 30'sh0; // @[CORDIC.scala 96:44]
  wire  _GEN_202 = _T_492[13]; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [9:0] _T_490 = {10{_GEN_202}}; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [28:0] _GEN_203 = {$signed(_T_490), 19'h0}; // @[CORDIC.scala 100:52]
  wire [29:0] _GEN_204 = {{1{_GEN_203[28]}},_GEN_203}; // @[CORDIC.scala 100:52]
  wire [29:0] _T_497 = $signed(regsX_16) - $signed(_GEN_204); // @[CORDIC.scala 100:52]
  wire [29:0] _T_500 = $signed(regsX_16) + $signed(_GEN_204); // @[CORDIC.scala 100:77]
  wire  _GEN_208 = _T_489[13]; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [9:0] _T_487 = {10{_GEN_208}}; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [28:0] _GEN_209 = {$signed(_T_487), 19'h0}; // @[CORDIC.scala 101:52]
  wire [29:0] _GEN_210 = {{1{_GEN_209[28]}},_GEN_209}; // @[CORDIC.scala 101:52]
  wire [29:0] _T_504 = $signed(regsY_16) + $signed(_GEN_210); // @[CORDIC.scala 101:52]
  wire [29:0] _T_507 = $signed(regsY_16) - $signed(_GEN_210); // @[CORDIC.scala 101:77]
  wire [30:0] _GEN_213 = {{1{regsPhase_16[29]}},regsPhase_16}; // @[CORDIC.scala 102:60]
  wire [30:0] _T_511 = $signed(_GEN_213) - 31'sh0; // @[CORDIC.scala 102:60]
  wire [31:0] _T_512 = {{2{regsPhase_16[29]}},regsPhase_16}; // @[CORDIC.scala 102:99]
  wire [30:0] _T_514 = _T_512[30:0]; // @[CORDIC.scala 102:99]
  wire [30:0] _T_515 = _T_494 ? $signed(_T_511) : $signed(_T_514); // @[CORDIC.scala 102:24]
  wire [11:0] _T_517 = regsX_17[29:18]; // @[CORDIC.scala 90:30]
  wire [12:0] _T_518 = {$signed(_T_517), 1'h0}; // @[CORDIC.scala 90:35]
  wire [11:0] _T_520 = regsY_17[29:18]; // @[CORDIC.scala 92:30]
  wire [12:0] _T_521 = {$signed(_T_520), 1'h0}; // @[CORDIC.scala 92:35]
  wire  _T_523 = $signed(regsPhase_17) > 30'sh0; // @[CORDIC.scala 96:44]
  wire  _GEN_215 = _T_521[12]; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [9:0] _T_519 = {10{_GEN_215}}; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [28:0] _GEN_216 = {$signed(_T_519), 19'h0}; // @[CORDIC.scala 100:52]
  wire [29:0] _GEN_217 = {{1{_GEN_216[28]}},_GEN_216}; // @[CORDIC.scala 100:52]
  wire [29:0] _T_526 = $signed(regsX_17) - $signed(_GEN_217); // @[CORDIC.scala 100:52]
  wire [29:0] _T_529 = $signed(regsX_17) + $signed(_GEN_217); // @[CORDIC.scala 100:77]
  wire  _GEN_221 = _T_518[12]; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [9:0] _T_516 = {10{_GEN_221}}; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [28:0] _GEN_222 = {$signed(_T_516), 19'h0}; // @[CORDIC.scala 101:52]
  wire [29:0] _GEN_223 = {{1{_GEN_222[28]}},_GEN_222}; // @[CORDIC.scala 101:52]
  wire [29:0] _T_533 = $signed(regsY_17) + $signed(_GEN_223); // @[CORDIC.scala 101:52]
  wire [29:0] _T_536 = $signed(regsY_17) - $signed(_GEN_223); // @[CORDIC.scala 101:77]
  wire [30:0] _GEN_226 = {{1{regsPhase_17[29]}},regsPhase_17}; // @[CORDIC.scala 102:60]
  wire [30:0] _T_540 = $signed(_GEN_226) - 31'sh0; // @[CORDIC.scala 102:60]
  wire [31:0] _T_541 = {{2{regsPhase_17[29]}},regsPhase_17}; // @[CORDIC.scala 102:99]
  wire [30:0] _T_543 = _T_541[30:0]; // @[CORDIC.scala 102:99]
  wire [30:0] _T_544 = _T_523 ? $signed(_T_540) : $signed(_T_543); // @[CORDIC.scala 102:24]
  wire [10:0] _T_546 = regsX_18[29:19]; // @[CORDIC.scala 90:30]
  wire [11:0] _T_547 = {$signed(_T_546), 1'h0}; // @[CORDIC.scala 90:35]
  wire [10:0] _T_549 = regsY_18[29:19]; // @[CORDIC.scala 92:30]
  wire [11:0] _T_550 = {$signed(_T_549), 1'h0}; // @[CORDIC.scala 92:35]
  wire  _T_552 = $signed(regsPhase_18) > 30'sh0; // @[CORDIC.scala 96:44]
  wire  _GEN_228 = _T_550[11]; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [9:0] _T_548 = {10{_GEN_228}}; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [28:0] _GEN_229 = {$signed(_T_548), 19'h0}; // @[CORDIC.scala 100:52]
  wire [29:0] _GEN_230 = {{1{_GEN_229[28]}},_GEN_229}; // @[CORDIC.scala 100:52]
  wire [29:0] _T_555 = $signed(regsX_18) - $signed(_GEN_230); // @[CORDIC.scala 100:52]
  wire [29:0] _T_558 = $signed(regsX_18) + $signed(_GEN_230); // @[CORDIC.scala 100:77]
  wire  _GEN_234 = _T_547[11]; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [9:0] _T_545 = {10{_GEN_234}}; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [28:0] _GEN_235 = {$signed(_T_545), 19'h0}; // @[CORDIC.scala 101:52]
  wire [29:0] _GEN_236 = {{1{_GEN_235[28]}},_GEN_235}; // @[CORDIC.scala 101:52]
  wire [29:0] _T_562 = $signed(regsY_18) + $signed(_GEN_236); // @[CORDIC.scala 101:52]
  wire [29:0] _T_565 = $signed(regsY_18) - $signed(_GEN_236); // @[CORDIC.scala 101:77]
  wire [30:0] _GEN_239 = {{1{regsPhase_18[29]}},regsPhase_18}; // @[CORDIC.scala 102:60]
  wire [30:0] _T_569 = $signed(_GEN_239) - 31'sh0; // @[CORDIC.scala 102:60]
  wire [31:0] _T_570 = {{2{regsPhase_18[29]}},regsPhase_18}; // @[CORDIC.scala 102:99]
  wire [30:0] _T_572 = _T_570[30:0]; // @[CORDIC.scala 102:99]
  wire [30:0] _T_573 = _T_552 ? $signed(_T_569) : $signed(_T_572); // @[CORDIC.scala 102:24]
  wire [9:0] _T_575 = regsX_19[29:20]; // @[CORDIC.scala 90:30]
  wire [10:0] _T_576 = {$signed(_T_575), 1'h0}; // @[CORDIC.scala 90:35]
  wire [9:0] _T_578 = regsY_19[29:20]; // @[CORDIC.scala 92:30]
  wire [10:0] _T_579 = {$signed(_T_578), 1'h0}; // @[CORDIC.scala 92:35]
  wire  _T_581 = $signed(regsPhase_19) > 30'sh0; // @[CORDIC.scala 96:44]
  wire  _GEN_241 = _T_579[10]; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [9:0] _T_577 = {10{_GEN_241}}; // @[CORDIC.scala 91:24 CORDIC.scala 92:14]
  wire [28:0] _GEN_242 = {$signed(_T_577), 19'h0}; // @[CORDIC.scala 100:52]
  wire [29:0] _GEN_243 = {{1{_GEN_242[28]}},_GEN_242}; // @[CORDIC.scala 100:52]
  wire [29:0] _T_584 = $signed(regsX_19) - $signed(_GEN_243); // @[CORDIC.scala 100:52]
  wire [29:0] _T_587 = $signed(regsX_19) + $signed(_GEN_243); // @[CORDIC.scala 100:77]
  wire  _GEN_247 = _T_576[10]; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [9:0] _T_574 = {10{_GEN_247}}; // @[CORDIC.scala 89:24 CORDIC.scala 90:14]
  wire [28:0] _GEN_248 = {$signed(_T_574), 19'h0}; // @[CORDIC.scala 101:52]
  wire [29:0] _GEN_249 = {{1{_GEN_248[28]}},_GEN_248}; // @[CORDIC.scala 101:52]
  wire [29:0] _T_591 = $signed(regsY_19) + $signed(_GEN_249); // @[CORDIC.scala 101:52]
  wire [29:0] _T_594 = $signed(regsY_19) - $signed(_GEN_249); // @[CORDIC.scala 101:77]
  wire [59:0] _T_603 = $signed(regsX_20) * 30'sh4dba76d; // @[CORDIC.scala 108:33]
  wire [59:0] _T_604 = $signed(regsY_20) * 30'sh4dba76d; // @[CORDIC.scala 110:33]
  wire [32:0] _GEN_253 = _T_603[59:27]; // @[CORDIC.scala 108:19]
  wire [32:0] _GEN_255 = _T_604[59:27]; // @[CORDIC.scala 110:19]
  assign io_dataOutX = _GEN_253[29:0]; // @[CORDIC.scala 108:19]
  assign io_dataOutY = _GEN_255[29:0]; // @[CORDIC.scala 110:19]
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
  regsX_0 = _RAND_0[29:0];
  _RAND_1 = {1{`RANDOM}};
  regsX_1 = _RAND_1[29:0];
  _RAND_2 = {1{`RANDOM}};
  regsX_2 = _RAND_2[29:0];
  _RAND_3 = {1{`RANDOM}};
  regsX_3 = _RAND_3[29:0];
  _RAND_4 = {1{`RANDOM}};
  regsX_4 = _RAND_4[29:0];
  _RAND_5 = {1{`RANDOM}};
  regsX_5 = _RAND_5[29:0];
  _RAND_6 = {1{`RANDOM}};
  regsX_6 = _RAND_6[29:0];
  _RAND_7 = {1{`RANDOM}};
  regsX_7 = _RAND_7[29:0];
  _RAND_8 = {1{`RANDOM}};
  regsX_8 = _RAND_8[29:0];
  _RAND_9 = {1{`RANDOM}};
  regsX_9 = _RAND_9[29:0];
  _RAND_10 = {1{`RANDOM}};
  regsX_10 = _RAND_10[29:0];
  _RAND_11 = {1{`RANDOM}};
  regsX_11 = _RAND_11[29:0];
  _RAND_12 = {1{`RANDOM}};
  regsX_12 = _RAND_12[29:0];
  _RAND_13 = {1{`RANDOM}};
  regsX_13 = _RAND_13[29:0];
  _RAND_14 = {1{`RANDOM}};
  regsX_14 = _RAND_14[29:0];
  _RAND_15 = {1{`RANDOM}};
  regsX_15 = _RAND_15[29:0];
  _RAND_16 = {1{`RANDOM}};
  regsX_16 = _RAND_16[29:0];
  _RAND_17 = {1{`RANDOM}};
  regsX_17 = _RAND_17[29:0];
  _RAND_18 = {1{`RANDOM}};
  regsX_18 = _RAND_18[29:0];
  _RAND_19 = {1{`RANDOM}};
  regsX_19 = _RAND_19[29:0];
  _RAND_20 = {1{`RANDOM}};
  regsX_20 = _RAND_20[29:0];
  _RAND_21 = {1{`RANDOM}};
  regsY_0 = _RAND_21[29:0];
  _RAND_22 = {1{`RANDOM}};
  regsY_1 = _RAND_22[29:0];
  _RAND_23 = {1{`RANDOM}};
  regsY_2 = _RAND_23[29:0];
  _RAND_24 = {1{`RANDOM}};
  regsY_3 = _RAND_24[29:0];
  _RAND_25 = {1{`RANDOM}};
  regsY_4 = _RAND_25[29:0];
  _RAND_26 = {1{`RANDOM}};
  regsY_5 = _RAND_26[29:0];
  _RAND_27 = {1{`RANDOM}};
  regsY_6 = _RAND_27[29:0];
  _RAND_28 = {1{`RANDOM}};
  regsY_7 = _RAND_28[29:0];
  _RAND_29 = {1{`RANDOM}};
  regsY_8 = _RAND_29[29:0];
  _RAND_30 = {1{`RANDOM}};
  regsY_9 = _RAND_30[29:0];
  _RAND_31 = {1{`RANDOM}};
  regsY_10 = _RAND_31[29:0];
  _RAND_32 = {1{`RANDOM}};
  regsY_11 = _RAND_32[29:0];
  _RAND_33 = {1{`RANDOM}};
  regsY_12 = _RAND_33[29:0];
  _RAND_34 = {1{`RANDOM}};
  regsY_13 = _RAND_34[29:0];
  _RAND_35 = {1{`RANDOM}};
  regsY_14 = _RAND_35[29:0];
  _RAND_36 = {1{`RANDOM}};
  regsY_15 = _RAND_36[29:0];
  _RAND_37 = {1{`RANDOM}};
  regsY_16 = _RAND_37[29:0];
  _RAND_38 = {1{`RANDOM}};
  regsY_17 = _RAND_38[29:0];
  _RAND_39 = {1{`RANDOM}};
  regsY_18 = _RAND_39[29:0];
  _RAND_40 = {1{`RANDOM}};
  regsY_19 = _RAND_40[29:0];
  _RAND_41 = {1{`RANDOM}};
  regsY_20 = _RAND_41[29:0];
  _RAND_42 = {1{`RANDOM}};
  regsPhase_0 = _RAND_42[29:0];
  _RAND_43 = {1{`RANDOM}};
  regsPhase_1 = _RAND_43[29:0];
  _RAND_44 = {1{`RANDOM}};
  regsPhase_2 = _RAND_44[29:0];
  _RAND_45 = {1{`RANDOM}};
  regsPhase_3 = _RAND_45[29:0];
  _RAND_46 = {1{`RANDOM}};
  regsPhase_4 = _RAND_46[29:0];
  _RAND_47 = {1{`RANDOM}};
  regsPhase_5 = _RAND_47[29:0];
  _RAND_48 = {1{`RANDOM}};
  regsPhase_6 = _RAND_48[29:0];
  _RAND_49 = {1{`RANDOM}};
  regsPhase_7 = _RAND_49[29:0];
  _RAND_50 = {1{`RANDOM}};
  regsPhase_8 = _RAND_50[29:0];
  _RAND_51 = {1{`RANDOM}};
  regsPhase_9 = _RAND_51[29:0];
  _RAND_52 = {1{`RANDOM}};
  regsPhase_10 = _RAND_52[29:0];
  _RAND_53 = {1{`RANDOM}};
  regsPhase_11 = _RAND_53[29:0];
  _RAND_54 = {1{`RANDOM}};
  regsPhase_12 = _RAND_54[29:0];
  _RAND_55 = {1{`RANDOM}};
  regsPhase_13 = _RAND_55[29:0];
  _RAND_56 = {1{`RANDOM}};
  regsPhase_14 = _RAND_56[29:0];
  _RAND_57 = {1{`RANDOM}};
  regsPhase_15 = _RAND_57[29:0];
  _RAND_58 = {1{`RANDOM}};
  regsPhase_16 = _RAND_58[29:0];
  _RAND_59 = {1{`RANDOM}};
  regsPhase_17 = _RAND_59[29:0];
  _RAND_60 = {1{`RANDOM}};
  regsPhase_18 = _RAND_60[29:0];
  _RAND_61 = {1{`RANDOM}};
  regsPhase_19 = _RAND_61[29:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    regsX_0 <= {$signed(_GEN_3), 19'h0};
    if (_T_30) begin
      regsX_1 <= _T_33;
    end else begin
      regsX_1 <= _T_36;
    end
    if (_T_59) begin
      regsX_2 <= _T_62;
    end else begin
      regsX_2 <= _T_65;
    end
    if (_T_88) begin
      regsX_3 <= _T_91;
    end else begin
      regsX_3 <= _T_94;
    end
    if (_T_117) begin
      regsX_4 <= _T_120;
    end else begin
      regsX_4 <= _T_123;
    end
    if (_T_146) begin
      regsX_5 <= _T_149;
    end else begin
      regsX_5 <= _T_152;
    end
    if (_T_175) begin
      regsX_6 <= _T_178;
    end else begin
      regsX_6 <= _T_181;
    end
    if (_T_204) begin
      regsX_7 <= _T_207;
    end else begin
      regsX_7 <= _T_210;
    end
    if (_T_233) begin
      regsX_8 <= _T_236;
    end else begin
      regsX_8 <= _T_239;
    end
    if (_T_262) begin
      regsX_9 <= _T_265;
    end else begin
      regsX_9 <= _T_268;
    end
    if (_T_291) begin
      regsX_10 <= _T_294;
    end else begin
      regsX_10 <= _T_297;
    end
    if (_T_320) begin
      regsX_11 <= _T_323;
    end else begin
      regsX_11 <= _T_326;
    end
    if (_T_349) begin
      regsX_12 <= _T_352;
    end else begin
      regsX_12 <= _T_355;
    end
    if (_T_378) begin
      regsX_13 <= _T_381;
    end else begin
      regsX_13 <= _T_384;
    end
    if (_T_407) begin
      regsX_14 <= _T_410;
    end else begin
      regsX_14 <= _T_413;
    end
    if (_T_436) begin
      regsX_15 <= _T_439;
    end else begin
      regsX_15 <= _T_442;
    end
    if (_T_465) begin
      regsX_16 <= _T_468;
    end else begin
      regsX_16 <= _T_471;
    end
    if (_T_494) begin
      regsX_17 <= _T_497;
    end else begin
      regsX_17 <= _T_500;
    end
    if (_T_523) begin
      regsX_18 <= _T_526;
    end else begin
      regsX_18 <= _T_529;
    end
    if (_T_552) begin
      regsX_19 <= _T_555;
    end else begin
      regsX_19 <= _T_558;
    end
    if (_T_581) begin
      regsX_20 <= _T_584;
    end else begin
      regsX_20 <= _T_587;
    end
    regsY_0 <= {$signed(_GEN_4), 19'h0};
    if (_T_30) begin
      regsY_1 <= _T_40;
    end else begin
      regsY_1 <= _T_43;
    end
    if (_T_59) begin
      regsY_2 <= _T_69;
    end else begin
      regsY_2 <= _T_72;
    end
    if (_T_88) begin
      regsY_3 <= _T_98;
    end else begin
      regsY_3 <= _T_101;
    end
    if (_T_117) begin
      regsY_4 <= _T_127;
    end else begin
      regsY_4 <= _T_130;
    end
    if (_T_146) begin
      regsY_5 <= _T_156;
    end else begin
      regsY_5 <= _T_159;
    end
    if (_T_175) begin
      regsY_6 <= _T_185;
    end else begin
      regsY_6 <= _T_188;
    end
    if (_T_204) begin
      regsY_7 <= _T_214;
    end else begin
      regsY_7 <= _T_217;
    end
    if (_T_233) begin
      regsY_8 <= _T_243;
    end else begin
      regsY_8 <= _T_246;
    end
    if (_T_262) begin
      regsY_9 <= _T_272;
    end else begin
      regsY_9 <= _T_275;
    end
    if (_T_291) begin
      regsY_10 <= _T_301;
    end else begin
      regsY_10 <= _T_304;
    end
    if (_T_320) begin
      regsY_11 <= _T_330;
    end else begin
      regsY_11 <= _T_333;
    end
    if (_T_349) begin
      regsY_12 <= _T_359;
    end else begin
      regsY_12 <= _T_362;
    end
    if (_T_378) begin
      regsY_13 <= _T_388;
    end else begin
      regsY_13 <= _T_391;
    end
    if (_T_407) begin
      regsY_14 <= _T_417;
    end else begin
      regsY_14 <= _T_420;
    end
    if (_T_436) begin
      regsY_15 <= _T_446;
    end else begin
      regsY_15 <= _T_449;
    end
    if (_T_465) begin
      regsY_16 <= _T_475;
    end else begin
      regsY_16 <= _T_478;
    end
    if (_T_494) begin
      regsY_17 <= _T_504;
    end else begin
      regsY_17 <= _T_507;
    end
    if (_T_523) begin
      regsY_18 <= _T_533;
    end else begin
      regsY_18 <= _T_536;
    end
    if (_T_552) begin
      regsY_19 <= _T_562;
    end else begin
      regsY_19 <= _T_565;
    end
    if (_T_581) begin
      regsY_20 <= _T_591;
    end else begin
      regsY_20 <= _T_594;
    end
    regsPhase_0 <= {$signed(_GEN_5), 20'h0};
    regsPhase_1 <= _T_51[29:0];
    regsPhase_2 <= _T_80[29:0];
    regsPhase_3 <= _T_109[29:0];
    regsPhase_4 <= _T_138[29:0];
    regsPhase_5 <= _T_167[29:0];
    regsPhase_6 <= _T_196[29:0];
    regsPhase_7 <= _T_225[29:0];
    regsPhase_8 <= _T_254[29:0];
    regsPhase_9 <= _T_283[29:0];
    regsPhase_10 <= _T_312[29:0];
    regsPhase_11 <= _T_341[29:0];
    regsPhase_12 <= _T_370[29:0];
    regsPhase_13 <= _T_399[29:0];
    regsPhase_14 <= _T_428[29:0];
    regsPhase_15 <= _T_457[29:0];
    regsPhase_16 <= _T_486[29:0];
    regsPhase_17 <= _T_515[29:0];
    regsPhase_18 <= _T_544[29:0];
    regsPhase_19 <= _T_573[29:0];
  end
endmodule
