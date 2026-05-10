#===================================================
# NEGEDGE ASYNC FIFO CONSTRAINTS - FIXED
# Write Clock: 33 MHz (30 ns period)
# Read Clock: 25 MHz (40 ns period)
#===================================================

# Write clock: 33 MHz (30 ns period)
create_clock -period 30.000 -name wclk -waveform {0.000 15.000} [get_ports wclk]

# Read clock: 25 MHz (40 ns period)
create_clock -period 40.000 -name rclk -waveform {0.000 20.000} [get_ports rclk]

# Clock uncertainty
set_clock_uncertainty -setup 0.300 [get_clocks wclk]
set_clock_uncertainty -hold 0.100 [get_clocks wclk]
set_clock_uncertainty -setup 0.300 [get_clocks rclk]
set_clock_uncertainty -hold 0.100 [get_clocks rclk]

# Asynchronous clock groups
set_clock_groups -asynchronous -group [get_clocks wclk] -group [get_clocks rclk]

# Input delays (write domain)
set_input_delay -clock wclk -max 3.500 [get_ports {wrst_n wr_en}]
set_input_delay -clock wclk -min 2.000 [get_ports {wrst_n wr_en}]
set_input_delay -clock wclk -max 3.500 [get_ports {wdata[*]}]
set_input_delay -clock wclk -min 2.000 [get_ports {wdata[*]}]

# Input delays (read domain)
set_input_delay -clock rclk -max 3.000 [get_ports {rrst_n rd_en}]
set_input_delay -clock rclk -min 2.000 [get_ports {rrst_n rd_en}]

# Output delays
set_output_delay -clock wclk -max 4.000 [get_ports full]
set_output_delay -clock wclk -min 2.000 [get_ports full]

set_output_delay -clock rclk -max 4.000 [get_ports {rdata[*]}]
set_output_delay -clock rclk -min 2.000 [get_ports {rdata[*]}]
set_output_delay -clock rclk -max 4.000 [get_ports empty]
set_output_delay -clock rclk -min 2.000 [get_ports empty]

# False paths
set_false_path -from [get_clocks wclk] -to [get_clocks rclk]
set_false_path -from [get_clocks rclk] -to [get_clocks wclk]
set_false_path -to [get_ports wrst_n]
set_false_path -to [get_ports rrst_n]

# Output load
set_load -max 3.0 [get_ports {rdata[*]}]
set_load -max 3.0 [get_ports full]
set_load -max 3.0 [get_ports empty]

#===================================================
# END
#===================================================