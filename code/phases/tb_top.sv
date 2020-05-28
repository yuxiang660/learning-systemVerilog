`timescale 1ns/1ps
 
module top;
  import uvm_pkg::*;
  import test_pkg::*;

  initial begin
    run_test ("base_test");
  end

endmodule