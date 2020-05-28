`include "uvm_macros.svh"

package test_pkg;
  import uvm_pkg::*;
  import my_pkg::*;

  class base_test extends uvm_test;
    `uvm_component_utils (base_test)

    my_env   m_top_env;

    function new (string name, uvm_component parent = null);
        super.new (name, parent);
    endfunction : new

    virtual function void build_phase (uvm_phase phase);
        super.build_phase (phase);
        m_top_env  = my_env::type_id::create ("m_top_env", this);
    endfunction : build_phase

    virtual function void end_of_elaboration_phase (uvm_phase phase);
        uvm_top.print_topology ();
    endfunction
  endclass
endpackage : test_pkg