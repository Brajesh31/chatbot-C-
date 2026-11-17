# 🚦 Quality Gates

| Gate | Required result | Where |
|---|---|---|
| Build | C11 compile succeeds with warnings-as-errors | Makefile and CI |
| Unit tests | All assertions pass | make test |
| Interactive tests | Conversation, EOF, long input pass | Linux CI |
| Documentation | Relative links and SVG assets resolve | Documentation workflow |
| Security analysis | No unresolved release-blocking findings | CodeQL and review |
| Scope accuracy | No invented service/API/database claims | Pull request review |

A badge or release note must reflect actual workflow results. A workflow being configured is not the same as a successful run. Record any skipped check with the reason.
