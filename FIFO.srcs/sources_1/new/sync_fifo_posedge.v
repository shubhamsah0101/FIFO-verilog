`timescale 1ns / 1ps

//===================================================
// FULLY CORRECTED Positive Edge 8x8 Synchronous FIFO
//===================================================

module sync_fifo_posedge (
    input wire        clk,
    input wire        reset,
    input wire        wn,
    input wire        rn,
    input wire [7:0]  data_in,
    output reg [7:0]  data_out,
    output wire       full,
    output wire       empty
);

    //===============================================
    // Internal Signals
    //===============================================
    reg [2:0]  wptr;
    reg [2:0]  rptr;
    reg [7:0]  mem [0:7];
    reg [3:0]  count;

    //===============================================
    // Memory Initialization
    //===============================================
    integer i;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 8; i = i + 1)
                mem[i] <= 8'b00000000;
        end else if (wn && !full) begin
            mem[wptr] <= data_in;
        end
    end

    //===============================================
    // Write Pointer
    //===============================================
    always @(posedge clk or posedge reset) begin
        if (reset)
            wptr <= 3'b000;
        else if (wn && !full)
            wptr <= wptr + 1'b1;
    end

    //===============================================
    // Read Pointer and Output (FIXED ORDER)
    //===============================================
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            rptr <= 3'b000;
            data_out <= 8'b00000000;
        end else if (rn && !empty) begin
            data_out <= mem[rptr];    // Read FIRST
            rptr <= rptr + 1'b1;      // Then increment
        end
    end

    //===============================================
    // Count Logic (FIXED BOUNDS)
    //===============================================
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 4'b0000;
        end else begin
            case ({wn && !full, rn && !empty})
                2'b10: if (count < 8) count <= count + 1'b1;  // Write only
                2'b01: if (count > 0) count <= count - 1'b1;  // Read only
                2'b11: count <= count;                         // Simultaneous
                default: count <= count;
            endcase
        end
    end

    //===============================================
    // Flag Generation (from count - RELIABLE)
    //===============================================
    assign full  = (count == 4'b1000);
    assign empty = (count == 4'b0000);

endmodule