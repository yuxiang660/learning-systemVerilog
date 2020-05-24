# 概述
本文是[SystemVerilog Tutorial](https://www.chipverify.com/systemverilog/systemverilog-tutorial)的学习笔记。最终目标是在Modelsim中将[Testbench Example](https://www.chipverify.com/systemverilog/systemverilog-testbench-example-1)跑起来。

# SystemVerilog TestBench
## 什么是Verilog仿真？
* 在不同时间，不同激励下，验证RTL代码的行为
* [例子](./code/simulation/hello.sv)：在Modelsim中跑一个简单的"SystemVerilog testbench"
* 仿真中的一些术语：
    - update event
    - evaluation event
    - event queue
    - simulation time
    - event regions
这些都是为了解决仿真中有可能出现的竞争问题。

## SystemVerilog如何应用与芯片验证中？
* 芯片设计通常由多个verilog文件组成，包括一个`top module`和多个子模块。这些verilog设计的功能需要被`testbench`验证，而`testbench`通常由SystemVerilog编写而成。
* 因此，testbench需要实例化`top module`，并提供各种激励，验证模块的输出是否正确。
* [例子 simple-tb](./code/simple-tb/tb_top.sv): `tb_top`是SystemVerilog编写的testbench，用于测试Verilog编写的D触发器["d_ff.v"](./code/simple-tb/d_ff.v)。

## 创建testbench的目的是什么？
通过仿真手段验证待测设计的功能。
* testbench的组成
    - Generator<br>
    生成各种激励以驱动被测电路
    - Interface<br>
    接口包括了需要被驱动或者被观测的信号
    - Driver<br>
    驱动激励到被测电路
    - Monitor<br>
    检测输入输出信号
    - Scoreboard<br>
    比较输出信号和期望值
    - Environment<br>
    包括以上所有的测试组件
    - Test<br>
    包括所有的测试环境
![testbench](./code/testbenchComponent.png)

