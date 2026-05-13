`timescale 1ns / 1ps

module tb_async_fifo_negedge;
    
    reg wclk, rclk;
    reg wrst_n, rrst_n;
    reg wr_en, rd_en;
    reg [7:0] wdata;
    wire [7:0] rdata;
    wire full, empty;
    
    async_fifo_negedge #(8,8) dut (
        .wclk(wclk), .rclk(rclk), .wrst_n(wrst_n), .rrst_n(rrst_n),
        .wr_en(wr_en), .rd_en(rd_en), .wdata(wdata), 
        .rdata(rdata), .full(full), .empty(empty)
    );
    
    // Clocks: 33 MHz write, 25 MHz read
    initial begin
        wclk = 0;
        forever #15 wclk = ~wclk;
    end
    
    initial begin
        rclk = 0;
        forever #20 rclk = ~rclk;
    end
    
    integer i, errors;
    
    initial begin
        // Initialize
        wclk = 0; rclk = 0;
        wrst_n = 0; rrst_n = 0;
        wr_en = 0; rd_en = 0;
        errors = 0;
        
        // Reset sequence
        repeat(3) @(negedge wclk);
        wrst_n = 1;
        repeat(3) @(negedge rclk);
        rrst_n = 1;
        
        // Wait one cycle after reset
        @(negedge wclk);
        @(negedge rclk);
        
        //===========================================
        // WRITE 8 VALUES
        //===========================================
        $display("\n========== WRITING 8 VALUES ==========");
        for (i = 0; i < 8; i = i + 1) begin
            @(negedge wclk);
            wr_en = 1;
            wdata = i + 1;
            $display("WR[%0d]: data = %0d, full = %b", i, wdata, full);
            @(negedge wclk);
            wr_en = 0;
        end
        
        $display("\nWrite complete. full = %b\n", full);
        
        // Wait for synchronization
        repeat(5) @(negedge rclk);
        
        //===========================================
        // READ 8 VALUES
        //===========================================
        $display("========== READING 8 VALUES ==========");
        for (i = 0; i < 8; i = i + 1) begin
            @(negedge rclk);
            rd_en = 1;
            #1;
            $display("RD[%0d]: data = %0d, expected = %0d, empty = %b", 
                     i, rdata, i+1, empty);
            
            if (rdata == i+1) begin
                $display(">>> CORRECT\n");
            end else begin
                $display(">>> ERROR: Expected %0d, got %0d\n", i+1, rdata);
                errors = errors + 1;
            end
            @(negedge rclk);
            rd_en = 0;
        end
        
        // Final check
        repeat(2) @(negedge rclk);
        
        $display("\n==========================================");
        $display("TEST SUMMARY");
        $display("==========================================");
        $display("Errors: %0d", errors);
        $display("Final empty flag: %b", empty);
        
        if (errors == 0)
            $display("\n? ALL TESTS PASSED!");
        else
            $display("\n? TESTS FAILED!");
        
        $finish;
    end
    
endmodule