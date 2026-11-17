# 🚦 Quality Gates

## Required local gate

Run:

~~~sh
make check
~~~

The combined target executes the C unit and interactive tests, local documentation and SVG validation, Markdown fence validation, project-tree validation, and secret-pattern hygiene scan.

## Gate matrix

| Gate | Required result | Command/workflow | Failure response |
|---|---|---|---|
| Strict C build | C11 build succeeds with warnings-as-errors | make test, ci.yml | Fix source/compiler warning |
| Unit tests | All assertions pass | make test | Add regression coverage |
| Interactive tests | Conversation, EOF and long input pass | make test on Linux | Reproduce with stdin/stdout |
| Docs links and SVG | All local references and SVG assets resolve | make docs-check | Fix broken references/XML |
| Markdown fences | All tracked Markdown code fences balance | make markdown-check | Close or correct fence |
| Project structure | Inventory matches tracked Git tree | make structure-check | Regenerate and commit file tree |
| Repository hygiene | No selected secret/conflict patterns found | make security-check | Inspect safely and remediate |
| CodeQL | Analysis workflow completes successfully | codeql.yml | Inspect extraction and findings |
| GCC analyzer | Analyzer completes without blocking findings | security-scan.yml | Review source path and warning |
| Windows build | MinGW compile and unit tests pass | ci.yml Windows job | Fix platform/compiler issue |

## Review requirements

- Do not merge a behavior change solely because compilation passes.
- Verify rule precedence and input boundary effects.
- Ensure docs, examples and diagrams match the current source.
- Record test environments and any checks not executed.
- Avoid claims of full portability, zero vulnerabilities, numeric coverage, WCAG compliance or formal certification without evidence.

## Branch protection

Repository branch protection and required status-check settings are managed in GitHub repository settings. The workflow definitions do not prove that branch protection has been enabled. Review the latest run and repository rules before relying on required checks.
