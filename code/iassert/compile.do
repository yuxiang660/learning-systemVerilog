set UVM_DPI_HOME C:/modeltech64_10.1c/uvm-1.1/win64
vlib work
vlog -L mtiAvm -L mtiOvm -L mtiUvm -L mtiUPF iassert.sv tb.sv
vsim -c -novopt -sv_lib $UVM_DPI_HOME/uvm_dpi work.tb
run