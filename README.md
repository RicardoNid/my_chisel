# my_chisel

工程结构

top

    project
    src        
        main 
            scala - 未划分package的设计代码
                package
                    sub-package
        test
            scala - 未划分packge的测试代码
                package
    target - build产物
    verilog_output - verilog生成目标路径

10.19 基本完成了CORDIC生成器的旋转和三角功能,以及相关测试

    设计使用方法
        生成器:CORDIC.scala
        辅助函数(生成CORDIC相位值和scaled factor):CORDICutil.scala
        testbench:testCORDIC.scala
        build(生成verilog):
    设计中的要点:
        1.利用Option(Some&None),为不同功能定义不同引脚配置,请利用build分别生成旋转和三角模式verilog代码,观察其端口
        2.使用FixedPoint类型进行设计和验证,FixedPoint类型特性虽然还有不完备之处(比如移位之后返回Bit类型而无法进行进一步运算,又比如一元-操作符似乎无法被IDEA推断),但仍然能够大大简化计算电路,尤其是关心精度的计算电路的设计和验证
        3.从类型类中例化的类型值,可以直接当作typename使用,请看dataInT的用法
        4.注意区分代码中的静态和动态部分,区分哪些是纯粹的程序代码,哪些起到了"描述电路"的"副作用"

TODO:

    1.继续实现CORDIC IP核的其它功能
    2.使用chisel仿真生成波形文件,用Questasim打开观察
    3.对于生成的verilog代码,进行综合和仿真,测试其一致性
    4.分析firrtl和综合器对于精度执行的优化,是否有效消除了冗余寄存器?
