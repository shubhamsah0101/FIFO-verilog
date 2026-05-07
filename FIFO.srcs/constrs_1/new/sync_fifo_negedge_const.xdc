#===================================================
# NEGATIVE EDGE SYNCHRONOUS FIFO CONSTRAINTS
#===================================================

# Clock Definition
create_clock -period 25.000 \
             -name clk \
             -waveform {0.000 10.000} \
             [get_ports clk]

#===================================================
# Clock Uncertainty
#===================================================

set_clock_uncertainty -setup 0.2 [get_clocks clk]
set_clock_uncertainty -hold  0.02 [get_clocks clk]

#===================================================
# Input Delays
#===================================================

set_input_delay -clock clk -max 2.0 \
[get_ports {rst wr_en rd_en data_in[*]}]

set_input_delay -clock clk -min 0.0 \
[get_ports {rst wr_en rd_en data_in[*]}]

#===================================================
# Output Delays
#===================================================

set_output_delay -clock clk -max 2.0 \
[get_ports {data_out[*] full empty}]

set_output_delay -clock clk -min 0.0 \
[get_ports {data_out[*] full empty}]

#===================================================
# Reset False Path
#===================================================

set_false_path -from [get_ports rst]
set_false_path -to   [get_ports rst]

#===================================================
# Automatic Hold Fix
#===================================================

set_fix_hold [get_clocks clk]

#===================================================
# END
#===================================================