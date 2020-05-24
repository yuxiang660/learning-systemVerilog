module tb;
    reg clk;
    reg sig;
   
    // Process starts at time 0ns and loops after every 5ns
    always #5 clk = ~clk;   
   
    // Process starts at time 0ns
    initial begin            
      // This system task will print out the signal values everytime they change
      $monitor("Time = %0t clk = %0d sig = %0d", $time, clk, sig);
      
      // Also called stimulus, we simply assign different values to the variables
      // after some simulation "delay"
      sig = 0;
      #5 clk = 0;        // Assign clk to 0 at time 5ns
      #15  sig = 1;      // Assign sig to 1 at time 20ns (#5 + #15)
      #20  sig = 0;      // Assign sig to 0 at time 40ns (#5 + #15 + #20)
      #15  sig = 1;      // Assign sig to 1 at time 55ns (#5 + #15 + #20 + #15)
      #10  sig = 0;      // Assign sig to 0 at time 65ns (#5 + #15 + #20 + #15 + #10)
      #20 $finish;       // Finish simulation at time 85ns
    end
endmodule