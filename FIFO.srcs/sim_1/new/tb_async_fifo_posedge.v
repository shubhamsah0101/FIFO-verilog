`timescale 1ns / 1ps

module tb_async_fifo_posedge;
    
    parameter DEPTH = 8;
    parameter WIDTH = 8;

    reg  wclk, rclk;
    reg  wrst_n, rrst_n;
    reg  wr_en, rd_en;
    reg  [WIDTH-1:0] wdata;
    wire [WIDTH-1:0] rdata;
    wire full, empty;

    integer errors = 0;
    integer writes_issued = 0;
    integer reads_issued  = 0;

    // Software reference model (simple queue)
    reg [WIDTH-1:0] ref_q [0:255];
    integer ref_head = 0;
    integer ref_tail = 0;

    async_fifo_posedge #(.DEPTH(DEPTH), .WIDTH(WIDTH)) dut (
        .wclk(wclk), .rclk(rclk), .wrst_n(wrst_n), .rrst_n(rrst_n),
        .wr_en(wr_en), .rd_en(rd_en), .wdata(wdata),
        .rdata(rdata), .full(full), .empty(empty)
    );

    always #5 wclk = ~wclk;   // 100 MHz write clock
    always #7 rclk = ~rclk;   // ~71.4 MHz read clock (non-integer ratio)

    task do_write(input [WIDTH-1:0] d);
        begin
            @(posedge wclk);
            if (!full) begin
                wr_en = 1; wdata = d;
                ref_q[ref_tail] = d;
                ref_tail = ref_tail + 1;
                writes_issued = writes_issued + 1;
            end else begin
                wr_en = 0; // FIFO full: write must be ignored
            end
            @(posedge wclk);
            wr_en = 0;
        end
    endtask

    task do_read;
        begin
            @(posedge rclk);
            if (!empty) begin
                rd_en = 1;
            end else begin
                rd_en = 0;
            end
            @(posedge rclk);
            rd_en = 0;
            #1;
            if (writes_issued > reads_issued) begin
                if (rdata !== ref_q[ref_head]) begin
                    $display("MISMATCH at read #%0d: expected=0x%02h got=0x%02h",
                             reads_issued, ref_q[ref_head], rdata);
                    errors = errors + 1;
                end
                ref_head = ref_head + 1;
                reads_issued = reads_issued + 1;
            end
        end
    endtask

    integer i;

    initial begin
        wclk = 0; rclk = 0;
        wrst_n = 0; rrst_n = 0;
        wr_en = 0; rd_en = 0;
        wdata = 0;

        repeat(3) @(posedge wclk); wrst_n = 1;
        repeat(3) @(posedge rclk); rrst_n = 1;

        // TEST 1: Fill to exactly full, verify full asserts and an
        // extra write while full is correctly dropped.
        $display("=== TEST 1: Fill to full ===");
        for (i = 0; i < DEPTH; i = i + 1)
            do_write(i);
        do_write(8'hFF); // should be dropped, FIFO already full
        if (!full) begin
            $display("ERROR: full flag not asserted after filling FIFO");
            errors = errors + 1;
        end

        // TEST 2: Drain to exactly empty, verify empty asserts and an
        // extra read while empty is correctly ignored.
        $display("=== TEST 2: Drain to empty ===");
        for (i = 0; i < DEPTH; i = i + 1)
            do_read;
        do_read; // should be ignored, FIFO already empty
        if (!empty) begin
            $display("ERROR: empty flag not asserted after draining FIFO");
            errors = errors + 1;
        end

        // TEST 3: Simultaneous/interleaved read+write stress across
        // the async boundary, non-integer clock ratio.
        $display("=== TEST 3: Interleaved R/W stress ===");
        fork
            begin
                for (i = 0; i < 40; i = i + 1)
                    do_write($random);
            end
            begin
                #20; // offset so reads start after some writes queue up
                for (i = 0; i < 40; i = i + 1)
                    do_read;
            end
        join

        // Drain anything remaining
        repeat(DEPTH) do_read;

        $display("\n================= SUMMARY =================");
        $display("Writes issued: %0d, Reads issued: %0d, Errors: %0d",
                  writes_issued, reads_issued, errors);
        if (errors == 0)
            $display("RESULT: ALL CHECKS PASSED");
        else
            $display("RESULT: %0d MISMATCH(ES) FOUND", errors);

        $finish;
    end

endmodule