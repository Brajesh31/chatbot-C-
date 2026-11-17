# 📦 Hosting, Production and Infrastructure Scope

## Current delivery model

The repository builds a local command-line executable. It does not deploy a web service, listen on a network port, run a background worker, or host user data.

## Deployment checklist applicability

| Area | Current status | Why it is absent |
|---|---|---|
| Production server setup | Not applicable | No server process exists |
| Hosting provider | Not applicable | No hosted application or live endpoint |
| Docker/containerization | Not required | A native C executable runs directly on the host |
| Infrastructure as code | Not applicable | No cloud or service infrastructure |
| Monitoring/observability | Not applicable to runtime service | No remote service or telemetry pipeline |
| Health-check endpoint | Not applicable | No network listener or HTTP route |
| Release artifact | Partially implemented | Manual workflow builds and uploads a Linux executable |
| CI build and tests | Implemented | GitHub Actions checks source |

## Local executable distribution

Build from a reviewed source tag, run all tests, verify the artifact, identify OS/architecture and compiler flags, and provide source provenance. The current release workflow does not create a tag, publish a GitHub Release, sign the executable, or attest its build.

## If the project becomes a service

A service proposal must define target hosting, supported runtime, network exposure, container image, configuration and secret handling, health/readiness semantics, logs and metrics, alert ownership, backup/restore, deployment rollout, rollback, and incident responsibilities. Do not add Docker or infrastructure scaffolding without an approved deployment target.

Related: [deployment guide](deployment.md), [CI/CD](ci-cd.md), [operations](operations.md), and [disaster recovery applicability](disaster-recovery.md).
