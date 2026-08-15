// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Fri Aug 14 23:54:15 2026
// Host        : SHUBHAM running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               D:/RTL_Design/FIFO/FIFO.sim/sim_1/impl/func/xsim/tb_async_fifo_posedge_func_impl.v
// Design      : async_fifo_posedge
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ADDR_WIDTH = "3" *) (* DEPTH = "8" *) (* ECO_CHECKSUM = "af255756" *) 
(* PTR_WIDTH = "4" *) (* WIDTH = "8" *) 
(* NotValidForBitStream *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
module async_fifo_posedge
   (wclk,
    rclk,
    wrst_n,
    rrst_n,
    wr_en,
    rd_en,
    wdata,
    rdata,
    full,
    empty);
  input wclk;
  input rclk;
  input wrst_n;
  input rrst_n;
  input wr_en;
  input rd_en;
  input [7:0]wdata;
  output [7:0]rdata;
  output full;
  output empty;

  wire empty;
  wire empty0;
  wire empty_OBUF;
  wire empty_i_2_n_0;
  wire empty_i_3_n_0;
  wire full;
  wire full0;
  wire full_OBUF;
  wire full_i_2_n_0;
  wire full_i_3_n_0;
  wire \mem[0][7]_i_1_n_0 ;
  wire \mem[1][7]_i_1_n_0 ;
  wire \mem[2][7]_i_1_n_0 ;
  wire \mem[3][7]_i_1_n_0 ;
  wire \mem[4][7]_i_1_n_0 ;
  wire \mem[5][7]_i_1_n_0 ;
  wire \mem[6][7]_i_1_n_0 ;
  wire \mem[7][7]_i_1_n_0 ;
  wire [7:0]\mem_reg[0] ;
  wire [7:0]\mem_reg[1] ;
  wire [7:0]\mem_reg[2] ;
  wire [7:0]\mem_reg[3] ;
  wire [7:0]\mem_reg[4] ;
  wire [7:0]\mem_reg[5] ;
  wire [7:0]\mem_reg[6] ;
  wire [7:0]\mem_reg[7] ;
  wire rclk;
  wire rclk_IBUF;
  wire rclk_IBUF_BUFG;
  wire rd_en;
  wire rd_en_IBUF;
  wire [7:0]rdata;
  wire \rdata[0]_i_2_n_0 ;
  wire \rdata[0]_i_3_n_0 ;
  wire \rdata[1]_i_2_n_0 ;
  wire \rdata[1]_i_3_n_0 ;
  wire \rdata[2]_i_2_n_0 ;
  wire \rdata[2]_i_3_n_0 ;
  wire \rdata[3]_i_2_n_0 ;
  wire \rdata[3]_i_3_n_0 ;
  wire \rdata[4]_i_2_n_0 ;
  wire \rdata[4]_i_3_n_0 ;
  wire \rdata[5]_i_2_n_0 ;
  wire \rdata[5]_i_3_n_0 ;
  wire \rdata[6]_i_2_n_0 ;
  wire \rdata[6]_i_3_n_0 ;
  wire \rdata[7]_i_3_n_0 ;
  wire \rdata[7]_i_4_n_0 ;
  wire [7:0]rdata_OBUF;
  wire \rdata_reg[0]_i_1_n_0 ;
  wire \rdata_reg[1]_i_1_n_0 ;
  wire \rdata_reg[2]_i_1_n_0 ;
  wire \rdata_reg[3]_i_1_n_0 ;
  wire \rdata_reg[4]_i_1_n_0 ;
  wire \rdata_reg[5]_i_1_n_0 ;
  wire \rdata_reg[6]_i_1_n_0 ;
  wire \rdata_reg[7]_i_2_n_0 ;
  wire rptr_bin1;
  wire [3:3]rptr_bin_next;
  wire [2:0]rptr_bin_next__0;
  wire [3:0]rptr_bin_reg;
  wire [2:0]rptr_gray;
  wire \rptr_gray[2]_i_2_n_0 ;
  wire [2:0]rptr_gray_next;
  wire [3:0]rptr_gray_sync1;
  wire \rptr_gray_sync1[3]_i_1_n_0 ;
  wire [3:0]rptr_gray_sync2;
  wire rrst_n;
  wire rrst_n_IBUF;
  wire wclk;
  wire wclk_IBUF;
  wire wclk_IBUF_BUFG;
  wire [7:0]wdata;
  wire [7:0]wdata_IBUF;
  wire [3:3]wptr_bin_next;
  wire [2:0]wptr_bin_next__0;
  wire [3:0]wptr_bin_reg;
  wire [2:0]wptr_gray;
  wire [2:0]wptr_gray_next;
  wire [3:0]wptr_gray_sync1;
  wire [3:0]wptr_gray_sync2;
  wire wr_en;
  wire wr_en_IBUF;
  wire wrst_n;
  wire wrst_n_IBUF;

  OBUF empty_OBUF_inst
       (.I(empty_OBUF),
        .O(empty));
  LUT6 #(
    .INIT(64'h0840800400000000)) 
    empty_i_1
       (.I0(wptr_gray_sync2[3]),
        .I1(empty_i_2_n_0),
        .I2(rptr_bin_next__0[2]),
        .I3(rptr_bin_next),
        .I4(wptr_gray_sync2[2]),
        .I5(empty_i_3_n_0),
        .O(empty0));
  (* \PinAttr:I2:HOLD_DETOUR  = "983" *) 
  LUT6 #(
    .INIT(64'h55559AAAAAAA6555)) 
    empty_i_2
       (.I0(wptr_gray_sync2[1]),
        .I1(empty_OBUF),
        .I2(rd_en_IBUF),
        .I3(rptr_bin_reg[0]),
        .I4(rptr_bin_reg[1]),
        .I5(rptr_bin_reg[2]),
        .O(empty_i_2_n_0));
  (* \PinAttr:I2:HOLD_DETOUR  = "1286" *) 
  LUT5 #(
    .INIT(32'h665699A9)) 
    empty_i_3
       (.I0(wptr_gray_sync2[0]),
        .I1(rptr_bin_reg[0]),
        .I2(rd_en_IBUF),
        .I3(empty_OBUF),
        .I4(rptr_bin_reg[1]),
        .O(empty_i_3_n_0));
  FDPE #(
    .INIT(1'b1)) 
    empty_reg
       (.C(rclk_IBUF_BUFG),
        .CE(1'b1),
        .D(empty0),
        .PRE(\rptr_gray[2]_i_2_n_0 ),
        .Q(empty_OBUF));
  OBUF full_OBUF_inst
       (.I(full_OBUF),
        .O(full));
  LUT6 #(
    .INIT(64'h4008048000000000)) 
    full_i_1
       (.I0(rptr_gray_sync2[3]),
        .I1(full_i_2_n_0),
        .I2(wptr_bin_next__0[2]),
        .I3(wptr_bin_next),
        .I4(rptr_gray_sync2[2]),
        .I5(full_i_3_n_0),
        .O(full0));
  (* \PinAttr:I2:HOLD_DETOUR  = "1267" *) 
  LUT6 #(
    .INIT(64'h55559AAAAAAA6555)) 
    full_i_2
       (.I0(rptr_gray_sync2[1]),
        .I1(full_OBUF),
        .I2(wr_en_IBUF),
        .I3(wptr_bin_reg[0]),
        .I4(wptr_bin_reg[1]),
        .I5(wptr_bin_reg[2]),
        .O(full_i_2_n_0));
  (* \PinAttr:I2:HOLD_DETOUR  = "982" *) 
  LUT5 #(
    .INIT(32'h665699A9)) 
    full_i_3
       (.I0(rptr_gray_sync2[0]),
        .I1(wptr_bin_reg[0]),
        .I2(wr_en_IBUF),
        .I3(full_OBUF),
        .I4(wptr_bin_reg[1]),
        .O(full_i_3_n_0));
  FDCE #(
    .INIT(1'b0)) 
    full_reg
       (.C(wclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray_sync1[3]_i_1_n_0 ),
        .D(full0),
        .Q(full_OBUF));
  (* \PinAttr:I4:HOLD_DETOUR  = "914" *) 
  LUT6 #(
    .INIT(64'h0000000001000000)) 
    \mem[0][7]_i_1 
       (.I0(wptr_bin_reg[1]),
        .I1(wptr_bin_reg[0]),
        .I2(wptr_bin_reg[2]),
        .I3(wrst_n_IBUF),
        .I4(wr_en_IBUF),
        .I5(full_OBUF),
        .O(\mem[0][7]_i_1_n_0 ));
  (* \PinAttr:I3:HOLD_DETOUR  = "930" *) 
  (* \PinAttr:I4:HOLD_DETOUR  = "971" *) 
  LUT6 #(
    .INIT(64'h0000000004000000)) 
    \mem[1][7]_i_1 
       (.I0(wptr_bin_reg[1]),
        .I1(wptr_bin_reg[0]),
        .I2(wptr_bin_reg[2]),
        .I3(wrst_n_IBUF),
        .I4(wr_en_IBUF),
        .I5(full_OBUF),
        .O(\mem[1][7]_i_1_n_0 ));
  (* \PinAttr:I3:HOLD_DETOUR  = "920" *) 
  (* \PinAttr:I4:HOLD_DETOUR  = "1023" *) 
  LUT6 #(
    .INIT(64'h0000000004000000)) 
    \mem[2][7]_i_1 
       (.I0(wptr_bin_reg[2]),
        .I1(wptr_bin_reg[1]),
        .I2(wptr_bin_reg[0]),
        .I3(wrst_n_IBUF),
        .I4(wr_en_IBUF),
        .I5(full_OBUF),
        .O(\mem[2][7]_i_1_n_0 ));
  (* \PinAttr:I4:HOLD_DETOUR  = "931" *) 
  LUT6 #(
    .INIT(64'h0000000040000000)) 
    \mem[3][7]_i_1 
       (.I0(wptr_bin_reg[2]),
        .I1(wptr_bin_reg[0]),
        .I2(wptr_bin_reg[1]),
        .I3(wrst_n_IBUF),
        .I4(wr_en_IBUF),
        .I5(full_OBUF),
        .O(\mem[3][7]_i_1_n_0 ));
  (* \PinAttr:I3:HOLD_DETOUR  = "974" *) 
  (* \PinAttr:I4:HOLD_DETOUR  = "991" *) 
  LUT6 #(
    .INIT(64'h0000000004000000)) 
    \mem[4][7]_i_1 
       (.I0(wptr_bin_reg[1]),
        .I1(wptr_bin_reg[2]),
        .I2(wptr_bin_reg[0]),
        .I3(wrst_n_IBUF),
        .I4(wr_en_IBUF),
        .I5(full_OBUF),
        .O(\mem[4][7]_i_1_n_0 ));
  (* \PinAttr:I4:HOLD_DETOUR  = "885" *) 
  LUT6 #(
    .INIT(64'h0000000040000000)) 
    \mem[5][7]_i_1 
       (.I0(wptr_bin_reg[1]),
        .I1(wptr_bin_reg[0]),
        .I2(wptr_bin_reg[2]),
        .I3(wrst_n_IBUF),
        .I4(wr_en_IBUF),
        .I5(full_OBUF),
        .O(\mem[5][7]_i_1_n_0 ));
  (* \PinAttr:I3:HOLD_DETOUR  = "717" *) 
  (* \PinAttr:I4:HOLD_DETOUR  = "976" *) 
  LUT6 #(
    .INIT(64'h0000000040000000)) 
    \mem[6][7]_i_1 
       (.I0(wptr_bin_reg[0]),
        .I1(wptr_bin_reg[2]),
        .I2(wptr_bin_reg[1]),
        .I3(wrst_n_IBUF),
        .I4(wr_en_IBUF),
        .I5(full_OBUF),
        .O(\mem[6][7]_i_1_n_0 ));
  (* \PinAttr:I4:HOLD_DETOUR  = "894" *) 
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \mem[7][7]_i_1 
       (.I0(wptr_bin_reg[0]),
        .I1(wptr_bin_reg[2]),
        .I2(wptr_bin_reg[1]),
        .I3(wrst_n_IBUF),
        .I4(wr_en_IBUF),
        .I5(full_OBUF),
        .O(\mem[7][7]_i_1_n_0 ));
  (* \PinAttr:D:HOLD_DETOUR  = "1362" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[0][0] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[0][7]_i_1_n_0 ),
        .D(wdata_IBUF[0]),
        .Q(\mem_reg[0] [0]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1316" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[0][1] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[0][7]_i_1_n_0 ),
        .D(wdata_IBUF[1]),
        .Q(\mem_reg[0] [1]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1356" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[0][2] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[0][7]_i_1_n_0 ),
        .D(wdata_IBUF[2]),
        .Q(\mem_reg[0] [2]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1440" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[0][3] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[0][7]_i_1_n_0 ),
        .D(wdata_IBUF[3]),
        .Q(\mem_reg[0] [3]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1430" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[0][4] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[0][7]_i_1_n_0 ),
        .D(wdata_IBUF[4]),
        .Q(\mem_reg[0] [4]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1370" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[0][5] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[0][7]_i_1_n_0 ),
        .D(wdata_IBUF[5]),
        .Q(\mem_reg[0] [5]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1413" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[0][6] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[0][7]_i_1_n_0 ),
        .D(wdata_IBUF[6]),
        .Q(\mem_reg[0] [6]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1435" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[0][7] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[0][7]_i_1_n_0 ),
        .D(wdata_IBUF[7]),
        .Q(\mem_reg[0] [7]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1317" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[1][0] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[1][7]_i_1_n_0 ),
        .D(wdata_IBUF[0]),
        .Q(\mem_reg[1] [0]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1360" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[1][1] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[1][7]_i_1_n_0 ),
        .D(wdata_IBUF[1]),
        .Q(\mem_reg[1] [1]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1424" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[1][2] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[1][7]_i_1_n_0 ),
        .D(wdata_IBUF[2]),
        .Q(\mem_reg[1] [2]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1431" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[1][3] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[1][7]_i_1_n_0 ),
        .D(wdata_IBUF[3]),
        .Q(\mem_reg[1] [3]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1395" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[1][4] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[1][7]_i_1_n_0 ),
        .D(wdata_IBUF[4]),
        .Q(\mem_reg[1] [4]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1377" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[1][5] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[1][7]_i_1_n_0 ),
        .D(wdata_IBUF[5]),
        .Q(\mem_reg[1] [5]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1344" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[1][6] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[1][7]_i_1_n_0 ),
        .D(wdata_IBUF[6]),
        .Q(\mem_reg[1] [6]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1452" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[1][7] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[1][7]_i_1_n_0 ),
        .D(wdata_IBUF[7]),
        .Q(\mem_reg[1] [7]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1431" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[2][0] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[2][7]_i_1_n_0 ),
        .D(wdata_IBUF[0]),
        .Q(\mem_reg[2] [0]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1432" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[2][1] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[2][7]_i_1_n_0 ),
        .D(wdata_IBUF[1]),
        .Q(\mem_reg[2] [1]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1438" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[2][2] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[2][7]_i_1_n_0 ),
        .D(wdata_IBUF[2]),
        .Q(\mem_reg[2] [2]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1453" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[2][3] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[2][7]_i_1_n_0 ),
        .D(wdata_IBUF[3]),
        .Q(\mem_reg[2] [3]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1484" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[2][4] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[2][7]_i_1_n_0 ),
        .D(wdata_IBUF[4]),
        .Q(\mem_reg[2] [4]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1381" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[2][5] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[2][7]_i_1_n_0 ),
        .D(wdata_IBUF[5]),
        .Q(\mem_reg[2] [5]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1377" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[2][6] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[2][7]_i_1_n_0 ),
        .D(wdata_IBUF[6]),
        .Q(\mem_reg[2] [6]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1364" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[2][7] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[2][7]_i_1_n_0 ),
        .D(wdata_IBUF[7]),
        .Q(\mem_reg[2] [7]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1427" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[3][0] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[3][7]_i_1_n_0 ),
        .D(wdata_IBUF[0]),
        .Q(\mem_reg[3] [0]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1406" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[3][1] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[3][7]_i_1_n_0 ),
        .D(wdata_IBUF[1]),
        .Q(\mem_reg[3] [1]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1469" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[3][2] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[3][7]_i_1_n_0 ),
        .D(wdata_IBUF[2]),
        .Q(\mem_reg[3] [2]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1499" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[3][3] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[3][7]_i_1_n_0 ),
        .D(wdata_IBUF[3]),
        .Q(\mem_reg[3] [3]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1442" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[3][4] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[3][7]_i_1_n_0 ),
        .D(wdata_IBUF[4]),
        .Q(\mem_reg[3] [4]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1425" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[3][5] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[3][7]_i_1_n_0 ),
        .D(wdata_IBUF[5]),
        .Q(\mem_reg[3] [5]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1421" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[3][6] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[3][7]_i_1_n_0 ),
        .D(wdata_IBUF[6]),
        .Q(\mem_reg[3] [6]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1441" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[3][7] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[3][7]_i_1_n_0 ),
        .D(wdata_IBUF[7]),
        .Q(\mem_reg[3] [7]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1400" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[4][0] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[4][7]_i_1_n_0 ),
        .D(wdata_IBUF[0]),
        .Q(\mem_reg[4] [0]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1355" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[4][1] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[4][7]_i_1_n_0 ),
        .D(wdata_IBUF[1]),
        .Q(\mem_reg[4] [1]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1491" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[4][2] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[4][7]_i_1_n_0 ),
        .D(wdata_IBUF[2]),
        .Q(\mem_reg[4] [2]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1498" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[4][3] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[4][7]_i_1_n_0 ),
        .D(wdata_IBUF[3]),
        .Q(\mem_reg[4] [3]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1420" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[4][4] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[4][7]_i_1_n_0 ),
        .D(wdata_IBUF[4]),
        .Q(\mem_reg[4] [4]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1403" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[4][5] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[4][7]_i_1_n_0 ),
        .D(wdata_IBUF[5]),
        .Q(\mem_reg[4] [5]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1423" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[4][6] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[4][7]_i_1_n_0 ),
        .D(wdata_IBUF[6]),
        .Q(\mem_reg[4] [6]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1471" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[4][7] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[4][7]_i_1_n_0 ),
        .D(wdata_IBUF[7]),
        .Q(\mem_reg[4] [7]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1379" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[5][0] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[5][7]_i_1_n_0 ),
        .D(wdata_IBUF[0]),
        .Q(\mem_reg[5] [0]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1456" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[5][1] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[5][7]_i_1_n_0 ),
        .D(wdata_IBUF[1]),
        .Q(\mem_reg[5] [1]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1391" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[5][2] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[5][7]_i_1_n_0 ),
        .D(wdata_IBUF[2]),
        .Q(\mem_reg[5] [2]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1446" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[5][3] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[5][7]_i_1_n_0 ),
        .D(wdata_IBUF[3]),
        .Q(\mem_reg[5] [3]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1482" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[5][4] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[5][7]_i_1_n_0 ),
        .D(wdata_IBUF[4]),
        .Q(\mem_reg[5] [4]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1435" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[5][5] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[5][7]_i_1_n_0 ),
        .D(wdata_IBUF[5]),
        .Q(\mem_reg[5] [5]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1430" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[5][6] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[5][7]_i_1_n_0 ),
        .D(wdata_IBUF[6]),
        .Q(\mem_reg[5] [6]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1397" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[5][7] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[5][7]_i_1_n_0 ),
        .D(wdata_IBUF[7]),
        .Q(\mem_reg[5] [7]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1376" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[6][0] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[6][7]_i_1_n_0 ),
        .D(wdata_IBUF[0]),
        .Q(\mem_reg[6] [0]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1431" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[6][1] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[6][7]_i_1_n_0 ),
        .D(wdata_IBUF[1]),
        .Q(\mem_reg[6] [1]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1408" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[6][2] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[6][7]_i_1_n_0 ),
        .D(wdata_IBUF[2]),
        .Q(\mem_reg[6] [2]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1428" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[6][3] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[6][7]_i_1_n_0 ),
        .D(wdata_IBUF[3]),
        .Q(\mem_reg[6] [3]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1519" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[6][4] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[6][7]_i_1_n_0 ),
        .D(wdata_IBUF[4]),
        .Q(\mem_reg[6] [4]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1300" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[6][5] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[6][7]_i_1_n_0 ),
        .D(wdata_IBUF[5]),
        .Q(\mem_reg[6] [5]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1358" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[6][6] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[6][7]_i_1_n_0 ),
        .D(wdata_IBUF[6]),
        .Q(\mem_reg[6] [6]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1390" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[6][7] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[6][7]_i_1_n_0 ),
        .D(wdata_IBUF[7]),
        .Q(\mem_reg[6] [7]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1380" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[7][0] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[7][7]_i_1_n_0 ),
        .D(wdata_IBUF[0]),
        .Q(\mem_reg[7] [0]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1341" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[7][1] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[7][7]_i_1_n_0 ),
        .D(wdata_IBUF[1]),
        .Q(\mem_reg[7] [1]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1414" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[7][2] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[7][7]_i_1_n_0 ),
        .D(wdata_IBUF[2]),
        .Q(\mem_reg[7] [2]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1405" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[7][3] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[7][7]_i_1_n_0 ),
        .D(wdata_IBUF[3]),
        .Q(\mem_reg[7] [3]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1386" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[7][4] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[7][7]_i_1_n_0 ),
        .D(wdata_IBUF[4]),
        .Q(\mem_reg[7] [4]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1338" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[7][5] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[7][7]_i_1_n_0 ),
        .D(wdata_IBUF[5]),
        .Q(\mem_reg[7] [5]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1320" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[7][6] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[7][7]_i_1_n_0 ),
        .D(wdata_IBUF[6]),
        .Q(\mem_reg[7] [6]),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "1333" *) 
  FDRE #(
    .INIT(1'b0)) 
    \mem_reg[7][7] 
       (.C(wclk_IBUF_BUFG),
        .CE(\mem[7][7]_i_1_n_0 ),
        .D(wdata_IBUF[7]),
        .Q(\mem_reg[7] [7]),
        .R(1'b0));
  BUFG rclk_IBUF_BUFG_inst
       (.I(rclk_IBUF),
        .O(rclk_IBUF_BUFG));
  IBUF rclk_IBUF_inst
       (.I(rclk),
        .O(rclk_IBUF));
  IBUF rd_en_IBUF_inst
       (.I(rd_en),
        .O(rd_en_IBUF));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rdata[0]_i_2 
       (.I0(\mem_reg[3] [0]),
        .I1(\mem_reg[2] [0]),
        .I2(rptr_bin_reg[1]),
        .I3(\mem_reg[1] [0]),
        .I4(rptr_bin_reg[0]),
        .I5(\mem_reg[0] [0]),
        .O(\rdata[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rdata[0]_i_3 
       (.I0(\mem_reg[7] [0]),
        .I1(\mem_reg[6] [0]),
        .I2(rptr_bin_reg[1]),
        .I3(\mem_reg[5] [0]),
        .I4(rptr_bin_reg[0]),
        .I5(\mem_reg[4] [0]),
        .O(\rdata[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rdata[1]_i_2 
       (.I0(\mem_reg[3] [1]),
        .I1(\mem_reg[2] [1]),
        .I2(rptr_bin_reg[1]),
        .I3(\mem_reg[1] [1]),
        .I4(rptr_bin_reg[0]),
        .I5(\mem_reg[0] [1]),
        .O(\rdata[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rdata[1]_i_3 
       (.I0(\mem_reg[7] [1]),
        .I1(\mem_reg[6] [1]),
        .I2(rptr_bin_reg[1]),
        .I3(\mem_reg[5] [1]),
        .I4(rptr_bin_reg[0]),
        .I5(\mem_reg[4] [1]),
        .O(\rdata[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rdata[2]_i_2 
       (.I0(\mem_reg[3] [2]),
        .I1(\mem_reg[2] [2]),
        .I2(rptr_bin_reg[1]),
        .I3(\mem_reg[1] [2]),
        .I4(rptr_bin_reg[0]),
        .I5(\mem_reg[0] [2]),
        .O(\rdata[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rdata[2]_i_3 
       (.I0(\mem_reg[7] [2]),
        .I1(\mem_reg[6] [2]),
        .I2(rptr_bin_reg[1]),
        .I3(\mem_reg[5] [2]),
        .I4(rptr_bin_reg[0]),
        .I5(\mem_reg[4] [2]),
        .O(\rdata[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rdata[3]_i_2 
       (.I0(\mem_reg[3] [3]),
        .I1(\mem_reg[2] [3]),
        .I2(rptr_bin_reg[1]),
        .I3(\mem_reg[1] [3]),
        .I4(rptr_bin_reg[0]),
        .I5(\mem_reg[0] [3]),
        .O(\rdata[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rdata[3]_i_3 
       (.I0(\mem_reg[7] [3]),
        .I1(\mem_reg[6] [3]),
        .I2(rptr_bin_reg[1]),
        .I3(\mem_reg[5] [3]),
        .I4(rptr_bin_reg[0]),
        .I5(\mem_reg[4] [3]),
        .O(\rdata[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rdata[4]_i_2 
       (.I0(\mem_reg[3] [4]),
        .I1(\mem_reg[2] [4]),
        .I2(rptr_bin_reg[1]),
        .I3(\mem_reg[1] [4]),
        .I4(rptr_bin_reg[0]),
        .I5(\mem_reg[0] [4]),
        .O(\rdata[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rdata[4]_i_3 
       (.I0(\mem_reg[7] [4]),
        .I1(\mem_reg[6] [4]),
        .I2(rptr_bin_reg[1]),
        .I3(\mem_reg[5] [4]),
        .I4(rptr_bin_reg[0]),
        .I5(\mem_reg[4] [4]),
        .O(\rdata[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rdata[5]_i_2 
       (.I0(\mem_reg[3] [5]),
        .I1(\mem_reg[2] [5]),
        .I2(rptr_bin_reg[1]),
        .I3(\mem_reg[1] [5]),
        .I4(rptr_bin_reg[0]),
        .I5(\mem_reg[0] [5]),
        .O(\rdata[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rdata[5]_i_3 
       (.I0(\mem_reg[7] [5]),
        .I1(\mem_reg[6] [5]),
        .I2(rptr_bin_reg[1]),
        .I3(\mem_reg[5] [5]),
        .I4(rptr_bin_reg[0]),
        .I5(\mem_reg[4] [5]),
        .O(\rdata[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rdata[6]_i_2 
       (.I0(\mem_reg[3] [6]),
        .I1(\mem_reg[2] [6]),
        .I2(rptr_bin_reg[1]),
        .I3(\mem_reg[1] [6]),
        .I4(rptr_bin_reg[0]),
        .I5(\mem_reg[0] [6]),
        .O(\rdata[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rdata[6]_i_3 
       (.I0(\mem_reg[7] [6]),
        .I1(\mem_reg[6] [6]),
        .I2(rptr_bin_reg[1]),
        .I3(\mem_reg[5] [6]),
        .I4(rptr_bin_reg[0]),
        .I5(\mem_reg[4] [6]),
        .O(\rdata[6]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \rdata[7]_i_1 
       (.I0(rd_en_IBUF),
        .I1(empty_OBUF),
        .O(rptr_bin1));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rdata[7]_i_3 
       (.I0(\mem_reg[3] [7]),
        .I1(\mem_reg[2] [7]),
        .I2(rptr_bin_reg[1]),
        .I3(\mem_reg[1] [7]),
        .I4(rptr_bin_reg[0]),
        .I5(\mem_reg[0] [7]),
        .O(\rdata[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rdata[7]_i_4 
       (.I0(\mem_reg[7] [7]),
        .I1(\mem_reg[6] [7]),
        .I2(rptr_bin_reg[1]),
        .I3(\mem_reg[5] [7]),
        .I4(rptr_bin_reg[0]),
        .I5(\mem_reg[4] [7]),
        .O(\rdata[7]_i_4_n_0 ));
  OBUF \rdata_OBUF[0]_inst 
       (.I(rdata_OBUF[0]),
        .O(rdata[0]));
  OBUF \rdata_OBUF[1]_inst 
       (.I(rdata_OBUF[1]),
        .O(rdata[1]));
  OBUF \rdata_OBUF[2]_inst 
       (.I(rdata_OBUF[2]),
        .O(rdata[2]));
  OBUF \rdata_OBUF[3]_inst 
       (.I(rdata_OBUF[3]),
        .O(rdata[3]));
  OBUF \rdata_OBUF[4]_inst 
       (.I(rdata_OBUF[4]),
        .O(rdata[4]));
  OBUF \rdata_OBUF[5]_inst 
       (.I(rdata_OBUF[5]),
        .O(rdata[5]));
  OBUF \rdata_OBUF[6]_inst 
       (.I(rdata_OBUF[6]),
        .O(rdata[6]));
  OBUF \rdata_OBUF[7]_inst 
       (.I(rdata_OBUF[7]),
        .O(rdata[7]));
  FDCE #(
    .INIT(1'b0)) 
    \rdata_reg[0] 
       (.C(rclk_IBUF_BUFG),
        .CE(rptr_bin1),
        .CLR(\rptr_gray[2]_i_2_n_0 ),
        .D(\rdata_reg[0]_i_1_n_0 ),
        .Q(rdata_OBUF[0]));
  MUXF7 \rdata_reg[0]_i_1 
       (.I0(\rdata[0]_i_2_n_0 ),
        .I1(\rdata[0]_i_3_n_0 ),
        .O(\rdata_reg[0]_i_1_n_0 ),
        .S(rptr_bin_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \rdata_reg[1] 
       (.C(rclk_IBUF_BUFG),
        .CE(rptr_bin1),
        .CLR(\rptr_gray[2]_i_2_n_0 ),
        .D(\rdata_reg[1]_i_1_n_0 ),
        .Q(rdata_OBUF[1]));
  MUXF7 \rdata_reg[1]_i_1 
       (.I0(\rdata[1]_i_2_n_0 ),
        .I1(\rdata[1]_i_3_n_0 ),
        .O(\rdata_reg[1]_i_1_n_0 ),
        .S(rptr_bin_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \rdata_reg[2] 
       (.C(rclk_IBUF_BUFG),
        .CE(rptr_bin1),
        .CLR(\rptr_gray[2]_i_2_n_0 ),
        .D(\rdata_reg[2]_i_1_n_0 ),
        .Q(rdata_OBUF[2]));
  MUXF7 \rdata_reg[2]_i_1 
       (.I0(\rdata[2]_i_2_n_0 ),
        .I1(\rdata[2]_i_3_n_0 ),
        .O(\rdata_reg[2]_i_1_n_0 ),
        .S(rptr_bin_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \rdata_reg[3] 
       (.C(rclk_IBUF_BUFG),
        .CE(rptr_bin1),
        .CLR(\rptr_gray[2]_i_2_n_0 ),
        .D(\rdata_reg[3]_i_1_n_0 ),
        .Q(rdata_OBUF[3]));
  MUXF7 \rdata_reg[3]_i_1 
       (.I0(\rdata[3]_i_2_n_0 ),
        .I1(\rdata[3]_i_3_n_0 ),
        .O(\rdata_reg[3]_i_1_n_0 ),
        .S(rptr_bin_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \rdata_reg[4] 
       (.C(rclk_IBUF_BUFG),
        .CE(rptr_bin1),
        .CLR(\rptr_gray[2]_i_2_n_0 ),
        .D(\rdata_reg[4]_i_1_n_0 ),
        .Q(rdata_OBUF[4]));
  MUXF7 \rdata_reg[4]_i_1 
       (.I0(\rdata[4]_i_2_n_0 ),
        .I1(\rdata[4]_i_3_n_0 ),
        .O(\rdata_reg[4]_i_1_n_0 ),
        .S(rptr_bin_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \rdata_reg[5] 
       (.C(rclk_IBUF_BUFG),
        .CE(rptr_bin1),
        .CLR(\rptr_gray[2]_i_2_n_0 ),
        .D(\rdata_reg[5]_i_1_n_0 ),
        .Q(rdata_OBUF[5]));
  MUXF7 \rdata_reg[5]_i_1 
       (.I0(\rdata[5]_i_2_n_0 ),
        .I1(\rdata[5]_i_3_n_0 ),
        .O(\rdata_reg[5]_i_1_n_0 ),
        .S(rptr_bin_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \rdata_reg[6] 
       (.C(rclk_IBUF_BUFG),
        .CE(rptr_bin1),
        .CLR(\rptr_gray[2]_i_2_n_0 ),
        .D(\rdata_reg[6]_i_1_n_0 ),
        .Q(rdata_OBUF[6]));
  MUXF7 \rdata_reg[6]_i_1 
       (.I0(\rdata[6]_i_2_n_0 ),
        .I1(\rdata[6]_i_3_n_0 ),
        .O(\rdata_reg[6]_i_1_n_0 ),
        .S(rptr_bin_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \rdata_reg[7] 
       (.C(rclk_IBUF_BUFG),
        .CE(rptr_bin1),
        .CLR(\rptr_gray[2]_i_2_n_0 ),
        .D(\rdata_reg[7]_i_2_n_0 ),
        .Q(rdata_OBUF[7]));
  MUXF7 \rdata_reg[7]_i_2 
       (.I0(\rdata[7]_i_3_n_0 ),
        .I1(\rdata[7]_i_4_n_0 ),
        .O(\rdata_reg[7]_i_2_n_0 ),
        .S(rptr_bin_reg[2]));
  (* \PinAttr:I2:HOLD_DETOUR  = "1433" *) 
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h9A)) 
    \rptr_bin[0]_i_1 
       (.I0(rptr_bin_reg[0]),
        .I1(empty_OBUF),
        .I2(rd_en_IBUF),
        .O(rptr_bin_next__0[0]));
  (* \PinAttr:I1:HOLD_DETOUR  = "1433" *) 
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hF708)) 
    \rptr_bin[1]_i_1 
       (.I0(rptr_bin_reg[0]),
        .I1(rd_en_IBUF),
        .I2(empty_OBUF),
        .I3(rptr_bin_reg[1]),
        .O(rptr_bin_next__0[1]));
  (* \PinAttr:I1:HOLD_DETOUR  = "1134" *) 
  LUT5 #(
    .INIT(32'hBFFF4000)) 
    \rptr_bin[2]_i_1 
       (.I0(empty_OBUF),
        .I1(rd_en_IBUF),
        .I2(rptr_bin_reg[0]),
        .I3(rptr_bin_reg[1]),
        .I4(rptr_bin_reg[2]),
        .O(rptr_bin_next__0[2]));
  (* \PinAttr:I2:HOLD_DETOUR  = "921" *) 
  LUT6 #(
    .INIT(64'hFF7FFFFF00800000)) 
    \rptr_bin[3]_i_1 
       (.I0(rptr_bin_reg[1]),
        .I1(rptr_bin_reg[0]),
        .I2(rd_en_IBUF),
        .I3(empty_OBUF),
        .I4(rptr_bin_reg[2]),
        .I5(rptr_bin_reg[3]),
        .O(rptr_bin_next));
  FDCE #(
    .INIT(1'b0)) 
    \rptr_bin_reg[0] 
       (.C(rclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray[2]_i_2_n_0 ),
        .D(rptr_bin_next__0[0]),
        .Q(rptr_bin_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \rptr_bin_reg[1] 
       (.C(rclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray[2]_i_2_n_0 ),
        .D(rptr_bin_next__0[1]),
        .Q(rptr_bin_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \rptr_bin_reg[2] 
       (.C(rclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray[2]_i_2_n_0 ),
        .D(rptr_bin_next__0[2]),
        .Q(rptr_bin_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \rptr_bin_reg[3] 
       (.C(rclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray[2]_i_2_n_0 ),
        .D(rptr_bin_next),
        .Q(rptr_bin_reg[3]));
  (* \PinAttr:I2:HOLD_DETOUR  = "1286" *) 
  LUT4 #(
    .INIT(16'h559A)) 
    \rptr_gray[0]_i_1 
       (.I0(rptr_bin_reg[1]),
        .I1(empty_OBUF),
        .I2(rd_en_IBUF),
        .I3(rptr_bin_reg[0]),
        .O(rptr_gray_next[0]));
  (* \PinAttr:I3:HOLD_DETOUR  = "1134" *) 
  LUT5 #(
    .INIT(32'h66665666)) 
    \rptr_gray[1]_i_1 
       (.I0(rptr_bin_reg[2]),
        .I1(rptr_bin_reg[1]),
        .I2(rptr_bin_reg[0]),
        .I3(rd_en_IBUF),
        .I4(empty_OBUF),
        .O(rptr_gray_next[1]));
  (* \PinAttr:I3:HOLD_DETOUR  = "1373" *) 
  LUT6 #(
    .INIT(64'h6566666666666666)) 
    \rptr_gray[2]_i_1 
       (.I0(rptr_bin_reg[3]),
        .I1(rptr_bin_reg[2]),
        .I2(empty_OBUF),
        .I3(rd_en_IBUF),
        .I4(rptr_bin_reg[0]),
        .I5(rptr_bin_reg[1]),
        .O(rptr_gray_next[2]));
  LUT1 #(
    .INIT(2'h1)) 
    \rptr_gray[2]_i_2 
       (.I0(rrst_n_IBUF),
        .O(\rptr_gray[2]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \rptr_gray_reg[0] 
       (.C(rclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray[2]_i_2_n_0 ),
        .D(rptr_gray_next[0]),
        .Q(rptr_gray[0]));
  FDCE #(
    .INIT(1'b0)) 
    \rptr_gray_reg[1] 
       (.C(rclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray[2]_i_2_n_0 ),
        .D(rptr_gray_next[1]),
        .Q(rptr_gray[1]));
  FDCE #(
    .INIT(1'b0)) 
    \rptr_gray_reg[2] 
       (.C(rclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray[2]_i_2_n_0 ),
        .D(rptr_gray_next[2]),
        .Q(rptr_gray[2]));
  LUT1 #(
    .INIT(2'h1)) 
    \rptr_gray_sync1[3]_i_1 
       (.I0(wrst_n_IBUF),
        .O(\rptr_gray_sync1[3]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \rptr_gray_sync1_reg[0] 
       (.C(wclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray_sync1[3]_i_1_n_0 ),
        .D(rptr_gray[0]),
        .Q(rptr_gray_sync1[0]));
  FDCE #(
    .INIT(1'b0)) 
    \rptr_gray_sync1_reg[1] 
       (.C(wclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray_sync1[3]_i_1_n_0 ),
        .D(rptr_gray[1]),
        .Q(rptr_gray_sync1[1]));
  FDCE #(
    .INIT(1'b0)) 
    \rptr_gray_sync1_reg[2] 
       (.C(wclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray_sync1[3]_i_1_n_0 ),
        .D(rptr_gray[2]),
        .Q(rptr_gray_sync1[2]));
  FDCE #(
    .INIT(1'b0)) 
    \rptr_gray_sync1_reg[3] 
       (.C(wclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray_sync1[3]_i_1_n_0 ),
        .D(rptr_bin_reg[3]),
        .Q(rptr_gray_sync1[3]));
  FDCE #(
    .INIT(1'b0)) 
    \rptr_gray_sync2_reg[0] 
       (.C(wclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray_sync1[3]_i_1_n_0 ),
        .D(rptr_gray_sync1[0]),
        .Q(rptr_gray_sync2[0]));
  FDCE #(
    .INIT(1'b0)) 
    \rptr_gray_sync2_reg[1] 
       (.C(wclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray_sync1[3]_i_1_n_0 ),
        .D(rptr_gray_sync1[1]),
        .Q(rptr_gray_sync2[1]));
  FDCE #(
    .INIT(1'b0)) 
    \rptr_gray_sync2_reg[2] 
       (.C(wclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray_sync1[3]_i_1_n_0 ),
        .D(rptr_gray_sync1[2]),
        .Q(rptr_gray_sync2[2]));
  FDCE #(
    .INIT(1'b0)) 
    \rptr_gray_sync2_reg[3] 
       (.C(wclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray_sync1[3]_i_1_n_0 ),
        .D(rptr_gray_sync1[3]),
        .Q(rptr_gray_sync2[3]));
  IBUF rrst_n_IBUF_inst
       (.I(rrst_n),
        .O(rrst_n_IBUF));
  BUFG wclk_IBUF_BUFG_inst
       (.I(wclk_IBUF),
        .O(wclk_IBUF_BUFG));
  IBUF wclk_IBUF_inst
       (.I(wclk),
        .O(wclk_IBUF));
  IBUF \wdata_IBUF[0]_inst 
       (.I(wdata[0]),
        .O(wdata_IBUF[0]));
  IBUF \wdata_IBUF[1]_inst 
       (.I(wdata[1]),
        .O(wdata_IBUF[1]));
  IBUF \wdata_IBUF[2]_inst 
       (.I(wdata[2]),
        .O(wdata_IBUF[2]));
  IBUF \wdata_IBUF[3]_inst 
       (.I(wdata[3]),
        .O(wdata_IBUF[3]));
  IBUF \wdata_IBUF[4]_inst 
       (.I(wdata[4]),
        .O(wdata_IBUF[4]));
  IBUF \wdata_IBUF[5]_inst 
       (.I(wdata[5]),
        .O(wdata_IBUF[5]));
  IBUF \wdata_IBUF[6]_inst 
       (.I(wdata[6]),
        .O(wdata_IBUF[6]));
  IBUF \wdata_IBUF[7]_inst 
       (.I(wdata[7]),
        .O(wdata_IBUF[7]));
  (* \PinAttr:I2:HOLD_DETOUR  = "1437" *) 
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h9A)) 
    \wptr_bin[0]_i_1 
       (.I0(wptr_bin_reg[0]),
        .I1(full_OBUF),
        .I2(wr_en_IBUF),
        .O(wptr_bin_next__0[0]));
  (* \PinAttr:I1:HOLD_DETOUR  = "1437" *) 
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hF708)) 
    \wptr_bin[1]_i_1 
       (.I0(wptr_bin_reg[0]),
        .I1(wr_en_IBUF),
        .I2(full_OBUF),
        .I3(wptr_bin_reg[1]),
        .O(wptr_bin_next__0[1]));
  (* \PinAttr:I1:HOLD_DETOUR  = "1372" *) 
  LUT5 #(
    .INIT(32'hBFFF4000)) 
    \wptr_bin[2]_i_1 
       (.I0(full_OBUF),
        .I1(wr_en_IBUF),
        .I2(wptr_bin_reg[0]),
        .I3(wptr_bin_reg[1]),
        .I4(wptr_bin_reg[2]),
        .O(wptr_bin_next__0[2]));
  (* \PinAttr:I2:HOLD_DETOUR  = "1075" *) 
  LUT6 #(
    .INIT(64'hFF7FFFFF00800000)) 
    \wptr_bin[3]_i_1 
       (.I0(wptr_bin_reg[1]),
        .I1(wptr_bin_reg[0]),
        .I2(wr_en_IBUF),
        .I3(full_OBUF),
        .I4(wptr_bin_reg[2]),
        .I5(wptr_bin_reg[3]),
        .O(wptr_bin_next));
  FDCE #(
    .INIT(1'b0)) 
    \wptr_bin_reg[0] 
       (.C(wclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray_sync1[3]_i_1_n_0 ),
        .D(wptr_bin_next__0[0]),
        .Q(wptr_bin_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \wptr_bin_reg[1] 
       (.C(wclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray_sync1[3]_i_1_n_0 ),
        .D(wptr_bin_next__0[1]),
        .Q(wptr_bin_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \wptr_bin_reg[2] 
       (.C(wclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray_sync1[3]_i_1_n_0 ),
        .D(wptr_bin_next__0[2]),
        .Q(wptr_bin_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \wptr_bin_reg[3] 
       (.C(wclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray_sync1[3]_i_1_n_0 ),
        .D(wptr_bin_next),
        .Q(wptr_bin_reg[3]));
  (* \PinAttr:I2:HOLD_DETOUR  = "982" *) 
  LUT4 #(
    .INIT(16'h559A)) 
    \wptr_gray[0]_i_1 
       (.I0(wptr_bin_reg[1]),
        .I1(full_OBUF),
        .I2(wr_en_IBUF),
        .I3(wptr_bin_reg[0]),
        .O(wptr_gray_next[0]));
  (* \PinAttr:I3:HOLD_DETOUR  = "1372" *) 
  LUT5 #(
    .INIT(32'h66665666)) 
    \wptr_gray[1]_i_1 
       (.I0(wptr_bin_reg[2]),
        .I1(wptr_bin_reg[1]),
        .I2(wptr_bin_reg[0]),
        .I3(wr_en_IBUF),
        .I4(full_OBUF),
        .O(wptr_gray_next[1]));
  (* \PinAttr:I3:HOLD_DETOUR  = "1330" *) 
  LUT6 #(
    .INIT(64'h6566666666666666)) 
    \wptr_gray[2]_i_1 
       (.I0(wptr_bin_reg[3]),
        .I1(wptr_bin_reg[2]),
        .I2(full_OBUF),
        .I3(wr_en_IBUF),
        .I4(wptr_bin_reg[0]),
        .I5(wptr_bin_reg[1]),
        .O(wptr_gray_next[2]));
  FDCE #(
    .INIT(1'b0)) 
    \wptr_gray_reg[0] 
       (.C(wclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray_sync1[3]_i_1_n_0 ),
        .D(wptr_gray_next[0]),
        .Q(wptr_gray[0]));
  FDCE #(
    .INIT(1'b0)) 
    \wptr_gray_reg[1] 
       (.C(wclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray_sync1[3]_i_1_n_0 ),
        .D(wptr_gray_next[1]),
        .Q(wptr_gray[1]));
  FDCE #(
    .INIT(1'b0)) 
    \wptr_gray_reg[2] 
       (.C(wclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray_sync1[3]_i_1_n_0 ),
        .D(wptr_gray_next[2]),
        .Q(wptr_gray[2]));
  FDCE #(
    .INIT(1'b0)) 
    \wptr_gray_sync1_reg[0] 
       (.C(rclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray[2]_i_2_n_0 ),
        .D(wptr_gray[0]),
        .Q(wptr_gray_sync1[0]));
  FDCE #(
    .INIT(1'b0)) 
    \wptr_gray_sync1_reg[1] 
       (.C(rclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray[2]_i_2_n_0 ),
        .D(wptr_gray[1]),
        .Q(wptr_gray_sync1[1]));
  FDCE #(
    .INIT(1'b0)) 
    \wptr_gray_sync1_reg[2] 
       (.C(rclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray[2]_i_2_n_0 ),
        .D(wptr_gray[2]),
        .Q(wptr_gray_sync1[2]));
  FDCE #(
    .INIT(1'b0)) 
    \wptr_gray_sync1_reg[3] 
       (.C(rclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray[2]_i_2_n_0 ),
        .D(wptr_bin_reg[3]),
        .Q(wptr_gray_sync1[3]));
  FDCE #(
    .INIT(1'b0)) 
    \wptr_gray_sync2_reg[0] 
       (.C(rclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray[2]_i_2_n_0 ),
        .D(wptr_gray_sync1[0]),
        .Q(wptr_gray_sync2[0]));
  FDCE #(
    .INIT(1'b0)) 
    \wptr_gray_sync2_reg[1] 
       (.C(rclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray[2]_i_2_n_0 ),
        .D(wptr_gray_sync1[1]),
        .Q(wptr_gray_sync2[1]));
  FDCE #(
    .INIT(1'b0)) 
    \wptr_gray_sync2_reg[2] 
       (.C(rclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray[2]_i_2_n_0 ),
        .D(wptr_gray_sync1[2]),
        .Q(wptr_gray_sync2[2]));
  FDCE #(
    .INIT(1'b0)) 
    \wptr_gray_sync2_reg[3] 
       (.C(rclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\rptr_gray[2]_i_2_n_0 ),
        .D(wptr_gray_sync1[3]),
        .Q(wptr_gray_sync2[3]));
  IBUF wr_en_IBUF_inst
       (.I(wr_en),
        .O(wr_en_IBUF));
  IBUF wrst_n_IBUF_inst
       (.I(wrst_n),
        .O(wrst_n_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
