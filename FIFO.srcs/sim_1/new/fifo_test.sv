`timescale 1ns / 1ps

class fifo_test extends uvm_test;

    `uvm_component_utils(fifo_test)

    fifo_driver drv;
    fifo_sequencer seqr;

    function new(string name,
                 uvm_component parent);

        super.new(name,parent);

    endfunction

    function void build_phase(
            uvm_phase phase);

        drv  =
        fifo_driver::type_id::create(
            "drv",this);

        seqr =
        fifo_sequencer::type_id::create(
            "seqr",this);

    endfunction

    function void connect_phase(
            uvm_phase phase);

        drv.seq_item_port.connect(
            seqr.seq_item_export);

    endfunction

    task run_phase(uvm_phase phase);

        fifo_sequence seq;

        phase.raise_objection(this);

        seq =
        fifo_sequence::type_id::create(
            "seq");

        seq.start(seqr);

        #100;

        phase.drop_objection(this);

    endtask

endclass