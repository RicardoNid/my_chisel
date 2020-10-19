module MealyFSM(
  input   clock,
  input   reset,
  input   io_in,
  output  io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] state; // @[MealyFSM.scala 22:22]
  wire  _T = state == 2'h0; // @[MealyFSM.scala 26:16]
  wire  _GEN_2 = _T & io_in; // @[MealyFSM.scala 26:25]
  wire  _T_1 = state == 2'h1; // @[MealyFSM.scala 26:16]
  wire  _GEN_3 = io_in ? 1'h0 : 1'h1; // @[MealyFSM.scala 27:19]
  wire  _GEN_5 = _T_1 ? _GEN_3 : _GEN_2; // @[MealyFSM.scala 26:25]
  wire  _T_2 = state == 2'h2; // @[MealyFSM.scala 26:16]
  assign io_out = _T_2 ? 1'h0 : _GEN_5; // @[MealyFSM.scala 24:10 MealyFSM.scala 29:16 MealyFSM.scala 32:16 MealyFSM.scala 29:16 MealyFSM.scala 32:16 MealyFSM.scala 29:16 MealyFSM.scala 32:16]
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
  state = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      state <= 2'h2;
    end else if (_T_2) begin
      state <= {{1'd0}, io_in};
    end else if (_T_1) begin
      state <= {{1'd0}, io_in};
    end else if (_T) begin
      state <= {{1'd0}, io_in};
    end
  end
endmodule
