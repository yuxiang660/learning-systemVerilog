`include "timescale.v"

module dut (   
  input    clk,                 // Clock at some freq
  input    rstn,                // Active Low  Sync Reset
  input    wr,                  // Active High Write
  input    en,                  // Module Enable
  input    wdata,               // Write Data
  input    addr,                // Address

  output   rdata                // Read Data
);
// Empty module
endmodule

module dut_wrapper (dut_if _if);
  // Instantiate the design module and connect interface signals to DUT
  dut dsn0     (  .clk     (_if.clk),
                    .rstn    (_if.rstn),
                    .wr      (_if.wr),
                    .en      (_if.en),
                    .wdata   (_if.wdata),
                    .addr    (_if.addr),
                    .rdata   (_if.rdata));
endmodule
