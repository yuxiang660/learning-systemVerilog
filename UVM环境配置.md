# 概述
此文章的目的是搭建基于`Modelsim SE-64 10.1c`的`UVM`hello world环境，可参考"code/uvm-hello"中的例子。

# 步骤
* 安装`Modelsim SE-64 10.1c`<br>
UVM各种版本的库会和`Modelsim`一起被安装完成，以下以`uvm-1.1`为例子，完成环境配置。当然也可以使用其他版本，或者从网络上下载最新的uvm版本。
    - DLL目录：C:\modeltech64_10.1c\uvm-1.1\win64
    - 源文件目录：C:\modeltech64_10.1c\verilog_src\uvm-1.1\src
* 编写验证文件["hello.sv"](./code/uvm-hello/hello.sv)
    - module名称：hello_world_example
    - 文件只实现了用UVM方法"`uvm_info"打印字符串
* 编写Modelsim脚本文件["hello.do"](./code/uvm-hello/hello.do)，编译和执行"hello.sv"
    - `set UVM_DPI_HOME C:/modeltech64_10.1c/uvm-1.1/win64`<br>
    设置环境变量UVM_DPI_HOME，指定modelsim下的UVM1.1的DPI的位置
    - `vlib work`<br>
    建立work library
    - `vlog -L mtiAvm -L mtiOvm -L mtiUvm -L mtiUPF +incdir+C:/modeltech64_10.1c/verilog_src/uvm-1.1/src hello.sv`
    编译hello.sv代码(**请修改成正确的验证代码文件**)，通过-L 指定编译需要的几个library，通过"+incdir+"指定编译需要的UVM源文件
    - `vsim -c -sv_lib $UVM_DPI_HOME/uvm_dpi work.hello_world_example`<br>
    执行仿真，通过-sv_lib选项，执行UVM1.1的uvm_dpi.dll，然后针对"work.hello_world_example"进行仿真(**请修改成正确的module名称**)
    - `run 100`<br>
    运行100个时间单位，可更改为任意时间
* 利用[Makefile](./code/uvm-hello/Makefile)完成自动化执行
    - 执行`make`<br>
    在"Transcript"窗口输出：`UVM_INFO hello.sv(6) @ 0: reporter [hello_world_example] Hello World!`
    - 执行`make clean`，可删除编译生成的文件

# 参考文章
[Modelsim SE-64 10.4建立UVM环境](https://blog.csdn.net/qq_27745395/article/details/76146483)