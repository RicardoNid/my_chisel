module BRAMGen(
  input         clock,
  input         reset,
  input  [9:0]  io_addr,
  input  [31:0] io_din,
  output [31:0] io_dout,
  input         io_ena,
  input         io_wea
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem [0:1023]; // @[BRAM.scala 16:24]
  wire [31:0] mem__T_data; // @[BRAM.scala 16:24]
  wire [9:0] mem__T_addr; // @[BRAM.scala 16:24]
  wire [31:0] mem__T_1_data; // @[BRAM.scala 16:24]
  wire [9:0] mem__T_1_addr; // @[BRAM.scala 16:24]
  wire  mem__T_1_mask; // @[BRAM.scala 16:24]
  wire  mem__T_1_en; // @[BRAM.scala 16:24]
  reg [9:0] mem__T_addr_pipe_0;
  assign mem__T_addr = mem__T_addr_pipe_0;
  assign mem__T_data = mem[mem__T_addr]; // @[BRAM.scala 16:24]
  assign mem__T_1_data = io_din;
  assign mem__T_1_addr = io_addr;
  assign mem__T_1_mask = 1'h1;
  assign mem__T_1_en = io_wea;
  assign io_dout = mem__T_data; // @[BRAM.scala 18:11]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    mem[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem__T_addr_pipe_0 = _RAND_1[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(mem__T_1_en & mem__T_1_mask) begin
      mem[mem__T_1_addr] <= mem__T_1_data; // @[BRAM.scala 16:24]
    end
    mem__T_addr_pipe_0 <= io_addr;
  end
endmodule
