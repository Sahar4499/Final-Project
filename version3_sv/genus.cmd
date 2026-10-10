# Cadence Genus(TM) Synthesis Solution, Version 25.11-s095_1, built Aug 12 2025 10:59:05

# Date: Sat Aug 01 07:58:49 2026
# Host: ip-10-10-71-30.il-central-1.compute.internal (x86_64 w/Linux 4.18.0-553.79.1.el8_10.x86_64) (1core*2cpus*1physical cpu*Intel(R) Xeon(R) Platinum 8375C CPU @ 2.90GHz 55296KB)
# OS:   Rocky Linux 8.10 (Green Obsidian)

read_libs {
    /tech/cadence/gpdk45/gsclib045_all_v4.4/liberty/gsclib045_fast.lib
    /tech/cadence/gpdk45/gsclib045_all_v4.4/liberty/gsclib045_slow.lib
}
read_libs {
    /tech/cadence/gpdk45/gsclib045_all_v4.4/gsclib045/timing/fast_vdd1v0_basicCells.lib
    /tech/cadence/gpdk45/gsclib045_all_v4.4/gsclib045/timing/slow_vdd1v0_basicCells.lib
}
read_physical -lef {
    /tech/cadence/gpdk45/gsclib045_all_v4.4/gsclib045/lef/gsclib045.lef
}
read_physical -lef {
    /tech/cadence/gpdk45/gsclib045_all_v4.4/gsclib045/lef/gsclib045_tech.lef
    /tech/cadence/gpdk45/gsclib045_all_v4.4/gsclib045/lef/gsclib045_macro.lef
    /tech/cadence/gpdk45/gsclib045_all_v4.4/gsclib045/lef/gsclib045_multibitsDFF.lef
}
read_physical -lef {
    /tech/cadence/gpdk45/gsclib045_all_v4.4/gsclib045/lef/gsclib045_tech.lef
    /tech/cadence/gpdk45/gsclib045_all_v4.4/gsclib045/lef/gsclib045_macro.lef
}
read_hdl -sv {~/RTL_to_GDSII_Project/Final-Project/version3_sv/booth_multiplier_8x8.sv}
elaborate
read_sdc ~/RTL_to_GDSII_Project/Final-Project/version3_sv/synthesis/constraints.sdc
synthesize -to_mapped
read_hdl -sv {
    ~/RTL_to_GDSII_Project/Final-Project/version3_sv/booth_multiplier_8x8.sv
    ~/RTL_to_GDSII_Project/Final-Project/version3_sv/booth_encoder.sv
    ~/RTL_to_GDSII_Project/Final-Project/version3_sv/booth_partial_product_8bit.sv
    ~/RTL_to_GDSII_Project/Final-Project/version3_sv/csa_layer_32bit.sv
    ~/RTL_to_GDSII_Project/Final-Project/version3_sv/ripple_adder_32bit.sv
}
elaborate
create_clock -name clk -period 10.0 [get_ports clk]
ungroup -all -flatten
cd booth_multiplier_8x8_1
delete_obj [get_designs *]
read_hdl -sv {
    ~/RTL_to_GDSII_Project/Final-Project/version3_sv/booth_multiplier_8x8.sv
    ~/RTL_to_GDSII_Project/Final-Project/version3_sv/booth_encoder.sv
    ~/RTL_to_GDSII_Project/Final-Project/version3_sv/booth_partial_product_8bit.sv
    ~/RTL_to_GDSII_Project/Final-Project/version3_sv/csa_layer_32bit.sv
    ~/RTL_to_GDSII_Project/Final-Project/version3_sv/ripple_adder_32bit.sv
    ~/RTL_to_GDSII_Project/Final-Project/version3_sv/booth_bit_cell.sv
    ~/RTL_to_GDSII_Project/Final-Project/version3_sv/full_adder.sv
}
elaborate booth_multiplier_8x8
current_design booth_multiplier_8x8
create_clock -name clk -period 10.0 [get_ports clk]
syn_gen
syn_map
syn_opt
write_hdl > ~/RTL_to_GDSII_Project/Final-Project/version3_sv/synthesis/multiplier_netlist.v
write_sdc > ~/RTL_to_GDSII_Project/Final-Project/version3_sv/synthesis/multiplier_constraints.sdc
report_area
report_timing
cheak_design
check_design
write_hdl > ~/RTL_to_GDSII_Project/Final-Project/version3_sv/synthesis/multiplier_netlist.v
write_sdc > ~/RTL_to_GDSII_Project/Final-Project/version3_sv/synthesis/multiplier_constraints.sdc
exit
