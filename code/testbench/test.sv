// The test can instantiate any environment. In this test, we are using
// an environment without the generator and hence the stimulus should be 
// written in the test. 
class test;
    env e0;
    mailbox drv_mbx;

    function new();
        drv_mbx = new();
        e0 = new();
    endfunction

    virtual task run();
        e0.d0.drv_mbx = drv_mbx;
        
        fork
            e0.run();
        join_none
        
        apply_stim();
    endtask

    virtual task apply_stim();
        reg_item item;
        
        $display ("T=%0t [Test] Starting stimulus ...", $time);
        item = new;
        item.randomize() with { addr == 8'haa; wr == 1; };
        drv_mbx.put(item);
        
        item = new;
        item.randomize() with { addr == 8'haa; wr == 0; };
        drv_mbx.put(item);
    endtask
    endclass

    // In this test, the original "apply_stim" method is overridden to
    // generate 20 randomized transactions
    class rand_test extends test;
    virtual task apply_stim();
        for (int i = 0; i < 20; i++) begin
        reg_item item = new;
        item.randomize();
        drv_mbx.put(item);
        end
    endtask
    endclass

    // This is a new test that instead instantiates an environment with a 
    // generator so that random stimulus is automatically applied instead 
    // of having to create an "apply_stim" task. Remember that this is a 
    // random environment and for more finer control, the above two tests
    // can be used.
    class new_test;
    env_w_gen e0;

    function new();
        e0 = new();
    endfunction

    virtual task run();    
        fork
            e0.run();
        join_none
    endtask
endclass