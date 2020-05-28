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
#    Time: 90 ns Started: 50 ns  Scope: tb File: tb.sv Line: 19
# [110] a=1 b=1
# [110] Assertion passed !
# [130] a=0 b=1
# ** Error: Assertion error.
#    Time: 130 ns Started: 130 ns  Scope: tb File: tb.sv Line: 19
# [130] Assertion passed !
# [150] a=1 b=0
# ** Error: Assertion error.
#    Time: 150 ns Started: 110 ns  Scope: tb File: tb.sv Line: 19
# [170] a=1 b=0
# [190] a=1 b=0
# ** Error: Assertion error.
#    Time: 190 ns Started: 150 ns  Scope: tb File: tb.sv Line: 19
*/
module tb;
    bit a, b;
    bit clk;
   
    // This is a sequence that says 'b' should be high 2 clocks after
    // 'a' is found high. The sequence is checked on every positive
    // edge of the clock which ultimately ends up having multiple 
    // assertions running in parallel since they all span for more
    // than a single clock cycle.
    sequence s_ab;
      @(posedge clk) a ##2 b;
    endsequence
   
    // Print a display statement if the assertion passed
    assert property(s_ab) 
      $display ("[%0t] Assertion passed !", $time);
   
    always #10 clk = ~clk;
   
    initial begin
      for (int i = 0; i < 10; i++) begin
        @(posedge clk);
        a <= $random;
        b <= $random;                    
   
        $display("[%0t] a=%b b=%b", $time, a, b);
      end
   
      #20 $finish;
    end
endmodule