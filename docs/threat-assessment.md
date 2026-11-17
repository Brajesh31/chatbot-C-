# 🔎 Current Threat Assessment

## Assessment scope

This is a repository-level assessment of the current local C executable and its build workflows. It is not a penetration test, independent audit, or formal certification.

## Assets and trust boundaries

- User-entered terminal bytes.
- Process memory, including the bounded input array.
- Source code and tracked executable artifact.
- Compiler, build environment, and GitHub Actions.
- Repository credentials and private vulnerability reports.

## Threat assessment

| Threat | Likely impact | Current mitigation | Residual concern |
|---|---|---|---|
| Overlong input fragments into extra turns | Confusing behavior | Reader drains rest of line | Regression remains possible |
| EOF reads stale/uninitialized data | Incorrect response or crash | Return value checked | Test should remain in CI |
| Character conversion with negative char | Undefined behavior | Cast to unsigned char | Byte-oriented, not Unicode |
| Source tampering | Malicious executable | Review, CI, static analysis | CI cannot prove provenance |
| Stale binary used in place of source build | Unknown code execution behavior | README labels binary historical | Binary is retained |
| Secret accidentally committed | Credential exposure | No runtime credentials, private issue route | Repository-level secret detection still useful |
| Misleading security claims | Users rely on false assurance | Explicit scope and limitation docs | Contributors must keep docs current |

## Risk acceptance

No application-level authentication, database, web listener, or remote service currently exists. Threats specific to those systems are outside the current runtime scope. If any is introduced, this assessment must be rewritten before release.

## Verification

Run make check, the GCC analyzer workflow, and CodeQL. Verify the source commit used for any distributed binary. See [security architecture](security-architecture.md) and [security risk register](security-risk-register.md).
