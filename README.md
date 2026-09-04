# FIFO-Verilog: A Verified Comparative Analysis of Synchronous and Asynchronous FIFO Designs

Verilog HDL implementations of four FIFO variants — synchronous and asynchronous, each with positive- and negative-edge triggering — rigorously verified and benchmarked under a single, consistent methodology in AMD Vivado.

## Key Finding

During development, the original asynchronous FIFO implementation was found to synchronize **raw binary pointers** across clock domains — a known clock-domain-crossing (CDC) hazard, since multiple bits of a binary counter can change simultaneously, meaning a synchronizer cannot guarantee the sampled value ever existed as a valid state in the source domain. One variant additionally used only a **single-stage** synchronizer rather than the standard dual-flip-flop scheme.

This was identified, corrected to a standard **Gray-code pointer + dual-flip-flop synchronizer** design, and verified with self-checking testbenches before any result in this repository or the paper was generated. All four corrected variants passed functional verification with **zero data mismatches** across clock domains.

## FIFO Variants

| Variant | File | Clock domains | Pointer encoding | Synchronizer |
|---|---|---|---|---|
| Synchronous (positive edge) | `sync_fifo_posedge.v` | 1 | Binary | — |
| Synchronous (negative edge) | `sync_fifo_negedge.v` | 1 | Binary | — |
| Asynchronous (positive edge) | `async_fifo_posedge.v` | 2 (`wclk`, `rclk`) | Gray | 2-stage (dual-FF) |
| Asynchronous (negative edge) | `async_fifo_negedge.v` | 2 (`wclk`, `rclk`) | Gray | 2-stage (dual-FF) |

All variants implement an 8-entry, 8-bit-wide FIFO with standard full/empty status flags. Within each circuit type, the positive- and negative-edge variants are architecturally identical, differing only in the active clock edge — this isolates the effect of edge polarity from confounding layout differences.

## Results

Synthesized and implemented in **AMD Vivado 2023.3**, targeting the **Xilinx Artix-7 `xc7a35tcpg236-1`** device (same target device across all four variants for a fair comparison).

### Resource Utilization and Timing

| Variant | LUT | FF | BUFG | IOB | WNS (ns) |
|---|---:|---:|---:|---:|---:|
| Sync (+ve) | 35 | 84 | 1 | 22 | 13.042 |
| Sync (−ve) | 35 | 84 | 1 | 22 | 3.041 |
| Async (+ve) | 41 | 104 | 2 | 24 | 16.046 |
| Async (−ve) | 41 | 104 | 2 | 24 | 1.064 |

- Synchronous and asynchronous variant pairs are each **resource-identical within their pair**, confirming edge polarity was correctly isolated.
- Asynchronous designs require **~17–24% more LUTs/registers** than synchronous — the quantified cost of correct CDC synchronization.
- Negative-edge variants show **substantially lower WNS** than positive-edge variants in both design types, despite identical resource usage — plausibly attributable to inverted-clock-path delay on FPGA fabric, not logic complexity.

### Power Analysis (SAIF-based, Medium confidence)

| Variant | Total (W) | Dynamic (W) | Static (W) |
|---|---:|---:|---:|
| Sync (+ve) | 0.072 | 0.002 | 0.070 |
| Sync (−ve) | 0.072 | 0.002 | 0.070 |
| Async (+ve) | 0.073 | 0.003 | 0.070 |
| Async (−ve) | 0.072 | 0.002 | 0.070 |

Power was estimated using **simulation-activity-derived (SAIF)** methodology — real switching activity from functional simulation, not Vivado's default vectorless/statistical estimate. Static power dominates (~97%) and is essentially constant across variants, as expected for a small design on a fixed device; it is not a meaningful differentiator. Dynamic power differences are small in absolute terms (≤1 mW) and reported as *suggestive, not conclusive*, given Medium estimation confidence and the low-activity directed test stimulus used.

## Repository Structure

```
├── sync_fifo_posedge.v              # Synchronous FIFO, positive edge
├── sync_fifo_negedge.v        # Synchronous FIFO, negative edge (flag logic aligned with posedge)
├── async_fifo_posedge.v       # Asynchronous FIFO, positive edge (Gray-code + dual-FF, corrected)
├── async_fifo_negedge.v       # Asynchronous FIFO, negative edge (Gray-code + dual-FF, corrected)
├── tb_sync_fifo_posedge.v     # Testbench, sync posedge
├── tb_sync_fifo_negedge.v     # Testbench, sync negedge
├── tb_async_fifo_posedge.v    # Self-checking testbench, async posedge
├── tb_async_fifo_negedge.v    # Self-checking testbench, async negedge
└── README.md
```

## Verification Methodology

All four variants are verified with **self-checking** testbenches: each applies a sequence of input values and, for the asynchronous variants, automatically compares every read against an expected-value reference queue — reporting mismatches explicitly rather than requiring manual waveform inspection.

Verification evidence for correct clock-domain crossing was drawn from **internally-generated design signals** (e.g. the registered `rdata` output, internal pointer registers) rather than testbench-driven input signals — an input signal's waveform reflects when the testbench applied it, not when the design actually sampled it.

## Known Limitations

- All results correspond to a single configuration (8-entry depth, 8-bit width); scalability across depth/width/clock-ratio was not evaluated.
- Power results use a fixed, low-activity directed stimulus; a higher-activity or randomized stimulus would better characterize dynamic power differences.
- The original (buggy) binary-pointer design was corrected prior to evaluation but was not separately stress-tested as a negative control to empirically demonstrate the failure mode it was designed to prevent.
- Word-level clock gating and other power-reduction techniques, previously demonstrated for synchronous FIFOs, have not yet been applied to the asynchronous, CDC-correct design here.
