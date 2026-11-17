# 📉 Risk Register and Mitigation Plan

This register is a qualitative engineering aid. Likelihood and impact are not statistically measured. Reassess entries after changes to input handling, dependencies, build workflows or product scope.

| ID | Risk | Likelihood | Impact | Current mitigation | Verification / trigger | Owner |
|---|---|---|---|---|---|---|
| R-01 | Input boundary regression causes truncation or fragmented turns | Medium | High | Fixed buffer, extra-byte probe, line draining, boundary process tests | Run 254/255/256-byte tests whenever reader changes | Maintainer |
| R-02 | Character conversion receives an invalid signed-char value | Low | High | Cast through unsigned char before `tolower` | Review normalization changes; run unit tests | Maintainer |
| R-03 | Rule precedence changes unexpectedly | Medium | Medium | Explicit ordered classifier and overlapping-phrase tests | Review examples and unit assertions on every rule change | Maintainer |
| R-04 | Historical executable differs from current source | Medium | Medium | Label binary historical and recommend source build | Compare only when binary refresh is deliberately planned | Release owner |
| R-05 | Platform behavior differs across shells or compilers | Medium | Medium | Linux and Windows CI coverage; strict C11 warnings | Reassess when adding compiler/OS support | Maintainer |
| R-06 | Documentation claims drift from source | Medium | Medium | File inventory, link, fence and asset validators; code review checklist | Run `make check` after docs or path changes | Documentation owner |
| R-07 | Secret-like text is committed accidentally | Low | High | Gitleaks workflow and local heuristic scan | Run secret scan; rotate any exposed credential immediately | Repository owner |
| R-08 | Static analysis misses a runtime issue | Medium | High | Unit/process tests plus CodeQL and GCC analyzer | Treat findings as signals, not proof; conduct review for risky changes | Maintainer |
| R-09 | Repository scope expands without a maintainable product need | Medium | Medium | Explicit non-goals and architecture decision records | Require feature proposal, owner, tests and maintenance estimate | Project owner |
| R-10 | User assumes this is an AI service or that conversations are stored | Medium | Medium | Clear README disclaimer and privacy/scope docs | Recheck project description and badges after major changes | Documentation owner |
| R-11 | Release artifact is mistaken for signed or provenance-attested output | Medium | High | Document current release workflow limitations; prefer reviewed source builds | Review release notes and artifact claims for each tag | Release owner |

## Risk review cadence

Review the register:
- When input parsing, normalization or rule precedence changes.
- When network access, persistence, external dependencies or additional data handling are proposed.
- Before a tagged release.
- After a security report or CI workflow permission change.
- When a supported compiler or operating system is added.

## Risk acceptance

A high-impact risk requires an explicit owner, mitigation or documented acceptance, a review date and a trigger for reassessment. Do not mark a risk closed until the control has evidence. For temporary security control deviations, use the [security exception template](templates/security-exception-template.md). For defects, use the [reproduction record](templates/reproduction-record-template.md).
