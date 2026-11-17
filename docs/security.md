# 🔐 Security Guide

## Security scope

The current application is a local C process with a single input channel and a terminal output channel. It has no network listener, remote API, authentication system, database, external model, persistent conversation log, or user-managed secret.

## Existing defensive behavior

| Control | Implementation | Why it matters |
|---|---|---|
| Bounded input | Fixed-size buffer and fgets | Limits accepted input size |
| Read-result check | Input reader checks fgets result | Avoids classifying uninitialized data on EOF |
| Long-line draining | Consumes the remainder of an overlong line | Prevents the tail being interpreted as a new message |
| Character conversion | Converts to unsigned char before tolower | Avoids undefined behavior for negative plain-char values |
| Exact exit | strcmp against the whole normalized input | Avoids unintended exit from a substring |
| Compiler diagnostics | Warnings treated as errors | Catches common mistakes early |
| Static analysis | CodeQL and GCC analyzer workflows | Adds source-level checks |

## Remaining limitations

This is not a formal security audit. Static analysis does not prove memory safety. The tracked Windows executable is a historical binary and is not rebuilt or provenance-attested by the source CI job. Output stream failures are not all checked. Input normalization is byte-oriented rather than Unicode-aware.

## Developer requirements

- Preserve bounds checks and EOF handling.
- Avoid unchecked copies and unsafe string operations.
- Keep secrets out of commits and issue reports.
- Review changes to GitHub Actions permissions and action versions.
- Rebuild from reviewed source when binary provenance matters.
- Add tests for any change to input or classification.
- Update the [threat model](threat-model.md), [security test guide](security-testing.md), and [dependency security guide](dependency-security.md) when the trust boundary changes.

## Vulnerability reporting

Do not publish sensitive vulnerability details in a public issue. Use the private reporting route in the repository's issue-template configuration and follow the root [SECURITY.md](../SECURITY.md). The policy describes the supported disclosure route; it does not promise an unverified response-time SLA.

## Related documents

See [threat model](threat-model.md), [security best practices](security-best-practices.md), [dependency security](dependency-security.md), and [privacy notes](privacy.md).
