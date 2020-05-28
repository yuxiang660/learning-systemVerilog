module my_des (my_if _if);
    always @ (posedge _if.clk) begin
        if (_if.push) begin
        // Immediate assertion and ensures that
        // fifo is not full when push is 1
        a_push: assert (!_if.full) begin
            $display("[PASS] push when fifo not full");
        end else begin
            $display("[FAIL] push when fifo full !");
        end
        end

        if (_if.pop) begin
        // Immediate assertion to ensure that fifo is not 
        // empty when pop is 1
        a_pop: assert (!_if.empty) begin
            $display ("[PASS] pop when fifo not empty");
        end else begin
            $display ("[FAIL] pop when fifo empty !");
        end
        end
    end
endmodule