# 1. Setup Library Paths (Fast LVT for max performance)
set_db library /tech/cadence/gpdk45/gsclib045_all_v4.4/gsclib045_lvt/timing/fast_vdd1v2_basicCells_lvt.lib

# 2. Read SystemVerilog RTL Files
read_hdl -sv ../booth_bit_cell.sv
read_hdl -sv ../booth_encoder.sv
read_hdl -sv ../full_adder.sv
read_hdl -sv ../csa_layer_32bit.sv
read_hdl -sv ../ripple_adder_32bit.sv
read_hdl -sv ../booth_partial_product_8bit.sv
read_hdl -sv ../mult8x8.sv
read_hdl -sv ../mult16x16_hierarchical.sv
read_hdl -sv ../booth_multiplier_8x8.sv
read_hdl -sv ../pe.sv
read_hdl -sv ../systolic_array_2x2.sv

# 3. Elaborate the Top Module
elaborate systolic_array_2x2

# 4. Apply Timing Constraints (SDC)
read_sdc ../scripts/constraints.sdc

# 5. Synthesis Execution
syn_generic
syn_map
syn_opt

# 6. Export Results
write_hdl > ../synthesis/systolic_array_netlist.v
write_sdc > ../synthesis/systolic_array_constraints.sdc
report_timing > ../synthesis/timing_report.rpt
report_area > ../synthesis/area_report.rpt
report_power > ../synthesis/power_report.rpt

puts "Synthesis Finished Successfully!"
