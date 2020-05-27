/*
Outputs:
[0] Trying to get a room for id[1] ...
[0] Room Key retrieved for id[1]
[5] Trying to get a room for id[2] ...
[20] Leaving room id[1] ...
[20] Room Key put back id[1]
[20] Room Key retrieved for id[2]
[25] Trying to get a room for id[1] ...
[30] Leaving room id[2] ...
[30] Room Key put back id[2]
[30] Room Key retrieved for id[1]
[50] Leaving room id[1] ...
[50] Room Key put back id[1]
*/

module tb;
    semaphore key;         // Create a semaphore handle called "key"

    initial begin 
        key = new (1);       // Create only a single key; multiple keys are also possible
        fork
            personA ();       // personA tries to get the room and puts it back after work
            personB ();       // personB also tries to get the room and puts it back after work
            #25 personA ();     // personA tries to get the room a second time
        join_none
    end

    task getRoom (bit [1:0] id);
        begin
            $display ("[%0t] Trying to get a room for id[%0d] ...", $time, id);
            key.get (1);
            $display ("[%0t] Room Key retrieved for id[%0d]", $time, id);
        end
    endtask

    task putRoom (bit [1:0] id);
        begin
            $display ("[%0t] Leaving room id[%0d] ...", $time, id);
            key.put (1);
            $display ("[%0t] Room Key put back id[%0d]", $time, id);
        end
    endtask

    // This person tries to get the room immediately and puts 
    // it back 20 time units later
    task personA ();       
        getRoom (1);
        #20 putRoom (1);
    endtask

    // This person tries to get the room after 5 time units and puts it back after
    // 10 time units
    task personB ();
        #5  getRoom (2);
        #10 putRoom (2);
    endtask
endmodule