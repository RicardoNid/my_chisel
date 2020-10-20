module simplerFIR(
  input        clock,
  input        reset,
  input  [7:0] io_in,
  input  [7:0] io_consts_0,
  input  [7:0] io_consts_1,
  input  [7:0] io_consts_2,
  input  [7:0] io_consts_3,
  input  [7:0] io_consts_4,
  input  [7:0] io_consts_5,
  input  [7:0] io_consts_6,
  input  [7:0] io_consts_7,
  input  [7:0] io_consts_8,
  input  [7:0] io_consts_9,
  output [7:0] io_out
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
  reg [7:0] regs_0; // @[FIR.scala 41:21]
  reg [7:0] regs_1; // @[FIR.scala 41:21]
  reg [7:0] regs_2; // @[FIR.scala 41:21]
  reg [7:0] regs_3; // @[FIR.scala 41:21]
  reg [7:0] regs_4; // @[FIR.scala 41:21]
  reg [7:0] regs_5; // @[FIR.scala 41:21]
  reg [7:0] regs_6; // @[FIR.scala 41:21]
  reg [7:0] regs_7; // @[FIR.scala 41:21]
  reg [7:0] regs_8; // @[FIR.scala 41:21]
  wire [15:0] _T_1 = regs_0 * io_consts_0; // @[FIR.scala 45:53]
  wire [15:0] _T_2 = regs_1 * io_consts_1; // @[FIR.scala 45:53]
  wire [15:0] _T_3 = regs_2 * io_consts_2; // @[FIR.scala 45:53]
  wire [15:0] _T_4 = regs_3 * io_consts_3; // @[FIR.scala 45:53]
  wire [15:0] _T_5 = regs_4 * io_consts_4; // @[FIR.scala 45:53]
  wire [15:0] _T_6 = regs_5 * io_consts_5; // @[FIR.scala 45:53]
  wire [15:0] _T_7 = regs_6 * io_consts_6; // @[FIR.scala 45:53]
  wire [15:0] _T_8 = regs_7 * io_consts_7; // @[FIR.scala 45:53]
  wire [15:0] _T_9 = regs_8 * io_consts_8; // @[FIR.scala 45:53]
  wire [15:0] _T_11 = _T_1 + _T_2; // @[FIR.scala 45:66]
  wire [15:0] _T_13 = _T_11 + _T_3; // @[FIR.scala 45:66]
  wire [15:0] _T_15 = _T_13 + _T_4; // @[FIR.scala 45:66]
  wire [15:0] _T_17 = _T_15 + _T_5; // @[FIR.scala 45:66]
  wire [15:0] _T_19 = _T_17 + _T_6; // @[FIR.scala 45:66]
  wire [15:0] _T_21 = _T_19 + _T_7; // @[FIR.scala 45:66]
  wire [15:0] _T_23 = _T_21 + _T_8; // @[FIR.scala 45:66]
  wire [15:0] _T_25 = _T_23 + _T_9; // @[FIR.scala 45:66]
  assign io_out = _T_25[7:0]; // @[FIR.scala 45:10]
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
  regs_0 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  regs_1 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  regs_2 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  regs_3 = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  regs_4 = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  regs_5 = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  regs_6 = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  regs_7 = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  regs_8 = _RAND_8[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      regs_0 <= 8'h0;
    end else begin
      regs_0 <= io_in;
    end
    if (reset) begin
      regs_1 <= 8'h0;
    end else begin
      regs_1 <= regs_0;
    end
    if (reset) begin
      regs_2 <= 8'h0;
    end else begin
      regs_2 <= regs_1;
    end
    if (reset) begin
      regs_3 <= 8'h0;
    end else begin
      regs_3 <= regs_2;
    end
    if (reset) begin
      regs_4 <= 8'h0;
    end else begin
      regs_4 <= regs_3;
    end
    if (reset) begin
      regs_5 <= 8'h0;
    end else begin
      regs_5 <= regs_4;
    end
    if (reset) begin
      regs_6 <= 8'h0;
    end else begin
      regs_6 <= regs_5;
    end
    if (reset) begin
      regs_7 <= 8'h0;
    end else begin
      regs_7 <= regs_6;
    end
    if (reset) begin
      regs_8 <= 8'h0;
    end else begin
      regs_8 <= regs_7;
    end
  end
endmodule
