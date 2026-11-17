# 🔐 Security Audit Template

> Use this record for a scoped review. Completing it does not automatically certify the project or replace an independent audit.

## 1. Audit metadata

| Field | Value |
|---|---|
| Scope | |
| Repository/source commit | |
| Build artifact and platform | |
| Auditor/reviewer | |
| Date | |
| Tools and versions | |
| Related issue/PR | |

## 2. System and trust boundary

Describe executable entry points, untrusted inputs, data processing, outputs, files, dependencies, CI workflows, secrets and any network/persistence behavior. State when a capability is not present.

## 3. Review areas

| Area | Review method | Evidence | Result | Notes |
|---|---|---|---|---|
| Input validation and bounds | | | | |
| Memory ownership and string handling | | | | |
| EOF/error paths | | | | |
| Character encoding/normalization | | | | |
| Compiler flags and toolchain | | | | |
| Third-party dependencies/licenses | | | | |
| Secrets and configuration | | | | |
| CI workflow permissions/actions | | | | |
| Data retention and privacy | | | | |
| Release artifact provenance | | | | |

## 4. Findings

| Finding ID | Severity | Affected component | Evidence/reproduction | Impact | Recommended remediation |
|---|---|---|---|---|---|

Use severity definitions and explain exploitability. Do not include credentials or harmful exploit payloads in a public copy of this report.

## 5. Remediation tracking

| Finding ID | Fix commit | Regression test | Retest result | Owner | Status |
|---|---|---|---|---|---|

## 6. Residual risks

List unresolved findings, compensating controls, accepted risks, decision owner and review date.

## 7. Retest and closure

Record compiler/test runs, static-analysis results, source revisions and any checks that could not be performed. Separate confirmed results from assumptions.

## 8. Sign-off

- Audit scope completed:
- Independent review required:
- Open findings:
- Closure decision:
- Reviewer/date:
