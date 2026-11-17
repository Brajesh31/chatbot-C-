# 🧰 Maintenance Guide

| Frequency | Activity |
|---|---|
| Every change | Build, run tests, review docs and diagrams |
| When CI actions change | Review permissions, versions, and workflow result |
| Periodically | Review compiler support, CodeQL alerts, and open issues |
| Before a release | Run all checks, review changelog and test evidence |
| After behavior changes | Update examples, function reference, and diagrams |

No database backups, hosted uptime checks, customer data retention jobs, or service monitoring are required by the current implementation. Revisit this only if architecture changes.

The current maintainer is listed in MAINTAINERS.md. Contributors should open a focused issue when a maintenance item requires a behavior or scope decision.
