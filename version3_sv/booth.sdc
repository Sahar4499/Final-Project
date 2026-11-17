create_clock -name vclk -period 5.0
set_input_delay 0.1 -clock vclk [all_inputs]
set_output_delay 0.1 -clock vclk [all_outputs]
set_max_delay 5.0 -from [all_inputs] -to [all_outputs]
