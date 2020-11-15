#CNN

10.27

    在CNN package中,增加了Ma,2018文章的buffer,inputMap和reg序列生成脚本

    具体的更新内容
    1.用于生成访存golden数据的脚本放在 /src/main/scala/CNN/CNNutil.scala
    2.准备先通过其生成的地址数据,以

    设计中的要点
    1.脚本中的高度函数式语法,尤其是嵌套集合(多维数组)的函数式语法
    
11.3

    在CNN package中,增加了ConstantMM模块,用于生成和常数矩阵进行矩阵乘法的模块