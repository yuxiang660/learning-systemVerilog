set UVM_DPI_HOME C:/modeltech64_10.1c/uvm-1.1/win64
vlib work
vlog -L mtiAvm -L mtiOvm -L mtiUvm -L mtiUPF +incdir+C:/modeltech64_10.1c/verilog_src/uvm-1.1/src hello.sv
vsim -c -sv_lib $UVM_DPI_HOME/uvm_dpi work.hello_world_example
run 100