if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name lib_fast\
   -timing\
    [list ${::IMEX::libVar}/mmmc/NangateOpenCellLibrary_fast.lib]\
   -si\
    [list ${::IMEX::libVar}/mmmc/fast.cdb]
create_library_set -name lib_slow\
   -timing\
    [list ${::IMEX::libVar}/mmmc/NangateOpenCellLibrary_slow.lib]\
   -si\
    [list ${::IMEX::libVar}/mmmc/slow.cdb]
create_rc_corner -name rc_best\
   -cap_table ${::IMEX::libVar}/mmmc/best.captbl\
   -preRoute_res 1.34236\
   -postRoute_res 1.34236\
   -preRoute_cap 1.10066\
   -postRoute_cap 0.960234\
   -postRoute_xcap 1.22327\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -postRoute_clkcap {0.969117 0 0}\
   -T 0\
   -qx_tech_file ${::IMEX::libVar}/mmmc/rc_best/best.tch
create_rc_corner -name rc_worst\
   -cap_table ${::IMEX::libVar}/mmmc/worst.captbl\
   -preRoute_res 1.34236\
   -postRoute_res 1.34236\
   -preRoute_cap 1.10066\
   -postRoute_cap 0.960234\
   -postRoute_xcap 1.22327\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -postRoute_clkcap {0.969117 0 0}\
   -T 125\
   -qx_tech_file ${::IMEX::libVar}/mmmc/rc_worst/worst.tch
create_delay_corner -name delay_corner_slow\
   -library_set lib_slow\
   -rc_corner rc_worst
create_delay_corner -name delay_corner_fast\
   -library_set lib_fast\
   -rc_corner rc_best
create_constraint_mode -name constraint_slow\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/constraint_slow/constraint_slow.sdc]
create_analysis_view -name analysis_fast -constraint_mode constraint_slow -delay_corner delay_corner_fast -latency_file ${::IMEX::dataVar}/mmmc/views/analysis_fast/latency.sdc
create_analysis_view -name analysis_slow -constraint_mode constraint_slow -delay_corner delay_corner_slow -latency_file ${::IMEX::dataVar}/mmmc/views/analysis_slow/latency.sdc
set_analysis_view -setup [list analysis_slow] -hold [list analysis_fast]
