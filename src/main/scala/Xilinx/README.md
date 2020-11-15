[Xilinx FPGA 设计方法学]: https://github.com/RicardoNid/Xilinx-FPGA-methodology

# Xilinx Building Blocks

## package info

- verilog output path = ./verilog_output/Xilinx

## coding guidelines

- Do not asynchronously set or reset registers.
- Do not describe flip-flops with both a set and a reset.
- Avoid operational set/reset logic whenever possible.(global only)
- Always describe the clock enable, set, and reset control inputs of flip-flop primitives as 
active-High.(chisel default)

## about DSP

- Vivado synthesis pulls up to:
    - Two register stages present on the multiplication operands. 
    - One register stage present after the multiplication.
    - One register stage found after the Adder, Subtractor, or Adder/Subtractor. 
    - One register stage on the add/sub selection signal.
    - One register stage on the Adder optional carry input.
- to take advantage of the DSP pipeline:
    - design with corresponding latency
- corresponding module in package
    - todo
- for more info on DSP pipelining model : [Xilinx FPGA 设计方法学] 查看 重定时信号流图

## about RAM & ROM

- distributed RAM vs Block RAM:

- to infer RAM & ROM from chisel
    - corresponding module in package : 
        - BRAM
    - guideline
        - for RAM, **SyncReadMem** must be the design entry
        - for ROM, using VecInit would be enough