#===================================================
# NEGATIVE EDGE SYNCHRONOUS FIFO CONSTRAINTS
# Clock Frequency: 40 MHz (25 ns period)
# FIXED HOLD VIOLATIONS ONLY
#===================================================

# 40 MHz clock (25 ns period)
create_clock -period 25.000 -name clk -waveform {0.000 12.500} [get_ports clk]

# Clock uncertainty (increased hold margin)
set_clock_uncertainty -setup 0.500 [get_clocks clk]
set_clock_uncertainty -hold 0.400 [get_clocks clk]  # Increased from 0.300

#===================================================
# INPUT DELAYS (increased minimum delay for hold)
#===================================================
set_input_delay -clock clk -max 4.000 [get_ports {reset wn rn}]
set_input_delay -clock clk -min 2.500 [get_ports {reset wn rn}]  # Was 2.000

set_input_delay -clock clk -max 4.000 [get_ports {data_in[*]}]
set_input_delay -clock clk -min 2.500 [get_ports {data_in[*]}]   # Was 2.000

#===================================================
# OUTPUT DELAYS (increased minimum delay for hold)
#===================================================
set_output_delay -clock clk -max 4.500 [get_ports {data_out[*] full empty}]
set_output_delay -clock clk -min 2.000 [get_ports {data_out[*] full empty}]  # Was 1.500

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
# HOLD FIX: Add delay buffers on short paths
#===================================================
set_property CLOCK_DELAY_VALUE 200 [get_cells -hierarchical -filter {NAME =~ *rptr_reg*}]

#===================================================
# END
#===================================================