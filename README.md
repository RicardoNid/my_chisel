# my_chisel

工程结构

top

    project
    src        
        main 
            scala - 未划分package的设计代码
                CNN
                DSP
                FIR
                Xilinx
        test
            scala - 未划分packge的测试代码
                package
    target - build产物
    verilog_output - verilog生成目标路径

10.22 基本完成了CORDIC生成器的旋转和三角功能,以及相关测试

    设计使用方法
        生成器:CORDIC.CORDIC.scala
        辅助函数(生成CORDIC相位值和scaled factor):CORDICutil.scala
        testbench:testCORDIC.scala
        build(生成verilog):
    设计中的要点:
        1.利用Option(Some&None),为不同功能定义不同引脚配置,请利用build分别生成旋转和三角模式verilog代码,观察其端口
        2.使用FixedPoint类型进行设计和验证,FixedPoint类型特性虽然还有不完备之处(比如移位之后返回Bit类型而无法进行进一步运算,又比如一元-操作符似乎无法被IDEA推断),但仍然能够大大简化计算电路,尤其是关心精度的计算电路的设计和验证
        3.从类型类中例化的类型值,可以直接当作typename使用,请看dataInT的用法
        4.注意区分代码中的静态和动态部分,区分哪些是纯粹的程序代码,哪些起到了"描述电路"的"副作用"

10.23 完成了CORDIC生成器的旋转,三角,极坐标转换和arctan功能,以及相关测试

    增加的具体内容
    1.将CORDIC核的实现解耦为
        1.待查表生成(不同坐标系)
        2.初始化和迭代准则(不同逼近模式)
        3.接口配置(不同功能模式)
        4.寄存器连接方法(不同流水架构)
    这几方面的内容,通过对于它们的"选择"来定义CORDIC,并且,每一个选择,都能复用其它方面选择的设计
    2.完成象限映射部分,将工作范围扩展到整个[-Pi~Pi]
    3.按照PG-105的要求,将精度策略修改至与Xilinx IP核一致,并且构建了检验精度的testbench

    设计中的要点
    1.利用Option配置可选的接口
    2.使用assertion导向,而不是输出导向的testbench
    3.设计时应该采用"测试先行"的方式

10.26 
    
    增加了CORDIC生成器的双曲函数功能以及相关测试,包括chisel和verilog;编写了CNN-Buffer2PE(依据 Ma,2018)的ground truth生成脚本

    更新的具体内容
    1. 整理了工程目录,将较为完整,并且还要长期更新维护的项目放到/src下的package中
    2. CORDIC IP增加了双曲函数功能(sinh,cosh),增加了相应的测试,并且增加了verilog测试(/verilog_output/tb),verilog测试代码通过dvt+chisel脚本生成
    3. 简单测试了mem综合为BRAM的情况
    4. 编写了用于产生Ma,2018中datapath的buffer数据和逐周期register的脚本

    设计中的要点
    1.增加新功能的没一个节点,都测试原有功能的正确性-高速testbench至关重要
    2.CORDIC IP的双曲线功能,要理解"双曲角"并不是圆角
    3.灵活地在各种工具上进行设计,包括matlab,dvt,vivado和IDEA
    4.访存模式的分析,如果拘泥于具体设计,反而想破头都想不出来,在读更多论文之后,将数据流分析数学化,并多利用脚本输出可视化图像帮助自己理解

TODO:

    10.23
    
    1.复习bootcamp,不沉溺于细节,先给出一张Chisel特性表
    2.读完the chisel book
    3.继续精进scala

    10.26
    1.将CORDIC双曲线模式下的arctanh功能完善,再加上sqrt功能,测试完之后,CORDIC IP工作暂时中止,之后再加上AXI-Stream接口,并进行更详尽的数值分析
    2.整理和Ma,2018相关的代码,便于之后使用
    3.编写Xilinx资源相关IP(BRAM,FIFO,DSP48,SRL)相关IP,进行综合和评估
    4.整理chisel资料包和学习路线图
    5.接下来要关注的scala主题
        import和package - 帮助管理工程
        多维集合的函数式编程 - 帮助处理数据流
        case和模式匹配 - 函数式编程必须掌握
        
