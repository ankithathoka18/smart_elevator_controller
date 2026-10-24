# Smart Elevator Controller — VLSI Project

## Overview
This project implements a smart elevator controller using Verilog HDL. The design was simulated and taken through an RTL-to-GDS physical-design flow using OpenLane and the Sky130 standard-cell library.

## Tools Used
- Verilog HDL
- Icarus Verilog and GTKWave
- Yosys
- OpenLane
- OpenROAD and OpenSTA
- Sky130 PDK
- KLayout

## Project Structure
- `rtl/` — Elevator controller RTL
- `tb/` — Verilog testbench
- `sim/` — Simulation results and waveforms
- `physical_design/` — Configuration and final GDS layout
- `reports/` — Final project report
- `screenshots/` — Evidence of simulation and layout
- `submission/` — Submission files and timing reports

## Verification
The testbench completed with the message `ALL TESTS PASSED`.

## Physical Design
The OpenLane flow completed successfully and generated the final GDS layout. The recorded run reported no DRC violations after GDS streaming out. The available LVS logs reported that the circuits matched uniquely. Timing reports showed positive setup and hold slack under the applied constraints.

## Main Output
`physical_design/elevator_controller.gds`

## Notes
Timing and physical verification results depend on the constraints, process corner, and tool configuration used. Review the included reports when evaluating the results.
