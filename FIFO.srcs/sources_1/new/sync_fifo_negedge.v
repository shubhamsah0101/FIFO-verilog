`timescale 1ns / 1ps

//===================================================
// Negative Edge Synchronous FIFO - 8x8 Configuration
// Depth: 8 entries, Width: 8 bits
//===================================================

module sync_fifo_negedge (
    input wire        clk,        // Clock (negative edge triggered)
    input wire        reset,      // Active high reset
    input wire        wn,         // Write enable
    input wire        rn,         // Read enable
    input wire [7:0]  data_in,    // Input data (8-bit)
    output reg [7:0]  data_out,   // Output data (8-bit)
    output reg        full,       // FIFO full flag
    output reg        empty       // FIFO empty flag
);

    //===============================================
    // Internal Signals
    //===============================================
    reg [2:0]  wptr;              // Write pointer (3-bit for 8 entries: 0-7)
    reg [2:0]  rptr;              // Read pointer (3-bit for 8 entries: 0-7)
    reg [7:0]  mem [0:7];         // Memory array: 8 locations, 8-bit each
    reg [3:0]  count;             // Count of valid entries (0 to 8)

    //===============================================
    // Write Operation (negative edge triggered)
    //===============================================
    always @(negedge clk or posedge reset) begin
        if (reset) begin
            wptr <= 3'b000;
        end else if (wn && !full) begin
            // Write data to current write pointer location
            mem[wptr] <= data_in;
            // Increment write pointer (wraps automatically from 7 to 0)
            wptr <= wptr + 1'b1;
        end
    end

    //===============================================
    // Read Operation (negative edge triggered)
    //===============================================
    always @(negedge clk or posedge reset) begin
        if (reset) begin
            rptr <= 3'b000;
            data_out <= 8'b00000000;
        end else if (rn && !empty) begin
            // Read data from current read pointer location
            data_out <= mem[rptr];
            // Increment read pointer (wraps automatically from 7 to 0)
            rptr <= rptr + 1'b1;
        end
    end

    //===============================================
    // Count Logic (tracks number of valid entries)
    // 0 = empty, 8 = full
    //===============================================
    always @(negedge clk or posedge reset) begin
        if (reset) begin
            count <= 4'b0000;
        end else begin
            case ({wn && !full, rn && !empty})
                2'b10: count <= count + 1'b1;  // Only write
                2'b01: count <= count - 1'b1;  // Only read
                2'b11: count <= count;         // Write and read simultaneously
                default: count <= count;        // No operation
            endcase
        end
    end

    //===============================================
    // Full Flag Generation
    // Condition: count == 8
    //===============================================
    always @(negedge clk or posedge reset) begin
        if (reset) begin
            full <= 1'b0;
        end else begin
            if (count == 4'b1000)  // 8 entries filled
                full <= 1'b1;
            else
                full <= 1'b0;
        end
    end

    //===============================================
    // Empty Flag Generation
    // Condition: count == 0
    //===============================================
    always @(negedge clk or posedge reset) begin
        if (reset) begin
            empty <= 1'b1;
        end else begin
            if (count == 4'b0000)
                empty <= 1'b1;
            else
                empty <= 1'b0;
        end
    end

endmodule