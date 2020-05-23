`include "uvm_pkg.sv"
module hello_world_example;
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  initial begin
    `uvm_info ("hello_world_example", "Hello World!", UVM_LOW)
  end
endmodule: hello_world_example
