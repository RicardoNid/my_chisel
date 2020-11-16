package CNN
import chisel3._
import chisel3.util._

// 假设
// 只有DRAM-片上存储-PE RF三级缓存
// 使用ROM代替片上存储,发出访存信号代替实际访DRAM
// 片上存储全都是RAM
//
// 每个PE是一个DSP slice
//  - 启用极限pipeline
//  - 启用跨时钟域设计
//  - 一维脉动阵列(只在一个方向上进行DSP间数据传输)
