package require ::quartus::project


set project_name ep2c5_lvds
set current_revision [get_current_revision $project_name]


project_open -revision $current_revision $project_name

#SourceList
source models/verify_timing_for_ddr.tcl
#EndSourceList
