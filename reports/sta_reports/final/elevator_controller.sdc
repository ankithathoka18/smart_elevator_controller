###############################################################################
# Created by write_sdc
# Sat Oct 24 09:35:36 2026
###############################################################################
current_design elevator_controller
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 10.0000 [get_ports {clk}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_propagated_clock [get_clocks {clk}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {request_valid}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {requested_floor[0]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {requested_floor[1]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {reset}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {busy}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {current_floor[0]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {current_floor[1]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {door_open}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {moving_down}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {moving_up}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {busy}]
set_load -pin_load 0.0334 [get_ports {door_open}]
set_load -pin_load 0.0334 [get_ports {moving_down}]
set_load -pin_load 0.0334 [get_ports {moving_up}]
set_load -pin_load 0.0334 [get_ports {current_floor[1]}]
set_load -pin_load 0.0334 [get_ports {current_floor[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {request_valid}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {reset}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {requested_floor[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {requested_floor[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_transition 0.7500 [current_design]
set_max_fanout 10.0000 [current_design]
