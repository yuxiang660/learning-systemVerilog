interface my_if(input bit clk);
    logic pop;
    logic push;
    logic empty;
    logic full;
    endinterface
/*
Outputs:
# [0] push=0 full=1 pop=1 empty=1
# [FAIL] pop when fifo empty !
# [10] push=1 full=0 pop=1 empty=1
# [PASS] push when fifo not full
# [FAIL] pop when fifo empty !
# [30] push=1 full=1 pop=1 empty=0
# [FAIL] push when fifo full !
# [PASS] pop when fifo not empty
# [50] push=1 full=0 pop=0 empty=1
# [PASS] push when fifo not full
# [70] push=1 full=1 pop=0 empty=1
# [FAIL] push when fifo full !
# ** Note: $finish    : tb.sv(28)
#    Time: 100 ns  Iteration: 0  Instance: /tb
*/
module tb;
    bit clk;
    always #10 clk <= ~clk;

    my_if _if (clk);  
    my_des u0 (.*);

    initial begin
        for (int i = 0; i < 5; i++) begin
        _if.push  <= $random;
        _if.pop   <= $random;
        _if.empty <= $random;
        _if.full  <= $random;
        $strobe("[%0t] push=%0b full=%0b pop=%0b empty=%0b",
                $time, _if.push, _if.full, _if.pop, _if.empty);
        @(posedge clk);
        end
        #10 $finish;
    end
endmodule