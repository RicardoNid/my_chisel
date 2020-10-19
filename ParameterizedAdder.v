module ParameterizedAdder(
  input        clock,
  input        reset,
  input  [3:0] io_in_a,
  input  [3:0] io_in_b,
  output [3:0] io_out
);
  wire [4:0] sum = io_in_a + io_in_b; // @[Adder.scala 46:21]
  wire  _T = sum > 5'hf; // @[Adder.scala 48:23]
  wire [4:0] _T_1 = _T ? 5'hf : sum; // @[Adder.scala 48:18]
  assign io_out = _T_1[3:0]; // @[Adder.scala 48:12]
endmodule
