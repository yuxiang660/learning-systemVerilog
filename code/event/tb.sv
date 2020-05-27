/*
Outputs:
# [0] Thread2: waiting for trigger 
# [0] Thread3: waiting for trigger 
# [20] Thread1: triggered event_a
# [20] Thread3: received event_a trigger
# [20] Thread2: received event_a trigger 
*/

module tb;
    // Create an event variable that processes can use to trigger and wait
    event event_a;

    // Thread1: Triggers the event using "->" operator
    initial begin
        #20 ->event_a;
        $display ("[%0t] Thread1: triggered event_a", $time);
    end

    // Thread2: Waits for the event using "@" operator
    initial begin
        $display ("[%0t] Thread2: waiting for trigger ", $time);
        @(event_a);
        $display ("[%0t] Thread2: received event_a trigger ", $time);
    end

    // Thread3: Waits for the event using ".triggered"
    initial begin
        $display ("[%0t] Thread3: waiting for trigger ", $time);
        wait(event_a.triggered);
        $display ("[%0t] Thread3: received event_a trigger", $time);
    end
endmodule  