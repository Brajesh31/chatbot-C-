# ⚡ Performance Testing

## Current workload

The program processes one line at a time in a fixed 256-byte buffer. It has no network calls, persistent state, large data set, background worker, or model inference. Performance expectations are therefore modest and bounded by terminal input/output.

## What should be measured

| Measurement | Method | Caveat |
|---|---|---|
| Build duration | Repeat clean builds | Compiler cache and hosted runner affect results |
| Response processing | Non-interactive piped input | Separate terminal I/O from rule matching |
| Memory usage | OS process tools | Tiny process values vary by platform |
| Long-input handling | Controlled input near and above capacity | Ensure test harness reproduces exact byte count |

## Benchmark rules

Record source commit, compiler/version, flags, OS, CPU, input size and contents, warm-up, repetitions, and summary statistics. Do not publish a single run as a performance claim.

No throughput SLA or numeric baseline is currently defined. Use [benchmark template](templates/benchmark-template.md) before presenting results.
