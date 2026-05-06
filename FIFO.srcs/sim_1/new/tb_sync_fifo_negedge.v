`timescale 1ns / 1ps

module tb_sync_fifo_negedge;

    reg         clk;
    reg         reset;
    reg         wn;
    reg         rn;
    reg  [7:0]  data_in;
    wire [7:0]  data_out;
    wire        full;
    wire        empty;
    
    // Clock (80 MHz for negedge timing)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Instantiate (change module name to negedge version)
    sync_fifo_negedge u_fifo (
        .clk(clk), .reset(reset), .wn(wn), .rn(rn),
        .data_in(data_in), .data_out(data_out),
        .full(full), .empty(empty)
    );
    
    // Test
    integer i;
    initial begin
        $display("\n==========================================");
        $display("VERIFICATION - 8x8 SYNCHRONOUS FIFO (NEGEDGE)");
        $display("==========================================\n");
        
        // Reset
        wn = 0; rn = 0;
        reset = 1;
        #20;
        reset = 0;
        #10;
        
        // Write 8 values
        $display("--- Writing 8 values ---");
        wn = 1;
        for (i = 0; i < 8; i=i+1) begin
            data_in = i * 16 + i;
            #10;
            $display("  Write[%0d] = 0x%02h | count=%0d | full=%b", 
                     i, data_in, u_fifo.count, full);
        end
        wn = 0;
        #10;
        $display("  Result: full=%b, count=%0d\n", full, u_fifo.count);
        
        // Read 8 values
        $display("--- Reading 8 values ---");
        rn = 1;
        for (i = 0; i < 8; i=i+1) begin
            #10;
            $display("  Read[%0d] = 0x%02h | expected=0x%02h | count=%0d | empty=%b", 
                     i, data_out, i*16+i, u_fifo.count, empty);
        end
        rn = 0;
        #10;
        $display("  Result: empty=%b, count=%0d\n", empty, u_fifo.count);
        
        // Final check
        if (u_fifo.count == 0 && empty == 1)
            $display("TEST PASSED: FIFO correctly emptied");
        else
            $display("TEST FAILED: FIFO state incorrect");
        
        $display("\n==========================================");
        $finish;
    end

endmodule