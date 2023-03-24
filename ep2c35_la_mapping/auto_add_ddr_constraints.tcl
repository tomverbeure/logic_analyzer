package require ::quartus::project


set project_name ep2c5_lvds
set current_revision [get_current_revision $project_name]


project_open -revision $current_revision $project_name

#SourceList
source models/add_constraints_for_ddr.tcl
#EndSourceList
set_global_assignment -name PRE_FLOW_SCRIPT_FILE quartus_sh:auto_add_ddr_constraints.tcl -remove
export_assignments
