`timescale 1ns / 1ps

module tb_sync_fifo_negedge;

    reg         clk;
    reg         rst;
    reg         wr_en;
    reg         rd_en;
    reg  [7:0]  data_in;

    wire [7:0]  data_out;
    wire        full;
    wire        empty;

    // ============================================
    // DUT
    // ============================================
    sync_fifo_negedge #(
        .DWIDTH(8),
        .MWIDTH(8)
    ) dut (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

    // ============================================
    // Clock Generation
    // ============================================
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    integer i;

    initial begin

        $display("\n======================================");
        $display(" NEGATIVE EDGE SYNCHRONOUS FIFO TEST ");
        $display("======================================");

        // ========================================
        // Reset
        // ========================================
        rst     = 1;
        wr_en   = 0;
        rd_en   = 0;
        data_in = 0;
        
        repeat(2) @(negedge clk);
        
        #1;
        
        rst = 0;
        
        repeat(1) @(negedge clk);
        
        #1;
        
        $display("\nReset Completed");
        $display("full=%b empty=%b", full, empty);

        // ========================================
        // WRITE DATA
        // ========================================
        $display("\n--- Writing Data ---");

        for (i = 0; i < 8; i = i + 1) begin

            @(negedge clk);

            wr_en   = 1;
            rd_en   = 0;
            data_in = i + 8'h20;

            #1;

            $display("WRITE : %0d -> data = 0x%02h | full=%b empty=%b",
                     i, data_in, full, empty);
        end

        @(negedge clk);

        wr_en = 0;

        #1;

        $display("\nAfter Write:");
        $display("full=%b empty=%b", full, empty);

        // ========================================
        // READ DATA
        // ========================================
        $display("\n--- Reading Data ---");
        
        rd_en = 1;
        
        for (i = 0; i < 8; i = i + 1) begin
        
            @(negedge clk);
        
            #1;
        
            $display("READ  : %0d -> data = 0x%02h | full=%b empty=%b",
                     i, data_out, full, empty);
        end
        
        rd_en = 0;

        #1;

        $display("\nFinal Status:");
        $display("full=%b empty=%b", full, empty);

        if (empty)
            $display("\nTEST PASSED");
        else
            $display("\nTEST FAILED");

        $display("\n======================================");

        $finish;
    end

endmodule