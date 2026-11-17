# 🔐 Security Review Template

## Review metadata
- Scope and change:
- Source commit:
- Reviewer:
- Date:
- Tools:

## Attack surface
Describe input sources, processing boundaries, outputs, files, dependencies, and any network or persistence behavior. State explicitly when a capability does not exist.

## Review checklist
- [ ] Input size and validation are bounded.
- [ ] Reads and library return values are checked.
- [ ] String operations preserve bounds and NUL termination.
- [ ] Character conversion uses valid unsigned-char values.
- [ ] EOF and error paths are safe.
- [ ] No secret is committed or printed.
- [ ] Dependency and license impact is reviewed.
- [ ] Workflow permissions are least-privilege.
- [ ] Logging and persistence are documented accurately.
- [ ] Tests cover security-relevant edge cases.

## Threat analysis
| Asset | Threat | Entry point | Likelihood | Impact | Existing mitigation |
|---|---|---|---|---|---|

## Findings
| Finding ID | Severity | Evidence | Reproduction | Remediation owner | Status |
|---|---|---|---|---|---|

## Residual risks
List unmitigated risks and why they are accepted or deferred.

## Verification and sign-off
Attach CI, analyzer, and retest results. A completed checklist is not a formal security certification.
