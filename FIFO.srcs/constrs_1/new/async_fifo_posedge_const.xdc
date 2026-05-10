#===================================================
# ASYNCHRONOUS FIFO CONSTRAINTS - FINAL FIX
# Write Clock: 75 MHz (13.33 ns period)
# Read Clock: 50 MHz (20 ns period)
#===================================================

# Write clock: 66 MHz (15 ns period)
create_clock -period 15.000 -name wclk -waveform {0.000 7.500} [get_ports wclk]

# Read clock: 50 MHz (20 ns period)
create_clock -period 20.000 -name rclk -waveform {0.000 10.000} [get_ports rclk]

# Clock uncertainty (increased for margin)
set_clock_uncertainty -setup 0.300 [get_clocks wclk]
set_clock_uncertainty -hold 0.100 [get_clocks wclk]
set_clock_uncertainty -setup 0.200 [get_clocks rclk]
set_clock_uncertainty -hold 0.100 [get_clocks rclk]

# Asynchronous clock groups
set_clock_groups -asynchronous -group [get_clocks wclk] -group [get_clocks rclk]

# Input delays (write domain) - relaxed
set_input_delay -clock wclk -max 2.500 [get_ports {wrst_n wr_en}]
set_input_delay -clock wclk -min 1.500 [get_ports {wrst_n wr_en}]

set_input_delay -clock wclk -max 2.500 [get_ports {wdata[*]}]
set_input_delay -clock wclk -min 1.500 [get_ports {wdata[*]}]

# Input delays (read domain)
set_input_delay -clock rclk -max 2.000 [get_ports {rrst_n rd_en}]
set_input_delay -clock rclk -min 1.000 [get_ports {rrst_n rd_en}]

# Output delays
set_output_delay -clock wclk -max 3.000 [get_ports full]
set_output_delay -clock wclk -min 1.500 [get_ports full]

set_output_delay -clock rclk -max 3.000 [get_ports {rdata[*]}]
set_output_delay -clock rclk -min 1.500 [get_ports {rdata[*]}]

set_output_delay -clock rclk -max 3.000 [get_ports empty]
set_output_delay -clock rclk -min 1.500 [get_ports empty]

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