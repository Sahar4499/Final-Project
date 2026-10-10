# ####################################################################

#  Created by Genus(TM) Synthesis Solution 25.11-s095_1 on Sat Jul 18 07:41:43 UTC 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design booth_multiplier_8x8

set_clock_gating_check -setup 0.0 
set_wire_load_mode "enclosed"
