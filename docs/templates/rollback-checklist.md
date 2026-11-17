# ↩️ Rollback and Recovery Checklist

> This repository distributes a local native executable. Adapt the checklist to a source revision or binary artifact; do not imply a hosted traffic rollback exists.

## 1. Incident identification

- [ ] Record affected version/tag/commit.
- [ ] Record affected platform and architecture.
- [ ] Identify whether the failure is in source, build tooling, release artifact, documentation, or repository automation.
- [ ] Record a minimal reproduction and sanitized evidence.
- [ ] Assess whether the issue is security-sensitive.

## 2. Decide recovery action

| Situation | Appropriate action |
|---|---|
| Source behavior regression | Revert or prepare a reviewed fix commit |
| Wrong/defective binary | Stop distributing it where practical and rebuild from known-good source |
| Incorrect docs only | Correct docs and add validation where possible |
| Exposed credential | Revoke/rotate with issuer first, then clean repository references |
| Broken workflow | Revert or fix workflow and rerun affected checks |

## 3. Restore a known-good revision

- [ ] Identify last known-good commit/tag.
- [ ] Do not rewrite shared history without an explicit governance decision.
- [ ] Use a reviewed revert or a new fix commit.
- [ ] Rebuild using a recorded compiler and flags.
- [ ] Preserve the provenance link between source revision and artifact.

## 4. Verification

- [ ] Strict C11 build passes.
- [ ] C unit tests pass.
- [ ] POSIX integration tests pass on Linux.
- [ ] Documentation, Markdown, and structure checks pass.
- [ ] Security hygiene and static-analysis workflows pass.
- [ ] Windows build/unit tests pass where relevant.
- [ ] Artifact starts and exits as documented.

## 5. User communication

Explain affected source tags/artifacts, the issue, workaround, corrected revision, and any migration steps. Do not claim every user has updated automatically.

## 6. Closure

- [ ] Update CHANGELOG.md and known issues.
- [ ] Create an incident report where appropriate.
- [ ] Add a regression test.
- [ ] Update threat model/risk register if a security boundary was involved.
- [ ] Record root cause and preventive work.
