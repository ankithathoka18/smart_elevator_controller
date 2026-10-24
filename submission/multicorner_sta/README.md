# Multi-corner STA preparation

This folder records the available Sky130 timing libraries, design files,
constraints, and previously generated OpenLane timing reports.

Important:
- Listing a Liberty file does not mean its corner was analyzed.
- Existing single-corner reports are not evidence of 16-corner STA.
- Multi-corner closure must only be claimed after running STA with a
  valid library, matching design netlist, constraints, and parasitics
  for each selected PVT corner.
- Review the report headers and logs before reporting any slack values.
