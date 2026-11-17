if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name fast_lib\
   -timing\
    [list ${::IMEX::libVar}/mmmc/fast_vdd1v2_basicCells.lib\
    ${::IMEX::libVar}/mmmc/fast_vdd1v2_extvdd1v2.lib\
    ${::IMEX::libVar}/mmmc/fast_vdd1v2_multibitsDFF.lib\
    ${::IMEX::libVar}/mmmc/fast_vdd1v2_extvdd1v0.lib\
    ${::IMEX::libVar}/mmmc/fast_vdd1v2_basicCells_lvt.lib]
create_rc_corner -name rc_typ\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T 25
create_delay_corner -name dc_fast\
   -library_set fast_lib\
   -rc_corner rc_typ
create_constraint_mode -name my_constraints\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/my_constraints/my_constraints.sdc]
create_analysis_view -name av_fast -constraint_mode my_constraints -delay_corner dc_fast -latency_file ${::IMEX::dataVar}/mmmc/views/av_fast/latency.sdc
set_analysis_view -setup [list av_fast] -hold [list av_fast]
catch {set_interactive_constraint_mode [list my_constraints] } 
