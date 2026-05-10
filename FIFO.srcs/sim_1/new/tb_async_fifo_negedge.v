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
    
    always #12.5 wclk = ~wclk;   // 40 MHz
    always #20.0 rclk = ~rclk;   // 25 MHz
    
    integer i;
    reg [7:0] test_data [0:7];
    reg all_pass;
    
    initial begin
        wclk = 0; rclk = 0;
        wrst_n = 0; rrst_n = 0;
        wr_en = 0; rd_en = 0;
        all_pass = 1;
        
        for (i = 0; i < 8; i = i + 1)
            test_data[i] = i + 1;
        
        // Reset
        repeat(3) @(negedge wclk);
        wrst_n = 1;
        repeat(3) @(negedge rclk);
        rrst_n = 1;
        
        // Write 8 values
        $display("\n========== WRITING 8 VALUES (NEGEDGE) ==========");
        for (i = 0; i < 8; i = i + 1) begin
            @(negedge wclk);
            wr_en = 1;
            wdata = test_data[i];
            $display("WR[%0d]: data = %0d, full = %b", i, wdata, full);
            @(negedge wclk);
            wr_en = 0;
        end
        
        $display("\nWrite complete. Waiting for synchronization...");
        repeat(10) @(negedge rclk);  // Wait longer
        
        // Read 8 values
        $display("\n========== READING 8 VALUES (NEGEDGE) ==========");
        for (i = 0; i < 8; i = i + 1) begin
            @(negedge rclk);
            rd_en = 1;
            #2;
            $display("RD[%0d]: data = %0d, expected = %0d, empty = %b", 
                     i, rdata, test_data[i], empty);
            
            if (rdata == test_data[i]) begin
                $display(">>> CORRECT\n");
            end else begin
                $display(">>> ERROR: Expected %0d, got %0d\n", test_data[i], rdata);
                all_pass = 0;
            end
            @(negedge rclk);
            rd_en = 0;
        end
        
        // Wait for empty flag to update
        repeat(2) @(negedge rclk);
        #2;
        
        $display("\n========== TEST SUMMARY ==========");
        $display("Total writes: 8");
        $display("Total reads completed: %0d", i);
        $display("Final empty flag: %b", empty);
        
        if (all_pass && empty == 1)
            $display("\n? ALL TESTS PASSED!");
        else if (all_pass)
            $display("\n?? DATA CORRECT but empty flag = %b", empty);
        else
            $display("\n? TESTS FAILED!");
        
        #100;
        $finish;
    end
    
endmodule