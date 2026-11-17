# 📉 Security Risk Register

| ID | Scenario | Likelihood | Impact | Existing treatment | Residual concern |
|---|---|---|---|---|---|
| SEC-01 | Input reader regression causes unsafe boundary behavior | Medium | High | Bounds, regression tests, strict build | Future edits may reintroduce defect |
| SEC-02 | Secret committed to repository | Low | High | No runtime secrets; private reporting guidance | No dedicated secret-scanning workflow yet |
| SEC-03 | Historical binary differs from reviewed source | Medium | Medium | Source builds preferred; binary marked historical | No provenance attestation |
| SEC-04 | Workflow action or permission compromise | Medium | High | Minimal permissions, Dependabot review | Action tags are not immutable digests |
| SEC-05 | Incorrect security/privacy claims | Medium | Medium | Scope documentation and review | Documentation drift remains possible |
| SEC-06 | Terminal host records sensitive input | Medium | Medium | User warning and no app persistence | External terminal configuration is outside app control |

## Risk handling

Use the [threat assessment](threat-assessment.md) to understand the runtime boundary. Use [vulnerability management](vulnerability-management.md) for reported defects. Record material changes and review the register before a release.

Ratings are qualitative planning judgments, not results of a formal audit or quantitative risk model. Reassess them when storage, networking, authentication, or multi-user operation is introduced.
