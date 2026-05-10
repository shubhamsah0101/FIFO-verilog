`timescale 1ns / 1ps

module tb_async_fifo_posedge;
    
    reg wclk, rclk;
    reg wrst_n, rrst_n;
    reg wr_en, rd_en;
    reg [7:0] wdata;
    wire [7:0] rdata;
    wire full, empty;
    
    // FIFO with DEPTH=8 (can store 8 items)
    async_fifo_posedge #(8,8) dut (
        .wclk(wclk), 
        .rclk(rclk), 
        .wrst_n(wrst_n), 
        .rrst_n(rrst_n),
        .wr_en(wr_en), 
        .rd_en(rd_en), 
        .wdata(wdata), 
        .rdata(rdata), 
        .full(full), 
        .empty(empty)
    );
    
    always #5 wclk = ~wclk;
    always #7 rclk = ~rclk;  // Different frequency for async test
    
    integer i;
    reg [7:0] test_data [0:7];
    reg all_pass;
    
    initial begin
        // Initialize
        wclk = 0; rclk = 0;
        wrst_n = 0; rrst_n = 0;
        wr_en = 0; rd_en = 0;
        all_pass = 1;
        
        // Test data: 8 values
        for (i = 0; i < 8; i = i + 1)
            test_data[i] = i + 1;  // 1,2,3,4,5,6,7,8
        
        // Reset sequence
        repeat(3) @(posedge wclk);
        wrst_n = 1;
        repeat(3) @(posedge rclk);
        rrst_n = 1;
        
        $display("\n========== WRITING 8 VALUES ==========");
        for (i = 0; i < 8; i = i + 1) begin
            @(posedge wclk);
            wr_en = 1;
            wdata = test_data[i];
            $display("WR[%0d]: data = %0d, full = %b", i, wdata, full);
            @(posedge wclk);
            wr_en = 0;
        end
        
        $display("\n========== READING 8 VALUES ==========");
        for (i = 0; i < 8; i = i + 1) begin
            @(posedge rclk);
            rd_en = 1;
            #1;  // Small delay for data to settle
            $display("RD[%0d]: data = %0d, expected = %0d, empty = %b", 
                     i, rdata, test_data[i], empty);
            
            if (rdata == test_data[i]) begin
                $display("CORRECT\n");
            end else begin
                $display("ERROR: Expected %0d, got %0d\n", test_data[i], rdata);
                all_pass = 0;
            end
            @(posedge rclk);
            rd_en = 0;
        end
        
        $display("\n========== TEST SUMMARY ==========");
        if (all_pass)
            $display("ALL TESTS PASSED!");
        else
            $display("TESTS FAILED!");
        
        $finish;
    end
    
endmodule