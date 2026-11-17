# 🤝 Contributing

Thank you for considering a contribution. This repository is a small C11 terminal chatbot, so the best changes are focused, portable, tested, and consistent with the actual application.

## 1. Read before changing code

Start with:
- README.md for the current product behavior.
- docs/scope-and-limitations.md for included and excluded functionality.
- docs/architecture.md and docs/api-reference.md for the execution path.
- docs/testing.md for automated checks.
- CODE_OF_CONDUCT.md for participation expectations.
- SECURITY.md for private vulnerability reporting.

Search existing issues and pull requests before opening a duplicate. Discuss substantial behavior or architecture changes before implementing them.

## 2. Development prerequisites

Required:
- Git.
- A C11-capable compiler such as GCC, Clang, or MinGW-w64.

Recommended:
- GNU Make.
- Python 3 for documentation validation.
- A POSIX shell and awk for the full interactive integration suite on Linux.

The application has no third-party runtime package installation, database, cloud account, or API key requirement.

## 3. Clone and build

~~~sh
git clone https://github.com/Brajesh31/chatbot-C-.git
cd chatbot-C-
make
~~~

Run the complete local quality gate:

~~~sh
make check
~~~

The Makefile builds under build/. Do not overwrite the retained historical chatbot/chatbot.exe while testing a new build.

## 4. Branch workflow

Use a short descriptive branch name, for example:
- feat/add-new-response-rule
- fix/input-boundary-condition
- test/cover-empty-input
- docs/clarify-windows-build
- chore/update-ci-action

Keep each pull request limited to one coherent purpose. Avoid mixing unrelated formatting, source refactors, and feature changes.

## 5. C coding standards

- Target C11 unless a reviewed decision changes the language baseline.
- Keep functions focused and names descriptive.
- Use static for implementation-only helper functions.
- Check input and library return values.
- Keep all input buffers bounded and document capacities.
- Preserve NUL termination.
- Use unsigned-char conversion before calling character-classification functions such as tolower.
- Avoid unsafe copies, unbounded formatting, shell execution, and unnecessary heap allocation.
- Prefer standard C facilities over platform-specific APIs.
- Do not suppress warnings merely to obtain a green build.

## 6. Behavior and test expectations

For changes to phrase rules, document priority and collision behavior. Add tests for the intended input and nearby negative cases. A change to input capacity must cover the maximum accepted line, an overlong line, and EOF. A change to exit behavior must verify that incidental substrings do not unexpectedly terminate the program.

Run:
~~~sh
make test
make docs-check
make markdown-check
make structure-check
make security-check
make check
~~~

The shell integration suite is POSIX-based and is executed on Linux CI. The Windows workflow builds the application and C unit tests with MinGW.

## 7. Documentation requirements

Update every affected guide, example transcript, rule table, diagram, and project-tree inventory. Do not add a generic page that merely repeats another page. Mark API, database, authentication, web, and deployment features as absent unless they are genuinely implemented.

All internal Markdown links must resolve. SVG files must be valid and contain a title and description. Do not add fabricated screenshots, feature claims, metrics, passing badges, or benchmark values.

## 8. Commit messages

Use a concise type and description:
- feat: add a new deterministic response rule
- fix: handle the final input line safely
- test: cover long-line behavior
- docs: explain terminal input limits
- chore: update repository validation

## 9. Pull request requirements

A pull request should include:
- Problem and intended behavior.
- Scope and relevant files changed.
- Input/output example where behavior changes.
- Compiler, operating system, and commands used.
- Test results and links to CI runs.
- Documentation and diagram updates.
- Known limitations and checks not executed.

Do not claim a test or platform passed unless it actually ran. Keep generated executables, object files, temporary logs, credentials, and editor state out of commits.

## 10. Review and merge expectations

Reviewers should assess correctness, rule precedence, boundary handling, portability, compiler warnings, regression coverage, documentation accuracy, data/privacy impact, and dependency changes. A compiling change is not automatically ready to merge.

The maintainer may request changes, defer a proposal, or decline changes that introduce unjustified complexity or misleading claims.

## 11. Security-sensitive contributions

Do not open a public issue with a working exploit, credential, or private data. Follow SECURITY.md and the private GitHub Security Advisory route.

## 12. Licensing and attribution

By submitting a contribution, you confirm that you have the right to submit the material under the repository's MIT license. Identify copied, generated, or third-party assets and comply with their applicable licenses. Contributor attribution remains in the Git history.

## 13. Reusable templates

Use docs/templates/feature-specification-template.md for product proposals, docs/templates/test-plan-template.md for test planning, docs/templates/code-review-template.md for review, and the release/security templates where appropriate.
