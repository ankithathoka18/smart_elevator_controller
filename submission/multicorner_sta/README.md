# Timing Analysis Evidence

This directory contains timing reports copied from the existing OpenLane
run, available Sky130 timing-library filenames, and design-file inventory.

## Status
- Existing synthesis, placement, CTS, routing, and RCX timing reports are
  collected where available.
- Reports from different flow stages are not automatically separate PVT
  corners.
- A genuine multi-corner STA run has not been confirmed by this collection
  step.
- Do not claim 16-corner timing closure without a run log and results for
  each analyzed corner.
- The existing 10 ns clock constraint is recorded in the project SDC.

See `sta_evidence_review.txt` for a keyword-based review of the collected
reports. This review is not itself a timing analysis.
