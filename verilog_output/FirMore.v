module FirMore(
  input         clock,
  input         reset,
  input  [7:0]  io_in,
  output [24:0] io_out
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
  reg [7:0] regs_1; // @[FirMore.scala 18:20]
  reg [7:0] regs_2; // @[FirMore.scala 18:20]
  reg [7:0] regs_3; // @[FirMore.scala 18:20]
  reg [7:0] regs_4; // @[FirMore.scala 18:20]
  reg [7:0] regs_5; // @[FirMore.scala 18:20]
  reg [7:0] regs_6; // @[FirMore.scala 18:20]
  reg [7:0] regs_7; // @[FirMore.scala 18:20]
  reg [7:0] regs_8; // @[FirMore.scala 18:20]
  reg [7:0] regs_9; // @[FirMore.scala 18:20]
  wire [12:0] mults_0 = io_in * 8'h14; // @[FirMore.scala 22:75]
  wire [13:0] mults_1 = regs_1 * 8'h30; // @[FirMore.scala 22:75]
  wire [14:0] mults_2 = regs_2 * 8'h76; // @[FirMore.scala 22:75]
  wire [15:0] mults_3 = regs_3 * 8'hc5; // @[FirMore.scala 22:75]
  wire [15:0] mults_4 = regs_4 * 8'hf9; // @[FirMore.scala 22:75]
  wire [15:0] mults_5 = regs_5 * 8'hf9; // @[FirMore.scala 22:75]
  wire [15:0] mults_6 = regs_6 * 8'hc5; // @[FirMore.scala 22:75]
  wire [14:0] mults_7 = regs_7 * 8'h76; // @[FirMore.scala 22:75]
  wire [13:0] mults_8 = regs_8 * 8'h30; // @[FirMore.scala 22:75]
  wire [12:0] mults_9 = regs_9 * 8'h14; // @[FirMore.scala 22:75]
  wire [13:0] _GEN_0 = {{1'd0}, mults_0}; // @[FirMore.scala 23:31]
  wire [14:0] _T_10 = _GEN_0 + mults_1; // @[FirMore.scala 23:31]
  wire [15:0] _T_11 = _T_10 + mults_2; // @[FirMore.scala 23:31]
  wire [16:0] _T_12 = _T_11 + mults_3; // @[FirMore.scala 23:31]
  wire [16:0] _GEN_1 = {{1'd0}, mults_4}; // @[FirMore.scala 23:31]
  wire [17:0] _T_13 = _T_12 + _GEN_1; // @[FirMore.scala 23:31]
  wire [17:0] _GEN_2 = {{2'd0}, mults_5}; // @[FirMore.scala 23:31]
  wire [18:0] _T_14 = _T_13 + _GEN_2; // @[FirMore.scala 23:31]
  wire [18:0] _GEN_3 = {{3'd0}, mults_6}; // @[FirMore.scala 23:31]
  wire [19:0] _T_15 = _T_14 + _GEN_3; // @[FirMore.scala 23:31]
  wire [19:0] _GEN_4 = {{5'd0}, mults_7}; // @[FirMore.scala 23:31]
  wire [20:0] _T_16 = _T_15 + _GEN_4; // @[FirMore.scala 23:31]
  wire [20:0] _GEN_5 = {{7'd0}, mults_8}; // @[FirMore.scala 23:31]
  wire [21:0] _T_17 = _T_16 + _GEN_5; // @[FirMore.scala 23:31]
  wire [21:0] _GEN_6 = {{9'd0}, mults_9}; // @[FirMore.scala 23:31]
  wire [22:0] result = _T_17 + _GEN_6; // @[FirMore.scala 23:31]
  assign io_out = {{2'd0}, result}; // @[FirMore.scala 25:10]
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
  regs_1 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  regs_2 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  regs_3 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  regs_4 = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  regs_5 = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  regs_6 = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  regs_7 = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  regs_8 = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  regs_9 = _RAND_8[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    regs_1 <= io_in;
    regs_2 <= regs_1;
    regs_3 <= regs_2;
    regs_4 <= regs_3;
    regs_5 <= regs_4;
    regs_6 <= regs_5;
    regs_7 <= regs_6;
    regs_8 <= regs_7;
    regs_9 <= regs_8;
  end
endmodule
