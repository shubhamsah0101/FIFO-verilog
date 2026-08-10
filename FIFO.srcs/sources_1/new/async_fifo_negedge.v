`timescale 1ns / 1ps

module async_fifo_negedge #(
    parameter DEPTH = 8,
    parameter WIDTH = 8
)(
    input  wire              wclk,
    input  wire              rclk,
    input  wire              wrst_n,
    input  wire              rrst_n,
    input  wire              wr_en,
    input  wire              rd_en,
    input  wire [WIDTH-1:0]  wdata,
    output reg  [WIDTH-1:0]  rdata,
    output reg               full,
    output reg               empty
);

    localparam ADDR_WIDTH = $clog2(DEPTH);
    localparam PTR_WIDTH  = ADDR_WIDTH + 1;

    reg [WIDTH-1:0] mem [0:DEPTH-1];

    // Binary pointers (used for memory addressing)
    reg [PTR_WIDTH-1:0] wptr_bin, rptr_bin;
    reg [PTR_WIDTH-1:0] wptr_bin_next, rptr_bin_next;

    // Gray-coded pointers (used for CDC)
    reg [PTR_WIDTH-1:0] wptr_gray, rptr_gray;
    reg [PTR_WIDTH-1:0] wptr_gray_next, rptr_gray_next;

    // 2-stage synchronizers
    reg [PTR_WIDTH-1:0] rptr_gray_sync1, rptr_gray_sync2; // read ptr synced into write domain
    reg [PTR_WIDTH-1:0] wptr_gray_sync1, wptr_gray_sync2; // write ptr synced into read domain

    //-----------------------------------------------------------------
    // WRITE DOMAIN
    //-----------------------------------------------------------------
    always @(*) begin
        wptr_bin_next  = wptr_bin + (wr_en && !full);
        wptr_gray_next = (wptr_bin_next >> 1) ^ wptr_bin_next; // bin2gray
    end

    always @(negedge wclk or negedge wrst_n) begin
        if (!wrst_n) begin
            wptr_bin  <= 0;
            wptr_gray <= 0;
        end else begin
            if (wr_en && !full)
                mem[wptr_bin[ADDR_WIDTH-1:0]] <= wdata;
            wptr_bin  <= wptr_bin_next;
            wptr_gray <= wptr_gray_next;
        end
    end

    // Synchronize read pointer (Gray) into write clock domain
    always @(negedge wclk or negedge wrst_n) begin
        if (!wrst_n) begin
            rptr_gray_sync1 <= 0;
            rptr_gray_sync2 <= 0;
        end else begin
            rptr_gray_sync1 <= rptr_gray;
            rptr_gray_sync2 <= rptr_gray_sync1;
        end
    end

    // Standard Gray-code full detection: write ptr equals read ptr
    // with the two MSBs inverted (wrap-around vs. same-lap case)
    always @(negedge wclk or negedge wrst_n) begin
        if (!wrst_n)
            full <= 0;
        else
            full <= (wptr_gray_next == {~rptr_gray_sync2[PTR_WIDTH-1:PTR_WIDTH-2],
                                          rptr_gray_sync2[PTR_WIDTH-3:0]});
    end

    //-----------------------------------------------------------------
    // READ DOMAIN
    //-----------------------------------------------------------------
    always @(*) begin
        rptr_bin_next  = rptr_bin + (rd_en && !empty);
        rptr_gray_next = (rptr_bin_next >> 1) ^ rptr_bin_next; // bin2gray
    end

    always @(negedge rclk or negedge rrst_n) begin
        if (!rrst_n) begin
            rptr_bin  <= 0;
            rptr_gray <= 0;
            rdata     <= 0;
        end else begin
            if (rd_en && !empty)
                rdata <= mem[rptr_bin[ADDR_WIDTH-1:0]];
            rptr_bin  <= rptr_bin_next;
            rptr_gray <= rptr_gray_next;
        end
    end

    // Synchronize write pointer (Gray) into read clock domain
    always @(negedge rclk or negedge rrst_n) begin
        if (!rrst_n) begin
            wptr_gray_sync1 <= 0;
            wptr_gray_sync2 <= 0;
        end else begin
            wptr_gray_sync1 <= wptr_gray;
            wptr_gray_sync2 <= wptr_gray_sync1;
        end
    end

    // Empty detection: read ptr equals synchronized write ptr (Gray)
    always @(negedge rclk or negedge rrst_n) begin
        if (!rrst_n)
            empty <= 1;
        else
            empty <= (rptr_gray_next == wptr_gray_sync2);
    end

endmodule