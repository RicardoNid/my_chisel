module PWM(
  input   clock,
  input   reset,
  output  io_sig
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [16:0] countReg; // @[PWM.scala 19:25]
  reg  countUpReg; // @[PWM.scala 20:27]
  wire [26:0] _GEN_5 = {{10'd0}, countReg}; // @[PWM.scala 23:17]
  wire  _T = _GEN_5 == 27'h5f5e100; // @[PWM.scala 23:17]
  wire [16:0] _T_2 = countReg - 17'h1; // @[PWM.scala 24:26]
  wire  _T_3 = countReg == 17'h0; // @[PWM.scala 26:23]
  wire [16:0] _T_5 = countReg + 17'h1; // @[PWM.scala 27:26]
  wire  _GEN_2 = _T_3 | countUpReg; // @[PWM.scala 26:32]
  wire  _GEN_4 = _T ? 1'h0 : _GEN_2; // @[PWM.scala 23:34]
  reg [16:0] _T_12; // @[PWM.scala 11:24]
  wire  _T_13 = _T_12 == 17'h1869f; // @[PWM.scala 12:24]
  wire [16:0] _T_15 = _T_12 + 17'h1; // @[PWM.scala 12:55]
  wire [16:0] _GEN_6 = {{10'd0}, countReg[16:10]}; // @[PWM.scala 13:11]
  assign io_sig = _T_12 < _GEN_6; // @[PWM.scala 35:10]
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
  countReg = _RAND_0[16:0];
  _RAND_1 = {1{`RANDOM}};
  countUpReg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_12 = _RAND_2[16:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      countReg <= 17'h0;
    end else if (_T) begin
      countReg <= _T_2;
    end else if (_T_3) begin
      countReg <= _T_5;
    end else if (countUpReg) begin
      countReg <= _T_5;
    end else begin
      countReg <= _T_2;
    end
    countUpReg <= reset | _GEN_4;
    if (reset) begin
      _T_12 <= 17'h0;
    end else if (_T_13) begin
      _T_12 <= 17'h0;
    end else begin
      _T_12 <= _T_15;
    end
  end
endmodule
