# ⚡ Benchmark Report Template

> Do not publish a performance number without reproducible measurements and the exact source revision.

## 1. Benchmark metadata
- Benchmark title:
- Related issue:
- Source commit/tag:
- Author/date:
- Intended question:

## 2. Environment
| Attribute | Value |
|---|---|
| Operating system/version | |
| CPU/architecture | |
| Memory | |
| Compiler and version | |
| Compiler flags | |
| Terminal or execution mode | |

## 3. Workload
Describe the input distribution, byte lengths, number of runs, expected output, and whether the workload represents actual use. Do not use sensitive user messages as test data.

## 4. Method
Record build command, warm-up count, repetitions, timing source, environment controls, and any background load. Explain how outliers are handled.

## 5. Results
| Variant | Runs | Minimum | Median | p95 | Maximum | Notes |
|---|---:|---:|---:|---:|---:|---|

Attach raw measurements or a reproducible script.

## 6. Analysis
Explain the observed difference, uncertainty, whether it is practically meaningful, and whether the result supports an optimization.

## 7. Decision
- Keep current implementation / adopt change / gather more data:
- Trade-offs:
- Follow-up issue:
- Reviewer:

## 8. Reproduction
Provide exact commands to rebuild and rerun the benchmark. Never invent a benchmark result to fill this report.
