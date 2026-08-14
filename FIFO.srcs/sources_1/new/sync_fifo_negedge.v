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
    output wire                  full,
    output wire                  empty
);

    localparam PTR_WIDTH = $clog2(MWIDTH);

    reg [DWIDTH-1:0] mem [0:MWIDTH-1];

    reg [PTR_WIDTH-1:0] wr_ptr;
    reg [PTR_WIDTH-1:0] rd_ptr;

    reg [PTR_WIDTH:0] count;
    reg [PTR_WIDTH:0] count_next;

    reg full_reg;
    reg empty_reg;

    assign full  = full_reg;
    assign empty = empty_reg;

    integer i;

    always @(*) begin
        count_next = count;
        case ({wr_en && !full_reg, rd_en && !empty_reg})
            2'b10: count_next = count + 1;
            2'b01: count_next = count - 1;
            2'b11: count_next = count;
            default: count_next = count;
        endcase
    end

    always @(negedge clk) begin
        if (rst) begin
            wr_ptr   <= 0;
            rd_ptr   <= 0;
            count    <= 0;
            data_out <= 0;
            full_reg  <= 0;
            empty_reg <= 1;
            for (i = 0; i < MWIDTH; i = i + 1)
                mem[i] <= 0;
        end
        else begin
            if (wr_en && !full_reg && !(rd_en && !empty_reg)) begin
                mem[wr_ptr] <= data_in;
                if (wr_ptr == MWIDTH-1) wr_ptr <= 0;
                else wr_ptr <= wr_ptr + 1;
            end
            else if (rd_en && !empty_reg && !(wr_en && !full_reg)) begin
                data_out <= mem[rd_ptr];
                if (rd_ptr == MWIDTH-1) rd_ptr <= 0;
                else rd_ptr <= rd_ptr + 1;
            end
            else if (wr_en && !full_reg && rd_en && !empty_reg) begin
                data_out <= mem[rd_ptr];
                mem[wr_ptr] <= data_in;
                if (wr_ptr == MWIDTH-1) wr_ptr <= 0;
                else wr_ptr <= wr_ptr + 1;
                if (rd_ptr == MWIDTH-1) rd_ptr <= 0;
                else rd_ptr <= rd_ptr + 1;
            end

            count <= count_next;
            full_reg  <= (count_next == MWIDTH);
            empty_reg <= (count_next == 0);
        end
    end

endmodule