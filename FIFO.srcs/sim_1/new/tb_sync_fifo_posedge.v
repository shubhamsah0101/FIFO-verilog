`timescale 1ns / 1ps

`timescale 1ns / 1ps

module tb_sync_fifo_posedge;

    reg         clk;
    reg         reset;
    reg         wn;
    reg         rn;
    reg  [7:0]  data_in;
    wire [7:0]  data_out;
    wire        full;
    wire        empty;
    
    // Clock (100MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Instantiate FIFO
    sync_fifo_posedge u_fifo (
        .clk(clk), .reset(reset), .wn(wn), .rn(rn),
        .data_in(data_in), .data_out(data_out),
        .full(full), .empty(empty)
    );
    
    // Test
    integer i;
    initial begin
        $display("\n==========================================");
        $display("POSITIVE EDGE 8x8 SYNCHRONOUS FIFO TEST");
        $display("==========================================\n");
        
        // Reset
        wn = 0; rn = 0;
        reset = 1;
        repeat(2) @(posedge clk);
        reset = 0;
        
        // Write 8 values
        $display("--- Writing 8 values ---");
        wn = 1;
        for (i = 0; i < 8; i = i + 1) begin
            @(posedge clk);
            data_in = i * 16 + i;
            $display("  Write[%0d] = 0x%02h | count=%0d | full=%b", 
                     i, data_in, u_fifo.count, full);
        end
        wn = 0;
        
        // Read 8 values
        $display("\n--- Reading 8 values ---");
        rn = 1;
        for (i = 0; i < 8; i = i + 1) begin
            @(posedge clk);
            $display("  Read[%0d] = 0x%02h | expected=0x%02h | count=%0d | empty=%b", 
                     i, data_out, i*16+i, u_fifo.count, empty);
        end
        rn = 0;
        
        // Final check
        @(posedge clk);
        if (u_fifo.count == 0 && empty == 1)
            $display("\nTEST PASSED: FIFO correctly emptied");
        else
            $display("\nTEST FAILED: FIFO state incorrect");
        
        $display("\n==========================================");
        $finish;
    end

endmodule