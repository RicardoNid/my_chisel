module FIR.FirFilter(
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
`endif // RANDOMIZE_REG_INIT
  reg [7:0] _T__0; // @[FIR.FirFilter.scala 14:17]
  reg [7:0] _T__1; // @[FIR.FirFilter.scala 14:17]
  reg [7:0] _T__2; // @[FIR.FirFilter.scala 14:17]
  reg [7:0] _T__3; // @[FIR.FirFilter.scala 14:17]
  wire [8:0] _T_1 = _T__0 * 8'h1; // @[FIR.FirFilter.scala 19:63]
  wire [8:0] _T_2 = _T__1 * 8'h1; // @[FIR.FirFilter.scala 19:63]
  wire [8:0] _T_3 = _T__2 * 8'h1; // @[FIR.FirFilter.scala 19:63]
  wire [8:0] _T_4 = _T__3 * 8'h1; // @[FIR.FirFilter.scala 19:63]
  wire [8:0] _T_7 = _T_1 + _T_2; // @[FIR.FirFilter.scala 20:33]
  wire [8:0] _T_9 = _T_7 + _T_3; // @[FIR.FirFilter.scala 20:33]
  wire [8:0] _T_11 = _T_9 + _T_4; // @[FIR.FirFilter.scala 20:33]
  assign io_out = _T_11[7:0]; // @[FIR.FirFilter.scala 20:12]
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
  _T__3 = _RAND_3[7:0];
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
    _T__3 <= _T__2;
  end
endmodule
