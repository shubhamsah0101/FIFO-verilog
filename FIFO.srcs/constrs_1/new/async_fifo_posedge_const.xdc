#===================================================
# NEGATIVE EDGE ASYNCHRONOUS FIFO CONSTRAINTS
# Write Clock: 33 MHz (30 ns period)
# Read Clock: 25 MHz (40 ns period)
# Active Edge: Falling Edge (negedge)
#===================================================

# Write clock: 33 MHz (30 ns period)
# For negedge, waveform: rising at 0ns, falling at 15ns
create_clock -period 30.000 -name wclk -waveform {0.000 15.000} [get_ports wclk]

# Read clock: 25 MHz (40 ns period)
create_clock -period 40.000 -name rclk -waveform {0.000 20.000} [get_ports rclk]

#===================================================
# CLOCK UNCERTAINTY
#===================================================
set_clock_uncertainty -setup 0.300 [get_clocks wclk]
set_clock_uncertainty -hold 0.150 [get_clocks wclk]
set_clock_uncertainty -setup 0.300 [get_clocks rclk]
set_clock_uncertainty -hold 0.150 [get_clocks rclk]

#===================================================
# ASYNCHRONOUS CLOCK GROUPS
#===================================================
set_clock_groups -asynchronous -group [get_clocks wclk] -group [get_clocks rclk]

#===================================================
# INPUT DELAYS (Write Domain)
#===================================================
set_input_delay -clock wclk -max 4.000 [get_ports {wrst_n wr_en}]
set_input_delay -clock wclk -min 2.000 [get_ports {wrst_n wr_en}]

set_input_delay -clock wclk -max 4.000 [get_ports {wdata[*]}]
set_input_delay -clock wclk -min 2.000 [get_ports {wdata[*]}]

#===================================================
# INPUT DELAYS (Read Domain)
#===================================================
set_input_delay -clock rclk -max 5.000 [get_ports {rrst_n rd_en}]
set_input_delay -clock rclk -min 2.000 [get_ports {rrst_n rd_en}]

#===================================================
# OUTPUT DELAYS
#===================================================
set_output_delay -clock wclk -max 5.000 [get_ports full]
set_output_delay -clock wclk -min 2.000 [get_ports full]

set_output_delay -clock rclk -max 5.000 [get_ports {rdata[*]}]
set_output_delay -clock rclk -min 2.000 [get_ports {rdata[*]}]

set_output_delay -clock rclk -max 5.000 [get_ports empty]
set_output_delay -clock rclk -min 2.000 [get_ports empty]

#===================================================
# FALSE PATHS (Cross-domain and resets)
#===================================================
set_false_path -from [get_clocks wclk] -to [get_clocks rclk]
set_false_path -from [get_clocks rclk] -to [get_clocks wclk]
set_false_path -to [get_ports wrst_n]
set_false_path -to [get_ports rrst_n]

#===================================================
# OUTPUT LOAD
#===================================================
set_load -max 5.0 [get_ports {rdata[*]}]
set_load -max 5.0 [get_ports full]
set_load -max 5.0 [get_ports empty]

#===================================================
# END
#===================================================