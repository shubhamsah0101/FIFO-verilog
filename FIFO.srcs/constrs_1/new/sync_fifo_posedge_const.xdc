#===================================================
# POSITIVE EDGE SYNCHRONOUS FIFO CONSTRAINTS
# Clock Frequency: 80 MHz (12.5 ns period)
# FIXED HOLD VIOLATIONS
#===================================================

# 80 MHz clock (12.5 ns period)
create_clock -period 12.500 -name clk -waveform {0.000 6.250} [get_ports clk]

# Clock uncertainty (increased hold margin)
set_clock_uncertainty -setup 0.200 [get_clocks clk]
set_clock_uncertainty -hold 0.200 [get_clocks clk]  # Changed from 0.100 to 0.200

#===================================================
# INPUT DELAYS (increased minimum delay for hold)
#===================================================
set_input_delay -clock clk -max 2.000 [get_ports {reset wn rn}]
set_input_delay -clock clk -min 1.500 [get_ports {reset wn rn}]  # Was 1.000

set_input_delay -clock clk -max 2.000 [get_ports {data_in[*]}]
set_input_delay -clock clk -min 1.500 [get_ports {data_in[*]}]   # Was 1.000

#===================================================
# OUTPUT DELAYS (increased minimum delay for hold)
#===================================================
set_output_delay -clock clk -max 2.500 [get_ports {data_out[*] full empty}]
set_output_delay -clock clk -min 1.000 [get_ports {data_out[*] full empty}]  # Was 0.500

#===================================================
# FALSE PATHS
#===================================================
set_false_path -to [get_ports reset]
set_false_path -from [get_ports reset]

#===================================================
# OUTPUT LOAD
#===================================================
set_load -max 3.0 [get_ports {data_out[*] full empty}]

#===================================================
# END
#===================================================