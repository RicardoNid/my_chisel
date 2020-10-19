module MyModule(
  input        clock,
  input        reset,
  input  [3:0] io_a,
  input  [3:0] io_b,
  output [7:0] io_out
);
  assign io_out = {io_a,io_b}; // @[Adder.scala 11:10]
endmodule
