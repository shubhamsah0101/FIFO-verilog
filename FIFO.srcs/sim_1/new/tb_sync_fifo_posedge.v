`timescale 1ns / 1ps

//===================================================
// Enhanced Testbench for Positive Edge 8x8 FIFO
// Tests all 8 locations
//===================================================

module tb_sync_fifo_posedge;

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
        forever #5 clk = ~clk;
    end
    
    //===============================================
    // Instantiate FIFO
    //===============================================
    sync_fifo_posedge u_fifo (
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
    
    integer i;
    initial begin
        // Initialize
        wn = 0;
        rn = 0;
        data_in = 8'b00000000;
        
        // Display header
        $display("\n==========================================");
        $display("POSITIVE EDGE 8x8 SYNCHRONOUS FIFO TEST");
        $display("==========================================\n");
        
        // Apply reset
        reset = 1;
        #20;
        reset = 0;
        #10;
        
        //------------------------------------------------
        // TEST 1: Write 8 values to fill FIFO
        //------------------------------------------------
        $display("=== TEST 1: Writing 8 values (FIFO will become FULL) ===");
        
        wn = 1;
        for (i = 0; i < 8; i=i+1) begin
            data_in = i * 16 + i;  // 0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77
            #10;
            $display("  Write %0d: data_in=0x%02h, wptr=%0d, full=%b, empty=%b", 
                     i+1, data_in, u_fifo.wptr, full, empty);
        end
        
        // Verify FULL flag
        #10;
        $display("\n  After 8 writes: full=%b (should be 1), count=%0d", full, u_fifo.count);
        
        // Try to write 9th value (should be ignored)
        data_in = 8'hFF;
        #10;
        $display("  Attempt 9th write: full=%b (write ignored), count=%0d", full, u_fifo.count);
        
        wn = 0;
        #10;
        
        //------------------------------------------------
        // TEST 2: Read 8 values (FIFO will become EMPTY)
        //------------------------------------------------
        $display("\n=== TEST 2: Reading 8 values (FIFO will become EMPTY) ===");
        
        rn = 1;
        for (i = 0; i < 8; i=i+1) begin
            #10;
            $display("  Read %0d: data_out=0x%02h (expected=0x%02h), rptr=%0d, empty=%b", 
                     i+1, data_out, i*16+i, u_fifo.rptr, empty);
        end
        
        // Verify EMPTY flag
        #10;
        $display("\n  After 8 reads: empty=%b (should be 1), count=%0d", empty, u_fifo.count);
        
        // Try to read 9th value (should be ignored)
        #10;
        $display("  Attempt 9th read: empty=%b (read ignored), data_out=0x%02h", empty, data_out);
        
        rn = 0;
        #10;
        
        //------------------------------------------------
        // TEST 3: Write Partial, then Read Partial
        //------------------------------------------------
        $display("\n=== TEST 3: Write 5 values, then read 3 values ===");
        
        // Write 5 values
        wn = 1;
        for (i = 0; i < 5; i=i+1) begin
            data_in = 8'hA0 + i;  // 0xA0, 0xA1, 0xA2, 0xA3, 0xA4
            #10;
            $display("  Write %0d: data_in=0x%02h, count=%0d", i+1, data_in, u_fifo.count);
        end
        wn = 0;
        #10;
        
        // Read 3 values
        rn = 1;
        for (i = 0; i < 3; i=i+1) begin
            #10;
            $display("  Read %0d: data_out=0x%02h (expected=0x%02h), count=%0d", 
                     i+1, data_out, 8'hA0 + i, u_fifo.count);
        end
        rn = 0;
        #10;
        
        $display("\n  Remaining in FIFO: count=%0d (should be 2)", u_fifo.count);
        
        //------------------------------------------------
        // TEST 4: Simultaneous Read and Write
        //------------------------------------------------
        $display("\n=== TEST 4: Simultaneous Read and Write ===");
        
        wn = 1; rn = 1;
        data_in = 8'hBB;
        #10;
        $display("  Simultaneous: Wrote 0x%02h, Read 0x%02h, count=%0d (unchanged)", 
                 data_in, data_out, u_fifo.count);
        
        wn = 0; rn = 0;
        
        //------------------------------------------------
        // TEST 5: Fill and Empty with Wrap-around
        //------------------------------------------------
        $display("\n=== TEST 5: Fill and Empty (testing pointer wrap) ===");
        
        // Fill FIFO
        wn = 1;
        for (i = 0; i < 8; i=i+1) begin
            data_in = 8'h10 + i;
            #10;
        end
        wn = 0;
        $display("  FIFO FULL: full=%b, count=%0d, wptr=%0d, rptr=%0d", 
                 full, u_fifo.count, u_fifo.wptr, u_fifo.rptr);
        
        // Empty FIFO
        rn = 1;
        for (i = 0; i < 8; i=i+1) begin
            #10;
        end
        rn = 0;
        $display("  FIFO EMPTY: empty=%b, count=%0d, wptr=%0d, rptr=%0d", 
                 empty, u_fifo.count, u_fifo.wptr, u_fifo.rptr);
        
        //------------------------------------------------
        // TEST 6: Write after Empty (should work)
        //------------------------------------------------
        $display("\n=== TEST 6: Write after Empty ===");
        
        wn = 1;
        data_in = 8'h99;
        #10;
        $display("  Write after empty: data_in=0x%02h, empty became=%b, count=%0d", 
                 data_in, empty, u_fifo.count);
        wn = 0;
        
        $display("\n==========================================");
        $display("SIMULATION COMPLETED SUCCESSFULLY");
        $display("==========================================\n");
        
        #20;
        $finish;
    end
    
    //===============================================
    // Monitor
    //===============================================
    initial begin
        $monitor("Time=%0t | wn=%b rn=%b | count=%0d | empty=%b full=%b | data_out=0x%02h", 
                 $time, wn, rn, u_fifo.count, empty, full, data_out);
    end

endmodule