`timescale 1ns / 1ps

module sync_fifo_negedge #(
    parameter DWIDTH = 8,
    parameter MWIDTH = 8
)(
    input  wire                  clk,
    input  wire                  rst,
    input  wire [DWIDTH-1:0]     data_in,
    input  wire                  wr_en,
    input  wire                  rd_en,

    output reg  [DWIDTH-1:0]     data_out,
    output reg                   full,
    output reg                   empty
);

    // ============================================
    // Pointer Width
    // ============================================
    localparam PTR_WIDTH = $clog2(MWIDTH);

    // ============================================
    // FIFO Memory
    // ============================================
    reg [DWIDTH-1:0] mem [0:MWIDTH-1];

    // ============================================
    // Pointers and Counter
    // ============================================
    reg [PTR_WIDTH-1:0] wr_ptr;
    reg [PTR_WIDTH-1:0] rd_ptr;

    reg [PTR_WIDTH:0] count;

    integer i;

    // ============================================
    // FIFO Logic
    // ============================================
    always @(negedge clk) begin

        if (rst) begin

            wr_ptr   <= 0;
            rd_ptr   <= 0;
            count    <= 0;

            data_out <= 0;

            full  <= 0;
            empty <= 1;

            // Optional memory reset
            for (i = 0; i < MWIDTH; i = i + 1)
                mem[i] <= 0;

        end
        else begin

            // ====================================
            // Simultaneous Read + Write
            // ====================================
            case ({wr_en && !full, rd_en && !empty})

                // ====================================
                // WRITE ONLY
                // ====================================
                2'b10: begin

                    mem[wr_ptr] <= data_in;

                    if (wr_ptr == MWIDTH-1)
                        wr_ptr <= 0;
                    else
                        wr_ptr <= wr_ptr + 1;

                    count <= count + 1;
                end

                // ====================================
                // READ ONLY
                // ====================================
                2'b01: begin

                    data_out <= mem[rd_ptr];

                    if (rd_ptr == MWIDTH-1)
                        rd_ptr <= 0;
                    else
                        rd_ptr <= rd_ptr + 1;

                    count <= count - 1;
                end

                // ====================================
                // SIMULTANEOUS READ + WRITE
                // ====================================
                2'b11: begin

                    data_out <= mem[rd_ptr];

                    mem[wr_ptr] <= data_in;

                    // Update write pointer
                    if (wr_ptr == MWIDTH-1)
                        wr_ptr <= 0;
                    else
                        wr_ptr <= wr_ptr + 1;

                    // Update read pointer
                    if (rd_ptr == MWIDTH-1)
                        rd_ptr <= 0;
                    else
                        rd_ptr <= rd_ptr + 1;

                    // Count unchanged
                    count <= count;
                end

                default: begin
                    count <= count;
                end

            endcase

            // ====================================
            // Update Flags
            // ====================================
            full  <= (count == MWIDTH-1 &&
                     wr_en && !rd_en);

            empty <= (count == 1 &&
                     rd_en && !wr_en);

        end
    end

endmodule