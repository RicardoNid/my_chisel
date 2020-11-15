# Xilinx Building Blocks

## package info

- verilog output path = ./verilog_output/Xilinx


## coding guidelines

- Do not asynchronously set or reset registers.
- Do not describe flip-flops with both a set and a reset.
- Avoid operational set/reset logic whenever possible.(global only)
- Always describe the clock enable, set, and reset control inputs of flip-flop primitives as 
active-High.(chisel default)

## 