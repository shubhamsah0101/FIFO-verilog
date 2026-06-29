`timescale 1ns / 1ps

package fifo_pkg;

    import uvm_pkg::*;
    `include "uvm_macros.svh"

    `include "fifo_transaction.sv"
    `include "fifo_sequence.sv"
    `include "fifo_sequencer.sv"
    `include "fifo_driver.sv"
    `include "fifo_test.sv"

endpackage