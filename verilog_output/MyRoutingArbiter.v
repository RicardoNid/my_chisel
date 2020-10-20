module MyRoutingArbiter(
  input        clock,
  input        reset,
  output       io_in_0_ready,
  input        io_in_0_valid,
  input  [7:0] io_in_0_bits,
  output       io_in_1_ready,
  input        io_in_1_valid,
  input  [7:0] io_in_1_bits,
  output       io_in_2_ready,
  input        io_in_2_valid,
  input  [7:0] io_in_2_bits,
  output       io_in_3_ready,
  input        io_in_3_valid,
  input  [7:0] io_in_3_bits,
  output       io_in_4_ready,
  input        io_in_4_valid,
  input  [7:0] io_in_4_bits,
  input        io_out_ready,
  output       io_out_valid,
  output [7:0] io_out_bits
);
  wire  _T = io_in_0_valid | io_in_1_valid; // @[routing.scala 11:47]
  wire  _T_1 = _T | io_in_2_valid; // @[routing.scala 11:47]
  wire  _T_2 = _T_1 | io_in_3_valid; // @[routing.scala 11:47]
  wire [2:0] _T_4 = io_in_3_valid ? 3'h3 : 3'h4; // @[Mux.scala 47:69]
  wire [2:0] _T_5 = io_in_2_valid ? 3'h2 : _T_4; // @[Mux.scala 47:69]
  wire [2:0] _T_6 = io_in_1_valid ? 3'h1 : _T_5; // @[Mux.scala 47:69]
  wire [2:0] channel = io_in_0_valid ? 3'h0 : _T_6; // @[Mux.scala 47:69]
  wire [7:0] _GEN_5 = 3'h1 == channel ? io_in_1_bits : io_in_0_bits; // @[routing.scala 13:15]
  wire [7:0] _GEN_8 = 3'h2 == channel ? io_in_2_bits : _GEN_5; // @[routing.scala 13:15]
  wire [7:0] _GEN_11 = 3'h3 == channel ? io_in_3_bits : _GEN_8; // @[routing.scala 13:15]
  wire  _T_7 = channel == 3'h0; // @[routing.scala 15:60]
  wire  _T_9 = channel == 3'h1; // @[routing.scala 15:60]
  wire  _T_11 = channel == 3'h2; // @[routing.scala 15:60]
  wire  _T_13 = channel == 3'h3; // @[routing.scala 15:60]
  wire  _T_15 = channel == 3'h4; // @[routing.scala 15:60]
  assign io_in_0_ready = io_out_ready & _T_7; // @[routing.scala 15:33]
  assign io_in_1_ready = io_out_ready & _T_9; // @[routing.scala 15:33]
  assign io_in_2_ready = io_out_ready & _T_11; // @[routing.scala 15:33]
  assign io_in_3_ready = io_out_ready & _T_13; // @[routing.scala 15:33]
  assign io_in_4_ready = io_out_ready & _T_15; // @[routing.scala 15:33]
  assign io_out_valid = _T_2 | io_in_4_valid; // @[routing.scala 11:16]
  assign io_out_bits = 3'h4 == channel ? io_in_4_bits : _GEN_11; // @[routing.scala 13:15]
endmodule
