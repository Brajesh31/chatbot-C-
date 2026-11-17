# 📡 Monitoring and Operational Checks

## Current status
The chatbot is a short-lived local process. It does not publish uptime, request counts, error rates, resource metrics, telemetry or remote logs. There is no monitoring vendor, alert route, SLO or on-call rotation.

## Available checks
| Concern | Check | What it demonstrates |
|---|---|---|
| Build | `make` | Compiler produces executable in this environment |
| Behavior | `make test` | Unit and interactive assertions pass |
| Repository quality | `make check` | Configured local validation passes |
| Static analysis | CodeQL and GCC analyzer | Selected static checks complete |
| Secret scan | Gitleaks and local heuristic | No reportable match under rules in scanned scope |

These checks do not prove every compiler or terminal is supported.

## Failure report
Collect source commit, OS, compiler/version, command, safe sample input, expected output, actual output and exit status. Do not include private user text or credentials.

There are no production alerts. GitHub notifications follow owner settings. Review failing CI/security runs before merging or distribution.

If a service is introduced, define service objectives, metrics, log retention, alert thresholds, escalation and incident ownership first. Related: [observability](observability.md), [health checks](health-checks.md), [operations](operations.md).
