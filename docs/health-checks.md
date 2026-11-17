# ❤️ Health Checks and Process Verification

## No service health endpoint
The chatbot does not listen on a port, expose an HTTP route, register with a process supervisor or run as a daemon. It has no `/health`, readiness probe, liveness endpoint or container health check.

## Practical verification
| Check | Command | Expected result |
|---|---|---|
| Build | `make` | Creates `build/chatbot` |
| Behavior | `make test` | Unit and POSIX interactive tests pass |
| Full checks | `make check` | Configured quality checks pass |
| Smoke test | `printf 'bye\\n' | ./build/chatbot` | Startup, prompt, goodbye and normal exit |

These are build/test/smoke checks, not network probes. The process returns zero after exact `bye` or when input reading returns EOF/error.

If a service manager or container runtime is added, define health semantics, startup/readiness, shutdown, exit codes and restart behavior. Related: [operations](operations.md), [monitoring](monitoring.md), [containerization](containerization.md).
