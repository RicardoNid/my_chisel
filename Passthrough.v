module Passthrough(
  input        clock,
  input        reset,
  input  [3:0] io_in,
  output [3:0] io_out
);
  assign io_out = io_in; // @[Adder.scala 10:10]
endmodule : Passthrough
