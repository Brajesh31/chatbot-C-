# 🧾 Technical Debt Register

| ID | Item | Priority | Rationale | Exit condition |
|---|---|---|---|---|
| TD-01 | No coverage percentage generated | Low | Assertions are explicit but not measured | Add a maintained compiler coverage job |
| TD-02 | No fuzz testing | Medium | Input boundary merits additional testing | Add sanitizer/fuzz harness and reproducible CI |
| TD-03 | No Windows interactive integration test | Low | Windows job currently tests build and unit tests | Add robust PowerShell stdin harness |
| TD-04 | Output stream errors not fully checked | Low | Current example targets interactive use | Define and test non-interactive failure behavior |
| TD-05 | Single translation unit | Low | Fits current project size | Split when a second meaningful module exists |

Do not treat speculative enhancements as debt. Update priority after considering user impact and implementation cost.
