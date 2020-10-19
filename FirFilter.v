module FirFilter(
  input        clock,
  input        reset,
  input  [7:0] io_in,
  output [7:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] _T__0; // @[FirFilter.scala 35:17]
  reg [7:0] _T__1; // @[FirFilter.scala 35:17]
  reg [7:0] _T__2; // @[FirFilter.scala 35:17]
  reg [7:0] _T_1_0; // @[FirFilter.scala 36:22]
  reg [7:0] _T_1_1; // @[FirFilter.scala 36:22]
  reg [7:0] _T_1_2; // @[FirFilter.scala 36:22]
  wire [8:0] _T_2 = _T__0 * 8'h1; // @[FirFilter.scala 38:25]
  wire [8:0] _T_3 = _T__1 * 8'h1; // @[FirFilter.scala 41:44]
  wire [8:0] _GEN_0 = {{1'd0}, _T_1_0}; // @[FirFilter.scala 41:36]
  wire [8:0] _T_5 = _GEN_0 + _T_3; // @[FirFilter.scala 41:36]
  wire [8:0] _T_6 = _T__2 * 8'h1; // @[FirFilter.scala 41:44]
  wire [8:0] _GEN_1 = {{1'd0}, _T_1_1}; // @[FirFilter.scala 41:36]
  wire [8:0] _T_8 = _GEN_1 + _T_6; // @[FirFilter.scala 41:36]
  assign io_out = _T_1_2; // @[FirFilter.scala 43:12]
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
  _T__0 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  _T__1 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  _T__2 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  _T_1_0 = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  _T_1_1 = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  _T_1_2 = _RAND_5[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    _T__0 <= io_in;
    _T__1 <= _T__0;
    _T__2 <= _T__1;
    _T_1_0 <= _T_2[7:0];
    _T_1_1 <= _T_5[7:0];
    _T_1_2 <= _T_8[7:0];
  end
endmodule
