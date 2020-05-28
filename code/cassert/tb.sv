/*
Outputs:
# [10] a=0 b=0
# ** Error: Assertion error.
#    Time: 10 ns Started: 10 ns  Scope: tb File: tb.sv Line: 19
# [30] a=0 b=1
# ** Error: Assertion error.
#    Time: 30 ns Started: 30 ns  Scope: tb File: tb.sv Line: 19
# [50] a=1 b=1
# [70] a=1 b=1
# [90] a=1 b=0
# ** Error: Assertion error.
#    Time: 90 ns Started: 90 ns  Scope: tb File: tb.sv Line: 19
*/
module tb;
    bit a, b;
    bit clk;

    always #10 clk = ~clk;

    initial begin
        for (int i = 0; i < 10; i++) begin
            @(posedge clk);
            a <= $random;
            b <= $random;
            $display("[%0t] a=%0b b=%0b", $time, a, b);
        end
        #10 $finish;
    end

  // This assertion runs for entire duration of simulation
  // Ensure that both signals are high at posedge clk
  assert property (@(posedge clk) a & b);   

endmodule