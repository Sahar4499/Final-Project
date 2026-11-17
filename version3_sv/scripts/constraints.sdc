Create a 1GHz clock (1.0ns period)
create_clock -name clk -period 1.0 [get_ports clk]

#Add some realistic clock jitter/skew uncertainty (100ps)
set_clock_uncertainty 0.1 [get_clocks clk]

# Define input/output path delays (forces Genus to optimize the internal logic even more)
set_input_delay -max 0.2 -clock clk [all_inputs]
set_output_delay -max 0.2 -clock clk [all_outputs]
