[Ma, 2018]: https://ieeexplore.ieee.org/document/8330049


# CNN

## 10.27
在CNN package中,增加了Ma,2018文章的buffer,inputMap和reg序列生成脚本

具体的更新内容
1.用于生成访存golden数据的脚本放在 /src/main/scala/CNN/CNNutil.scala
2.准备先通过其生成的地址数据,以

设计中的要点
1.脚本中的高度函数式语法,尤其是嵌套集合(多维数组)的函数式语法
    
## 11.3
在CNN package中,增加了ConstantMM模块,用于生成和常数矩阵进行矩阵乘法的模块

## 11.19

- 为loopnest增加了一些新的内容,在其main函数中,使用[Ma, 2018]中进行展示所使用的参数和展开方式,确认生成的input,kernel,output坐标无误
- 尝试利用LoopNextParam编写参数化的,直接从RAM中获得数据的卷积核,但在高维数组参数化上遇到不少问题,语法只是一方面,可以想象chisel/verilog对于高维数组的展开/综合恐怕也不甚理想
- 通过一个module完成所有内容可能不太现实,还是要解耦为
    - PE阵列模块
    - 跨时钟域缓冲模块
    - bestBRAM模块
        - 之后进一步改为buffer planner生成的模块
    - 地址发生器模块
- 对于loopnest的建模和分析还需要面向对象的
    - 坐标类
    - "数据流"类,其数据元素是坐标类
    - 循环体表示类,在其上要实现loop transformation方法
- 在继续写代码之前
    - 复习和精进scala,尤其是函数式和面向对象特性,以及循环相关内容(包括不定循环和递归)
    - 彻底理解polyhedral数学模型,以及在上面能够进行的数学变换,为了实现这一点,可能需要看若干篇论文,但也不能回避这个问题,应该看到看懂为止