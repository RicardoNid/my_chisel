# my_chisel

本工程集中了本人使用chisel的进行各类数字电路设计,主要是面向Xilinx FPGA的设计,内容包括
- Xilinx DSP IP复现
- DNN加速器模块的实现
- 如果对实验结果/chisel学习有兴趣,请联系litianr@mail2.sysu.edu.cn

---

## 工程目录结构

- todo

---

## 设计组织形式 - 以FIR为例

- 围绕着FIR的各种设计,在/src/main/scala/FIR package中
- package object中包含和FIR算法相关的各种helper function,如hamming窗生成函数
- 每个具体的module设计,实现为一个class,以FirFilter为例
    - FirFilter的硬件描述在FirFilter class中
    - FirFilter的verilog导出任务,是FirFilter的companion object的main function
    - 仅供FirFilter使用的helper function,是FirFilter的companion object的method
    - 对应该module的测试,在/src/test/scala/FIR/testFirFilter中
    - 生成的verilog代码,在verilog_output/FIR/中
    - 

---

## 结合vivado上板实验方式 - 以FIR.Demo为例

- testOnly FIR.Demo 进行验证,生成相应verilog testbench所需的激励
- runMain FIR.Demo 
    - 修改verilog导出任务对应的main函数,输出verilog文件到工程目录下
- 在vivado中生成其它IP(对于FIR.Demo,还需通过clocking wizard生成时钟)
- 在dvt中将module和ip拼接成top.v,使用生成的激励写出top_tb.v
- 在vivado中加入Demo.v,top.v和约束文件
- 运行到implementation为止的流程,保存checkpoint到/implemented design,如果有可综合性问题/综合推断问题,修正
- 运行post-implementation simulation,如果有功能/时序问题,修正
- 生成bitstream,上板

---

## Roadmap

- Xilinx
    - 完成对应UG901中各种RAM & ROM的chisel实现 before 11.22
    - 编写对应于BRAM Generator的module before 11.22
    - 编写对应于FIFO Generator的module before 11.22

- CNN
    - 整理目前为止的代码 before 11.22
    - 编写实现对应任意loop order, tiling factor 和 unroll factor的PE阵列module,应当通过一维/二维systolic array on DSP实现 before 11.29




        
