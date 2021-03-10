set origin_dir "."

# Set the project name
set _xil_proj_name_ "lab1_proj"

variable script_file
set script_file "lab1_proj.tcl"

# Set the directory path for the original project from where this script was exported
set orig_proj_dir "[file normalize "$origin_dir/$_xil_proj_name_"]"


# Get random FPGA part:
set fpga_part [lindex [get_parts] 0]

# Create project
create_project ${_xil_proj_name_} ./${_xil_proj_name_} -part ${fpga_part}

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Set project properties
set obj [current_project]
set_property -name "default_lib" -value "xil_defaultlib" -objects $obj
set_property -name "enable_vhdl_2008" -value "1" -objects $obj
set_property -name "ip_cache_permissions" -value "read write" -objects $obj
set_property -name "ip_output_repo" -value "$proj_dir/${_xil_proj_name_}.cache/ip" -objects $obj
set_property -name "mem.enable_memory_map_generation" -value "1" -objects $obj
set_property -name "part" -value ${fpga_part} -objects $obj
set_property -name "sim.central_dir" -value "$proj_dir/${_xil_proj_name_}.ip_user_files" -objects $obj
set_property -name "sim.ip.auto_export_scripts" -value "1" -objects $obj
set_property -name "simulator_language" -value "Mixed" -objects $obj
set_property -name "target_language" -value "VHDL" -objects $obj
set_property -name "webtalk.xsim_launch_sim" -value "10" -objects $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}
# Set 'sources_1' fileset object
set obj [get_filesets sources_1]

## src files 
set hdl_list [glob -nocomplain ./src]
if {[llength $hdl_list] == 0} {
  puts "INFO: no src files in board"
} else {
  add_files -fileset sources_1 -norecurse $hdl_list
} 

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -srcset sim_1
}
# Set 'sim_1' fileset object
set obj [get_filesets sim_1]

## tb src files 
set tb_hdl_list [glob -nocomplain ./tb]
if {[llength $tb_hdl_list] == 0} {
  puts "INFO: no tb src files in board"
} else {
  add_files -fileset sim_1 -norecurse $tb_hdl_list
}

puts "INFO: Project created:${_xil_proj_name_}"
