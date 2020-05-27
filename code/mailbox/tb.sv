/*
Outputs:
[1] Thread0: Put item #0, size=1
[2] Thread1:   Got item #0, size=0
[2] Thread0: Put item #1, size=1
[3] Thread0: Put item #2, size=2
[4] Thread1:   Got item #1, size=1
[4] Thread0: Put item #3, size=2
[6] Thread1:   Got item #2, size=2
[6] Thread0: Put item #4, size=2
[8] Thread1:   Got item #3, size=1
[10] Thread1:   Got item #4, size=0
ncsim: *W,RNQUIE: Simulation is complete.
*/

module tb;
    // Create a new mailbox that can hold utmost 2 items
    mailbox   mbx = new(2);

    // Block1: This block keeps putting items into the mailbox
    // The rate of items being put into the mailbox is 1 every ns
    initial begin
    for (int i=0; i < 5; i++) begin
        #1 mbx.put (i);
        $display ("[%0t] Thread0: Put item #%0d, size=%0d", $time, i, mbx.num());
        end
    end

    // Block2: This block keeps getting items from the mailbox
    // The rate of items received from the mailbox is 2 every ns
    initial begin
        forever begin
        int idx;
        #2 mbx.get (idx);
                $display ("[%0t] Thread1: Got item #%0d, size=%0d", $time, idx, mbx.num());
        end
    end
endmodule