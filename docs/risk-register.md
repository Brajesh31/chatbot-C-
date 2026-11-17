# 📉 Risk Register

| Risk | Likelihood | Impact | Mitigation |
|---|---|---|---|
| Regression in input boundaries | Medium | High | Unit and interactive edge-case tests |
| Stale prebuilt executable | Medium | Medium | Prefer source builds; label binary historical |
| Documentation drift | Medium | Medium | Docs validator and review checklist |
| Toolchain variation | Medium | Medium | C11 target and CI builds on two OS families |
| Misleading AI claims | Medium | Medium | State clearly that rules are deterministic |
| Scope expansion without review | Medium | Medium | Review dependencies and architecture decisions |

This register is a planning aid, not a quantitative risk assessment. Reassess entries after significant behavior or architecture changes.
