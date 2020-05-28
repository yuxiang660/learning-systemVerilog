`include "uvm_macros.svh"
 
package my_pkg;
  // If you don't use this, it'll complain that it doesn't recognize uvm components
  import uvm_pkg::*;

//---------------------------------------------------------------------------------------------------------------------
//                                                 my_monitor {{{1
//---------------------------------------------------------------------------------------------------------------------

  class my_monitor extends uvm_monitor ;

    `uvm_component_utils (my_monitor)

    function new (string name, uvm_component parent);
        super.new (name, parent);
    endfunction : new

    function void build_phase (uvm_phase phase);
        super.build_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Build Phase"), UVM_MEDIUM)
    endfunction 

    function void connect_phase (uvm_phase phase);
        super.connect_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Connect Phase"), UVM_MEDIUM)
    endfunction

    function void end_of_elaboration_phase (uvm_phase phase);
        super.end_of_elaboration_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("End Of Elaboration Phase"), UVM_MEDIUM)
    endfunction

    function void start_of_simulation_phase (uvm_phase phase);
        super.start_of_simulation_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Start Of Simulation Phase"), UVM_MEDIUM)
    endfunction

    task run_phase (uvm_phase phase);
        super.run_phase (phase);
        #400;
        `uvm_info (get_type_name (), $sformatf ("Run Phase waited for 400ns"), UVM_MEDIUM)
    endtask

    task reset_phase (uvm_phase phase);
        super.reset_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Reset Phase"), UVM_MEDIUM)
    endtask

    task configure_phase (uvm_phase phase);
        super.configure_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Configure Phase"), UVM_MEDIUM)
    endtask

    task main_phase (uvm_phase phase);
        super.main_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Main Phase"), UVM_MEDIUM)
    endtask

    task shutdown_phase (uvm_phase phase);
        super.shutdown_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Shutdown Phase"), UVM_MEDIUM)
    endtask

    function void extract_phase (uvm_phase phase);
        super.extract_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Extract Phase"), UVM_MEDIUM)
    endfunction

    function void check_phase (uvm_phase phase);
        super.check_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Check Phase"), UVM_MEDIUM)
    endfunction

    function void final_phase (uvm_phase phase);
        super.final_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Final Phase"), UVM_MEDIUM)
    endfunction

  endclass

//---------------------------------------------------------------------------------------------------------------------
//                                                 my_driver  {{{1
//---------------------------------------------------------------------------------------------------------------------

  class my_driver extends uvm_driver ;

    `uvm_component_utils (my_driver)

    function new (string name, uvm_component parent);
        super.new (name, parent);
    endfunction : new

    function void build_phase (uvm_phase phase);
        super.build_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Build Phase"), UVM_MEDIUM)
    endfunction 

    function void connect_phase (uvm_phase phase);
        super.connect_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Connect Phase"), UVM_MEDIUM)
    endfunction

    function void end_of_elaboration_phase (uvm_phase phase);
        super.end_of_elaboration_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("End Of Elaboration Phase"), UVM_MEDIUM)
    endfunction

    function void start_of_simulation_phase (uvm_phase phase);
        super.start_of_simulation_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Start Of Simulation Phase"), UVM_MEDIUM)
    endfunction

    task run_phase (uvm_phase phase);
        super.run_phase (phase);
        phase.raise_objection (this);
        #200;
        `uvm_info (get_type_name (), $sformatf ("Run Phase - wait for 200ns"), UVM_MEDIUM)
        phase.drop_objection (this);
    endtask

    task reset_phase (uvm_phase phase);
        super.reset_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Reset Phase"), UVM_MEDIUM)
    endtask

    task configure_phase (uvm_phase phase);
        super.configure_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Configure Phase"), UVM_MEDIUM)
    endtask

    task main_phase (uvm_phase phase);
        super.main_phase (phase);
        phase.raise_objection (this);
        #500;
        `uvm_info (get_type_name (), $sformatf ("Main Phase - wait for 500ns"), UVM_MEDIUM)
        phase.drop_objection (this);
    endtask

    task shutdown_phase (uvm_phase phase);
        super.shutdown_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Shutdown Phase"), UVM_MEDIUM)
    endtask

    function void extract_phase (uvm_phase phase);
        super.extract_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Extract Phase"), UVM_MEDIUM)
    endfunction

    function void check_phase (uvm_phase phase);
        super.check_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Check Phase"), UVM_MEDIUM)
    endfunction

    function void final_phase (uvm_phase phase);
        super.final_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Final Phase"), UVM_MEDIUM)
    endfunction

  endclass

//---------------------------------------------------------------------------------------------------------------------
//                                                 my_env {{{1 
//---------------------------------------------------------------------------------------------------------------------

  class my_env extends uvm_env ;

    `uvm_component_utils (my_env)

    my_driver      m_drv0;
    my_monitor     m_mon0;

    function new (string name, uvm_component parent);
        super.new (name, parent);
    endfunction : new

    function void build_phase (uvm_phase phase);
        super.build_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Build Phase"), UVM_MEDIUM)
        m_drv0 = my_driver::type_id::create ("m_drv0", this);
        m_mon0 = my_monitor::type_id::create ("m_mon0", this);
    endfunction 

    function void connect_phase (uvm_phase phase);
        super.connect_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Connect Phase"), UVM_MEDIUM)
    endfunction

    function void end_of_elaboration_phase (uvm_phase phase);
        super.end_of_elaboration_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("End Of Elaboration Phase"), UVM_MEDIUM)
    endfunction

    function void start_of_simulation_phase (uvm_phase phase);
        super.start_of_simulation_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Start Of Simulation Phase"), UVM_MEDIUM)
    endfunction

    task run_phase (uvm_phase phase);
        super.run_phase (phase);
        phase.raise_objection (this);
        #100;
        `uvm_info (get_type_name (), $sformatf ("Run Phase - waited for #100ns"), UVM_MEDIUM)
        phase.drop_objection (this);
    endtask

    task reset_phase (uvm_phase phase);
        super.reset_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Reset Phase"), UVM_MEDIUM)
    endtask

    task configure_phase (uvm_phase phase);
        super.configure_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Configure Phase"), UVM_MEDIUM)
    endtask

    task main_phase (uvm_phase phase);
        super.main_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Main Phase"), UVM_MEDIUM)
    endtask

    task shutdown_phase (uvm_phase phase);
        super.shutdown_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Shutdown Phase"), UVM_MEDIUM)
    endtask

    function void extract_phase (uvm_phase phase);
        super.extract_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Extract Phase"), UVM_MEDIUM)
    endfunction

    function void check_phase (uvm_phase phase);
        super.check_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Check Phase"), UVM_MEDIUM)
    endfunction

    function void final_phase (uvm_phase phase);
        super.final_phase (phase);
        `uvm_info (get_type_name (), $sformatf ("Final Phase"), UVM_MEDIUM)
    endfunction

  endclass : my_env


endpackage