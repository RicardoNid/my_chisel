module Table(
  input   clock,
  input   reset,
  input   io_a,
  input   io_b,
  output  io_out
);
  wire [1:0] _GEN_4 = {{1'd0}, io_a}; // @[Table.scala 20:24]
  wire [2:0] _T = _GEN_4 * 2'h2; // @[Table.scala 20:24]
  wire [2:0] _GEN_5 = {{2'd0}, io_b}; // @[Table.scala 20:30]
  wire [2:0] _T_2 = _T + _GEN_5; // @[Table.scala 20:30]
  assign io_out = 2'h3 == _T_2[1:0]; // @[Table.scala 20:10]
endmodule
