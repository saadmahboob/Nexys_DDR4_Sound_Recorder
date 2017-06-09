# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/eric/Documents/Vivado/final/final.cache/wt [current_project]
set_property parent.project_path /home/eric/Documents/Vivado/final/final.xpr [current_project]
set_property XPM_LIBRARIES XPM_MEMORY [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo /home/eric/Documents/Vivado/final/final.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  /home/eric/Documents/Vivado/final/final.srcs/sources_1/new/decode.v
  /home/eric/Documents/Vivado/final/final.srcs/sources_1/new/mem_counter.v
  /home/eric/Documents/Vivado/final/final.srcs/sources_1/new/mic_in.v
  /home/eric/Documents/Vivado/final/final.srcs/sources_1/new/pwm_gen.v
  /home/eric/Documents/Vivado/final/final.srcs/sources_1/new/state_machine.v
  /home/eric/Documents/Vivado/final/final.srcs/sources_1/new/main.v
}
read_ip -quiet /home/eric/Documents/Vivado/final/final.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0.xci
set_property used_in_implementation false [get_files -all /home/eric/Documents/Vivado/final/final.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_ooc.xdc]
set_property is_locked true [get_files /home/eric/Documents/Vivado/final/final.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0.xci]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/eric/Documents/Vivado/final/final.srcs/constrs_1/new/constraints.xdc
set_property used_in_implementation false [get_files /home/eric/Documents/Vivado/final/final.srcs/constrs_1/new/constraints.xdc]


synth_design -top main -part xc7a100tcsg324-1


write_checkpoint -force -noxdef main.dcp

catch { report_utilization -file main_utilization_synth.rpt -pb main_utilization_synth.pb }
