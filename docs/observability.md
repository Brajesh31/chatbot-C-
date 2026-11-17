# 🔭 Observability

## Boundary
The local executable exposes no metrics endpoint, tracing span, structured event log, crash-reporting service or telemetry exporter. It uses stdin/stdout and does not retain diagnostics. GitHub workflows provide engineering feedback, not runtime observability.

## Signals
| Signal | Present? | Source |
|---|---|---|
| Logs | Limited console text | Prompt, replies, warning, EOF message |
| Metrics | No | No counters or endpoint |
| Distributed traces | No | No remote calls |
| Crash reports | No | No reporting integration |
| CI diagnostics | Yes | Workflow output and analysis findings |

## Safe diagnostics
- Capture source revision and build command.
- Record compiler and OS versions.
- Reproduce with synthetic input where possible.
- Avoid retaining full user-entered messages.
- Separate diagnostics from conversation output if added.
- Identify whether a failure is build, input, terminal or test tooling.

A future service needs event schemas, redaction, purpose, retention, access, alerting and deletion rules. Do not describe badges as runtime monitoring or claim an SLA. Related: [logging](logging.md), [monitoring](monitoring.md), [privacy](privacy.md), [security](security.md).
