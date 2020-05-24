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
## 创建testbench的目的是什么？
通过仿真手段验证待测设计的功能。
* testbench的组成
    - 

