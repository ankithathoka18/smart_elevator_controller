# Smart Elevator Controller - STA setup
# Initial single-corner validation only

set lib "/build/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib"
set netlist "/work/input/elevator_controller.v"
set sdc "/work/input/elevator_controller.sdc"

read_liberty $lib
read_verilog $netlist
link_design elevator_controller
read_sdc $sdc

report_checks -path_delay max
report_checks -path_delay min
report_worst_slack -max
report_worst_slack -min

exit
