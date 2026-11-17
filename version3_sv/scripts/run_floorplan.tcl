# 1. Define Design Inputs
set init_verilog ../synthesis/systolic_array_netlist.v
set init_top_cell systolic_array_2x2
set init_pwr_net VDD
set init_gnd_net VSS

# 2. Define Physical Libraries (LEF)
# שימוש בנתיב הסטנדרטי של ספריית LVT ב-gpdk45
set init_lef_file { /tech/cadence/gpdk45/gsclib045_all_v4.4/gsclib045_lvt/lef/gsclib045_lvt.lef }

# 3. Define Timing Setup
set init_mmmc_file ../scripts/mmmc.tcl

# 4. Initialize Design
init_design

# 5. Execute Floorplan
# floorPlan -r <aspect_ratio> <density> <margin_left> <margin_bottom> <margin_right> <margin_top>
floorPlan -r 1.0 0.7 10 10 10 10

# 6. Save the Design Database
saveDesign systolic_array_fp.enc
puts "Floorplan finished and design saved!"
