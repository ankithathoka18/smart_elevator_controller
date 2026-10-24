# Static Timing Analysis (STA) Reports

This folder contains timing reports from the Smart Elevator Controller physical-design flow.

## Available Reports

- `8-gpl_sta.summary.rpt` — Global placement timing summary.
- `8-gpl_sta.max.rpt` — Maximum-delay timing report at placement.
- `21-grt_sta.summary.rpt` — Global-routing timing summary.
- `21-grt_sta.max.rpt` — Maximum-delay timing report after global routing.
- `21-grt_sta.min.rpt` — Minimum-delay timing report after global routing.
- `final/` — Additional final-stage timing reports.
- `16_corners/` — Files prepared for multi-corner timing analysis.
- `16-rsz/` — Resizing-stage reports.
- `liberty_corner_list.txt` — List of timing-library corner files.

## Important Note

The presence of files in `16_corners/` does not by itself prove that a complete 16-corner STA analysis was executed. Report actual corner coverage and setup/hold slack only after verifying the corresponding run logs.

## Flow

RTL synthesis → placement → global routing → timing analysis.
