`timescale 1ns / 1ps

module tb_async_fifo_negedge;
    
    parameter DEPTH = 8;
    parameter WIDTH = 8;
 
    reg  wclk, rclk;
    reg  wrst_n, rrst_n;
    reg  wr_en, rd_en;
    reg  [WIDTH-1:0] wdata;
    wire [WIDTH-1:0] rdata;
    wire full, empty;
 
    integer errors = 0;
    integer i;
 
    // The 8 input values to write, in order
    reg [WIDTH-1:0] test_data [0:7];
 
    async_fifo_negedge #(.DEPTH(DEPTH), .WIDTH(WIDTH)) dut (
        .wclk(wclk), .rclk(rclk), .wrst_n(wrst_n), .rrst_n(rrst_n),
        .wr_en(wr_en), .rd_en(rd_en), .wdata(wdata),
        .rdata(rdata), .full(full), .empty(empty)
    );
 
    always #5 wclk = ~wclk;   // write clock: 100 MHz (negedge-triggered DUT)
    always #7 rclk = ~rclk;   // read clock: ~71.4 MHz (different domain)
 
    initial begin
        // 8 test values
        test_data[0] = 8'h11;
        test_data[1] = 8'h22;
        test_data[2] = 8'h33;
        test_data[3] = 8'h44;
        test_data[4] = 8'h55;
        test_data[5] = 8'h66;
        test_data[6] = 8'h77;
        test_data[7] = 8'h88;
 
        wclk = 0; rclk = 0;
        wrst_n = 0; rrst_n = 0;
        wr_en = 0; rd_en = 0;
        wdata = 0;
 
        repeat(3) @(negedge wclk); wrst_n = 1;
        repeat(3) @(negedge rclk); rrst_n = 1;
 
        // ---------------- WRITE 8 VALUES ----------------
        $display("=== Writing 8 values ===");
        for (i = 0; i < 8; i = i + 1) begin
            @(posedge wclk);
            wr_en = 1;
            wdata = test_data[i];
            @(posedge wclk);
            wr_en = 0;
            $display("Wrote: 0x%02h", test_data[i]);
        end
 
        if (!full)
            $display("NOTE: full flag not asserted after 8 writes (check DEPTH parameter)");
 
        // small gap to let write pointer settle/synchronize into read domain
        repeat(4) @(posedge rclk);
 
        // ---------------- READ 8 VALUES, SELF-CHECK ----------------
        $display("=== Reading 8 values and checking ===");
        for (i = 0; i < 8; i = i + 1) begin
            @(posedge rclk);
            rd_en = 1;
            @(posedge rclk);
            rd_en = 0;
            #1;
            if (rdata !== test_data[i]) begin
                $display("MISMATCH at read #%0d: expected=0x%02h got=0x%02h",
                          i, test_data[i], rdata);
                errors = errors + 1;
            end else begin
                $display("Read #%0d OK: 0x%02h", i, rdata);
            end
        end
 
        if (!empty)
            $display("NOTE: empty flag not asserted after reading all 8 values");
 
        $display("\n================= SUMMARY =================");
        if (errors == 0)
            $display("RESULT: ALL 8 VALUES MATCHED - TEST PASSED");
        else
            $display("RESULT: %0d MISMATCH(ES) FOUND - TEST FAILED", errors);
 
        $finish;
    end
    
endmodule