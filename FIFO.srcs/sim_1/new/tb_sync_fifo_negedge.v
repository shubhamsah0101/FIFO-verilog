`timescale 1ns / 1ps

//===================================================
// Testbench for Negative Edge Synchronous FIFO
//===================================================

module tb_sync_fifo_negedge;

    //===============================================
    // Signals
    //===============================================
    reg         clk;
    reg         reset;
    reg         wn;
    reg         rn;
    reg  [7:0]  data_in;
    wire [7:0]  data_out;
    wire        full;
    wire        empty;
    
    //===============================================
    // Clock Generation (10ns period = 100MHz)
    //===============================================
    initial begin
        clk = 0;
        forever #5 clk = ~clk;    // Toggle every 5ns -> 10ns period
    end
    
    //===============================================
    // Instantiate FIFO (negative edge)
    //===============================================
    sync_fifo_negedge u_fifo (
        .clk(clk),
        .reset(reset),
        .wn(wn),
        .rn(rn),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );
    
    //===============================================
    // Test Stimulus
    //===============================================
    initial begin
        // Initialize
        wn = 0;
        rn = 0;
        data_in = 8'b00000000;
        
        // Reset
        reset = 1;
        #20;
        reset = 0;
        #10;
        
        //------------------------------------------------
        // TEST: Write then Read (same as positive edge)
        //------------------------------------------------
        $display("\n=== Negative Edge FIFO Test ===");
        
        // Write 3 values
        wn = 1;  data_in = 8'h11;  #10;
        $display("Wrote: 0x%h (falling edge)", data_in);
        
        wn = 1;  data_in = 8'h22;  #10;
        $display("Wrote: 0x%h (falling edge)", data_in);
        
        wn = 1;  data_in = 8'h33;  #10;
        $display("Wrote: 0x%h (falling edge)", data_in);
        
        wn = 0;  #10;
        
        // Read 3 values
        rn = 1;  #10;
        $display("Read: 0x%h at falling edge", data_out);
        
        rn = 1;  #10;
        $display("Read: 0x%h at falling edge", data_out);
        
        rn = 1;  #10;
        $display("Read: 0x%h at falling edge", data_out);
        
        rn = 0;
        
        $display("\n=== Negative Edge Simulation Complete ===");
        #20;
        $finish;
    end

endmodule