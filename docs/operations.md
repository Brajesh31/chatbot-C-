# 🧰 Local Operations Guide

## Runtime model

This project runs as a command-line executable on a user's machine. There is no server process, hosted environment, scheduled worker, service health endpoint, telemetry, or remote operations dashboard.

## Start and stop

Build from source using make, then launch build/chatbot. The user exits the conversation by entering exact bye. Sending EOF also closes the process. An overlong line is discarded and the program presents the next prompt.

## Routine operational checks

| Task | Procedure |
|---|---|
| Build | Run make |
| Verify behavior | Run make test |
| Validate documentation | Run make docs-check |
| Run all local checks | Run make check |
| Remove generated output | Run make clean |
| Inspect security findings | Review CodeQL and GCC analyzer workflow results |

## Diagnostics and incident handling

The process writes ordinary output to stdout and does not create a log file. When investigating a reported failure, record the source commit, OS, compiler, exact command, input boundary case, expected result, actual result, and exit code. Do not include sensitive user input in an issue.

## Recovery

For a bad source change, revert through a reviewed commit and rebuild from the last known-good revision. For a faulty distributed executable, rebuild it from an exact source tag, verify tests, and publish a corrected artifact with clear provenance. See [rollback guide](rollback.md).

## Not applicable

Database backups, hosted uptime checks, load balancers, production secrets, customer-data retention jobs, and disaster-recovery failover are not required by the current architecture.
