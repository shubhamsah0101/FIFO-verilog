set_property SRC_FILE_INFO {cfile:D:/RTL_Design/FIFO/FIFO.srcs/constrs_1/new/sync_fifo_posedge_const.xdc rfile:../../../FIFO.srcs/constrs_1/new/sync_fifo_posedge_const.xdc id:1} [current_design]
set_property SRC_FILE_INFO {cfile:D:/RTL_Design/FIFO/FIFO.srcs/constrs_1/new/sync_fifo_negedge_const.xdc rfile:../../../FIFO.srcs/constrs_1/new/sync_fifo_negedge_const.xdc id:2} [current_design]
set_property src_info {type:XDC file:1 line:11 export:INPUT save:INPUT read:READ} [current_design]
set_clock_uncertainty -setup 0.200 [get_clocks clk]
set_property src_info {type:XDC file:1 line:12 export:INPUT save:INPUT read:READ} [current_design]
set_clock_uncertainty -hold 0.200 [get_clocks clk]  # Changed from 0.100 to 0.200
set_property src_info {type:XDC file:1 line:18 export:INPUT save:INPUT read:READ} [current_design]
set_input_delay -clock clk -min 1.500 [get_ports {reset wn rn}]  # Was 1.000
set_property src_info {type:XDC file:1 line:21 export:INPUT save:INPUT read:READ} [current_design]
set_input_delay -clock clk -min 1.500 [get_ports {data_in[*]}]   # Was 1.000
set_property src_info {type:XDC file:1 line:27 export:INPUT save:INPUT read:READ} [current_design]
set_output_delay -clock clk -min 1.000 [get_ports {data_out[*] full empty}]  # Was 0.500
set_property src_info {type:XDC file:1 line:32 export:INPUT save:INPUT read:READ} [current_design]
set_false_path -to [get_ports reset]
set_property src_info {type:XDC file:1 line:38 export:INPUT save:INPUT read:READ} [current_design]
set_load -max 3.0 [get_ports {data_out[*] full empty}]
set_property src_info {type:XDC file:2 line:11 export:INPUT save:INPUT read:READ} [current_design]
set_clock_uncertainty -setup 0.500 [get_clocks clk]
set_property src_info {type:XDC file:2 line:12 export:INPUT save:INPUT read:READ} [current_design]
set_clock_uncertainty -hold 0.400 [get_clocks clk]  # Increased from 0.300
set_property src_info {type:XDC file:2 line:18 export:INPUT save:INPUT read:READ} [current_design]
set_input_delay -clock clk -min 2.500 [get_ports {reset wn rn}]  # Was 2.000
set_property src_info {type:XDC file:2 line:21 export:INPUT save:INPUT read:READ} [current_design]
set_input_delay -clock clk -min 2.500 [get_ports {data_in[*]}]   # Was 2.000
set_property src_info {type:XDC file:2 line:27 export:INPUT save:INPUT read:READ} [current_design]
set_output_delay -clock clk -min 2.000 [get_ports {data_out[*] full empty}]  # Was 1.500
set_property src_info {type:XDC file:2 line:32 export:INPUT save:INPUT read:READ} [current_design]
set_false_path -to [get_ports reset]
set_property src_info {type:XDC file:2 line:38 export:INPUT save:INPUT read:READ} [current_design]
set_load -max 3.0 [get_ports {data_out[*] full empty}]
set_property src_info {type:XDC file:2 line:43 export:INPUT save:INPUT read:READ} [current_design]
set_property CLOCK_DELAY_VALUE 200 [get_cells -hierarchical -filter {NAME =~ *rptr_reg*}]
