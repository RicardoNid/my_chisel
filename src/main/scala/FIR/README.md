# FIR

## 11.12

- 重写了FIR.FirFilter,包括
    - 修改数据类型为定点数
    - coeffs使用breeze vector,方便产生golden进行测试
    - 修正了之前错误的脉动阵列,在vivado综合 & 布局布线结果中确认了新设计的正确性
- 重写了FIR.testFirFilter
    - 修改为sbt标准测试(通过assertion)
    - 采用了随机化激励

## 11.13

- 增加了使用时钟域的设计模板CrossClock,它是一个轮流从3个BRAM中获取数据的module
- 综合结果符合预期
- 逻辑仿真结果正确
- 时序仿真也许需要修改timescale?

## 11.15

- 在Demo当中,编写了一个kernel固定,input从四个ROM port上轮流获取的设计
    - 使用RawModule进行显式多时钟设计
    - 使用Wire作为跨时钟域的"桥梁"
    - 使用额外打两拍的方式避免跨时钟域亚稳态,还要进一步学习理解
    - 进行了综合和布局布线,结果保存在/implemented/DemoOriginal.dcp
        - 综合结果,布局结果基本上符合预期
            - 144个DSP,分布在一列上 => 运算能够精确映射到指定流水配置方式的DSP
            - 2个BRAM,4个端口实现了四个ROM port => VecInit能够精确映射到ROM
        - 时序违例,关键路径出现在
            - 不经过BRAM的某些组合逻辑
            - 第一个和第二个DSP之间

## 11.16

- 在FirFilter Module设计中,在输入延迟线上前端增加一级寄存器,消除了DSP间的时序违例
- 在跨时钟域传递数据时,在多路选择器(使用counter作为选择数据)后增加一级寄存器,献出了组合逻辑(inter-clock)的时序违例
- 将ROM,Counter的语法改为函数式语法
- 以下check point分别对应
    - FIR145 145阶FIR
    - FIR145withClock 145阶FIR,使用700MHz时钟,未修正
    - FIR145withClock_fixed 145阶FIR,使用700MHz时钟,修正DSP间路径(注意,145阶存在跨列路径)
    - FIR144withClock_fixed 144阶FIR,使用700MHz时钟,修正DSP间路径,不存在跨列路径
    - TinyDemoOriginal 8阶FIR,接入跨时钟域多通道设计,未修正组合逻辑路径
    - TinyDemoImproved 8阶FIR,接入跨时钟域多通道设计,修正组合逻辑路径,因为错误的代码未能推断出ROM
    - TinyDemoFinal 144阶FIR,接入跨时钟域多通道设计,修正组合逻辑路径,修正ROM推断,去除冗余计数器
    - 对比得到时序性能和官方IP相当

### todo

- 将设计解耦为ROM,交织器和FIR滤波器
- 进行Demo的功能验证,验证方式:使用同样的ROM和交织器,将我的FIR滤波器和官方IP产生的FIR滤波器例化在同一设计当中进行,接比较器输出
- 