`include "uvm_macros.svh"

package test_pkg;
  import uvm_pkg::*;
  import my_pkg::*;

  //---------------------------------------------------------------------------------------------------------------------
  //                                                 base_test   {{{1
  //---------------------------------------------------------------------------------------------------------------------

  class base_test extends uvm_test;

    `uvm_component_utils (base_test)

    my_env   m_top_env;
    virtual  dut_if dut_vi;

    function new (string name, uvm_component parent = null);
        super.new (name, parent);
    endfunction : new

    virtual function void build_phase (uvm_phase phase);
        super.build_phase (phase);

        // Instead of using new to creat my_env, type_id::create is the preferred way because it uses factory methods
        m_top_env  = my_env::type_id::create ("m_top_env", this);

        // setting and retrieving variable values in UVM
        // get the dut_if object form the database
        if (! uvm_config_db #(virtual dut_if) :: get (this, "", "dut_if", dut_vi)) begin
          `uvm_error (get_type_name (), "DUT Interface not found !")
        end
        else
          `uvm_info (get_type_name (), "DUT Interface is found !", UVM_LOW)
    endfunction : build_phase

    virtual function void end_of_elaboration_phase (uvm_phase phase);
        `uvm_info (get_type_name (), "end_of_elaboration_phase", UVM_LOW)
        uvm_top.print_topology ();
    endfunction

    function void start_of_simulation_phase (uvm_phase phase);
        `uvm_info (get_type_name (), "start_of_simulation_phase", UVM_LOW)
        super.start_of_simulation_phase (phase);
    endfunction

  endclass 

  //---------------------------------------------------------------------------------------------------------------------
  //                                                 reg_test   {{{1
  //---------------------------------------------------------------------------------------------------------------------

  class reg_test extends base_test;
    `uvm_component_utils (reg_test)

    function new (string name, uvm_component parent = null);
        super.new (name, parent);
    endfunction

    // Enter your test for register access here
  endclass

  //---------------------------------------------------------------------------------------------------------------------
  //                                                 feature_test   {{{1
  //---------------------------------------------------------------------------------------------------------------------

  class feature_test extends base_test;
    `uvm_component_utils (feature_test)

    function new (string name, uvm_component parent = null);
        super.new (name, parent);
    endfunction 
    // Enter test code for feature here
  endclass

endpackage : test_pkg