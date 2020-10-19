module Fir(
  input        clock,
  input        reset,
  input  [7:0] io_in,
  input        io_valid,
  output [7:0] io_out,
  input  [7:0] io_consts_0,
  input  [7:0] io_consts_1,
  input  [7:0] io_consts_2,
  input  [7:0] io_consts_3,
  input  [7:0] io_consts_4,
  input  [7:0] io_consts_5,
  input  [7:0] io_consts_6,
  input  [7:0] io_consts_7,
  input  [7:0] io_consts_8,
  input  [7:0] io_consts_9
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
`endif // RANDOMIZE_REG_INIT
  reg [7:0] taps_1; // @[FIR.scala 14:66]
  reg [7:0] taps_2; // @[FIR.scala 14:66]
  reg [7:0] taps_3; // @[FIR.scala 14:66]
  reg [7:0] taps_4; // @[FIR.scala 14:66]
  reg [7:0] taps_5; // @[FIR.scala 14:66]
  reg [7:0] taps_6; // @[FIR.scala 14:66]
  reg [7:0] taps_7; // @[FIR.scala 14:66]
  reg [7:0] taps_8; // @[FIR.scala 14:66]
  reg [7:0] taps_9; // @[FIR.scala 14:66]
  wire [15:0] _T = io_in * io_consts_0; // @[FIR.scala 17:56]
  wire [15:0] _T_1 = taps_1 * io_consts_1; // @[FIR.scala 17:56]
  wire [15:0] _T_2 = taps_2 * io_consts_2; // @[FIR.scala 17:56]
  wire [15:0] _T_3 = taps_3 * io_consts_3; // @[FIR.scala 17:56]
  wire [15:0] _T_4 = taps_4 * io_consts_4; // @[FIR.scala 17:56]
  wire [15:0] _T_5 = taps_5 * io_consts_5; // @[FIR.scala 17:56]
  wire [15:0] _T_6 = taps_6 * io_consts_6; // @[FIR.scala 17:56]
  wire [15:0] _T_7 = taps_7 * io_consts_7; // @[FIR.scala 17:56]
  wire [15:0] _T_8 = taps_8 * io_consts_8; // @[FIR.scala 17:56]
  wire [15:0] _T_9 = taps_9 * io_consts_9; // @[FIR.scala 17:56]
  wire [15:0] _T_11 = _T + _T_1; // @[FIR.scala 17:71]
  wire [15:0] _T_13 = _T_11 + _T_2; // @[FIR.scala 17:71]
  wire [15:0] _T_15 = _T_13 + _T_3; // @[FIR.scala 17:71]
  wire [15:0] _T_17 = _T_15 + _T_4; // @[FIR.scala 17:71]
  wire [15:0] _T_19 = _T_17 + _T_5; // @[FIR.scala 17:71]
  wire [15:0] _T_21 = _T_19 + _T_6; // @[FIR.scala 17:71]
  wire [15:0] _T_23 = _T_21 + _T_7; // @[FIR.scala 17:71]
  wire [15:0] _T_25 = _T_23 + _T_8; // @[FIR.scala 17:71]
  wire [15:0] _T_27 = _T_25 + _T_9; // @[FIR.scala 17:71]
  assign io_out = _T_27[7:0]; // @[FIR.scala 17:10]
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
  taps_1 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  taps_2 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  taps_3 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  taps_4 = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  taps_5 = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  taps_6 = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  taps_7 = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  taps_8 = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  taps_9 = _RAND_8[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      taps_1 <= 8'h0;
    end else if (io_valid) begin
      taps_1 <= io_in;
    end
    if (reset) begin
      taps_2 <= 8'h0;
    end else if (io_valid) begin
      taps_2 <= taps_1;
    end
    if (reset) begin
      taps_3 <= 8'h0;
    end else if (io_valid) begin
      taps_3 <= taps_2;
    end
    if (reset) begin
      taps_4 <= 8'h0;
    end else if (io_valid) begin
      taps_4 <= taps_3;
    end
    if (reset) begin
      taps_5 <= 8'h0;
    end else if (io_valid) begin
      taps_5 <= taps_4;
    end
    if (reset) begin
      taps_6 <= 8'h0;
    end else if (io_valid) begin
      taps_6 <= taps_5;
    end
    if (reset) begin
      taps_7 <= 8'h0;
    end else if (io_valid) begin
      taps_7 <= taps_6;
    end
    if (reset) begin
      taps_8 <= 8'h0;
    end else if (io_valid) begin
      taps_8 <= taps_7;
    end
    if (reset) begin
      taps_9 <= 8'h0;
    end else if (io_valid) begin
      taps_9 <= taps_8;
    end
  end
endmodule
