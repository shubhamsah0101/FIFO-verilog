`timescale 1ns / 1ps

module async_fifo_negedge #(
    parameter DEPTH = 8,
    parameter WIDTH = 8
)(
    input wire wclk, rclk,
    input wire wrst_n, rrst_n,
    input wire wr_en, rd_en,
    input wire [WIDTH-1:0] wdata,
    output reg [WIDTH-1:0] rdata,
    output reg full, empty
);

    localparam ADDR_WIDTH = $clog2(DEPTH);  // 3 bits for 8 depth
    localparam PTR_WIDTH = ADDR_WIDTH + 1;  // 4 bits (extra for wrap)
    
    reg [WIDTH-1:0] mem [0:DEPTH-1];
    reg [PTR_WIDTH-1:0] wptr, rptr;
    wire [PTR_WIDTH-1:0] wptr_sync, rptr_sync;  // Changed to wire
    reg [PTR_WIDTH-1:0] wptr_sync1, wptr_sync2;
    reg [PTR_WIDTH-1:0] rptr_sync1, rptr_sync2;
    
    integer i;
    
    //===============================================
    // WRITE LOGIC (Negative Edge)
    //===============================================
    always @(negedge wclk or negedge wrst_n) begin
        if (!wrst_n) begin
            wptr <= 0;
            full <= 0;
            for (i = 0; i < DEPTH; i = i + 1)
                mem[i] <= 0;
        end else if (wr_en && !full) begin
            mem[wptr[ADDR_WIDTH-1:0]] <= wdata;
            wptr <= wptr + 1;
        end
    end
    
    //===============================================
    // READ LOGIC (Negative Edge)
    //===============================================
    always @(negedge rclk or negedge rrst_n) begin
        if (!rrst_n) begin
            rptr <= 0;
            rdata <= 0;
            empty <= 1;
        end else if (rd_en && !empty) begin
            rdata <= mem[rptr[ADDR_WIDTH-1:0]];
            rptr <= rptr + 1;
        end
    end
    
    //===============================================
    // DUAL SYNC: Write pointer to read clock domain
    //===============================================
    always @(negedge rclk or negedge rrst_n) begin
        if (!rrst_n) begin
            wptr_sync1 <= 0;
            wptr_sync2 <= 0;
        end else begin
            wptr_sync1 <= wptr;
            wptr_sync2 <= wptr_sync1;
        end
    end
    assign wptr_sync = wptr_sync2;  // Now works because wptr_sync is wire
    
    //===============================================
    // DUAL SYNC: Read pointer to write clock domain
    //===============================================
    always @(negedge wclk or negedge wrst_n) begin
        if (!wrst_n) begin
            rptr_sync1 <= 0;
            rptr_sync2 <= 0;
        end else begin
            rptr_sync1 <= rptr;
            rptr_sync2 <= rptr_sync1;
        end
    end
    assign rptr_sync = rptr_sync2;  // Now works because rptr_sync is wire
    
    //===============================================
    // FULL FLAG (Write Domain)
    //===============================================
    always @(negedge wclk or negedge wrst_n) begin
        if (!wrst_n)
            full <= 0;
        else
            full <= (wptr == {~rptr_sync[PTR_WIDTH-1], rptr_sync[PTR_WIDTH-2:0]});
    end
    
    //===============================================
    // EMPTY FLAG (Read Domain)
    //===============================================
    always @(negedge rclk or negedge rrst_n) begin
        if (!rrst_n)
            empty <= 1;
        else
            empty <= (rptr == wptr_sync);
    end

endmodule