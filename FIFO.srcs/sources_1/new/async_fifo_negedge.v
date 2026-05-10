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

    localparam ADDR_WIDTH = $clog2(DEPTH);
    
    reg [WIDTH-1:0] mem [0:DEPTH-1];
    reg [ADDR_WIDTH:0] wptr, rptr;
    reg [ADDR_WIDTH:0] wptr_sync, rptr_sync;
    
    //===============================================
    // WRITE LOGIC (Negative Edge)
    //===============================================
    always @(negedge wclk or negedge wrst_n) begin
        if (!wrst_n) begin
            wptr <= 0;
        end else if (wr_en && !full) begin
            mem[wptr[ADDR_WIDTH-1:0]] <= wdata;
            wptr <= wptr + 1;
        end
    end
    
    //===============================================
    // READ LOGIC (Negative Edge)
    // Read data on same cycle
    //===============================================
    always @(negedge rclk or negedge rrst_n) begin
        if (!rrst_n) begin
            rptr <= 0;
            rdata <= 0;
        end else if (rd_en && !empty) begin
            rdata <= mem[rptr[ADDR_WIDTH-1:0]];  // Read current location
            rptr <= rptr + 1;                     // Then increment pointer
        end
    end
    
    //===============================================
    // SYNCHRONIZE POINTERS (Negative Edge)
    //===============================================
    // Sync write pointer to read clock domain
    always @(negedge rclk or negedge rrst_n) begin
        if (!rrst_n)
            wptr_sync <= 0;
        else
            wptr_sync <= wptr;
    end
    
    // Sync read pointer to write clock domain
    always @(negedge wclk or negedge wrst_n) begin
        if (!wrst_n)
            rptr_sync <= 0;
        else
            rptr_sync <= rptr;
    end
    
    //===============================================
    // FULL & EMPTY DETECTION (Combinational)
    //===============================================
    always @* begin
        full = (wptr == {~rptr_sync[ADDR_WIDTH], rptr_sync[ADDR_WIDTH-1:0]});
        empty = (rptr == wptr_sync);
    end
    
endmodule