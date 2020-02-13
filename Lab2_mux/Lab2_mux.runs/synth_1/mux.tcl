# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /home/ecelrc/students/cjanecka/EE316L/Lab2_mux/Lab2_mux.cache/wt [current_project]
set_property parent.project_path /home/ecelrc/students/cjanecka/EE316L/Lab2_mux/Lab2_mux.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib /home/ecelrc/students/cjanecka/EE316L/Lab2_mux/Lab2_mux.srcs/sources_1/new/mux.v
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/ecelrc/students/cjanecka/EE316L/Lab2_mux/Lab2_mux.srcs/constrs_1/imports/files/mux_constrs.xdc
set_property used_in_implementation false [get_files /home/ecelrc/students/cjanecka/EE316L/Lab2_mux/Lab2_mux.srcs/constrs_1/imports/files/mux_constrs.xdc]


synth_design -top mux -part xc7a35tcpg236-1


write_checkpoint -force -noxdef mux.dcp

catch { report_utilization -file mux_utilization_synth.rpt -pb mux_utilization_synth.pb }