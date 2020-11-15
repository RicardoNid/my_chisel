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