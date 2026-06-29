`timescale 1ns / 1ps

interface fifo_if;

    logic clk;
    logic rst;

    logic [7:0] data_in;
    logic wr_en;
    logic rd_en;

    logic [7:0] data_out;
    logic full;
    logic empty;

endinterface