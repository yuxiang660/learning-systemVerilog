`include "timescale.v"

module top;
  import uvm_pkg::*;
  import test_pkg::*;

//-----------------------------------------------------------------------------
// Clock Generation Module; Flips every 10ns => Freq = 50 MHz 
//-----------------------------------------------------------------------------
  bit clk;
  always #10 clk <= ~clk; 

//-----------------------------------------------------------------------------
// Instantiate the Interface and pass it to Design Wrapper
//-----------------------------------------------------------------------------
  dut_if         dut_if1  (clk);
  dut_wrapper    dut_wr0  (._if (dut_if1));

//-----------------------------------------------------------------------------
// At start of simulation, set the interface handle as a config object in UVM 
// database. This IF handle can be retrieved in the test using the get() method
// run_test () accepts the test name as argument. In this case, base_test will
// be run for simulation
//-----------------------------------------------------------------------------
  initial begin
    uvm_config_db #(virtual dut_if)::set (null, "uvm_test_top", "dut_if", dut_if1);
    run_test ("base_test");
  end
endmodule