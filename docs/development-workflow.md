# 🔄 Development Workflow and Review Lifecycle

## 1. Workflow overview

The workflow keeps source, tests, documentation and verification evidence in sync. Work should stay focused on one behavior or one related maintenance task.

~~~mermaid
flowchart TD
 I[Read issue and scope] --> B[Create focused branch]
 B --> C[Inspect source, docs and tests]
 C --> D[Define expected behavior]
 D --> E[Implement small change]
 E --> T[Add or update tests]
 T --> V[Run make check]
 V --> R{All local checks pass?}
 R -->|No| E
 R -->|Yes| D2[Update docs, diagrams and tree]
 D2 --> P[Review complete diff]
 P --> PR[Open pull request with evidence]
 PR --> M[Maintainer review]
 M --> A[Merge after approval]
~~~

## 2. Branch expectations

Create a focused branch from the current default branch. Keep source changes and their tests together. Avoid mixing unrelated changes to repository branding, build configuration and runtime behavior.

Example naming:
- fix/line-reader-eof
- test/rule-precedence
- docs/installation-guide
- chore/ci-action-update

## 3. Implementation sequence

1. Identify the source function and user-visible behavior that will change.
2. Read related tests and documentation before editing.
3. Write expected behavior for ordinary and boundary inputs.
4. Make the smallest coherent implementation change.
5. Add regression coverage before relying on manual testing.
6. Build with the configured C11 warnings-as-errors flags.
7. Run C unit tests and the process-level tests on supported platforms.
8. Update README, feature and API/function references, diagrams, risk and compatibility docs as appropriate.
9. Regenerate the tracked file inventory if paths changed.
10. Review the complete diff for stale text, generated artifacts, accidental deletions and secrets.

## 4. Test and documentation sequence

~~~mermaid
sequenceDiagram
 actor Author
 participant Source
 participant Tests
 participant Docs
 participant CI
 Author->>Source: Implement change
 Author->>Tests: Add regression case
 Author->>Tests: Run make test
 Tests-->>Author: Actual local result
 Author->>Docs: Update contract and diagrams
 Author->>CI: Push branch / open PR
 CI->>Source: Compile
 CI->>Tests: Run unit and platform process tests
 CI->>Docs: Validate links, SVG, Markdown and tree
 CI-->>Author: Workflow result and commit SHA
~~~

## 5. Commit message examples

- fix: handle exact-limit final input line
- test: cover overlong input drain
- docs: clarify fallback and exit precedence
- chore: update static-analysis workflow

Messages should explain the intent, not just say update or changes.

## 6. Pull request content

Include problem statement, intended behavior, implementation notes, test commands and actual results, platforms checked, documentation changes, known limitations, security/privacy implications and skipped checks. Link the related issue when one exists.

## 7. Review and merge criteria

Reviewers should inspect observable behavior, input bounds, rule precedence, compiler output, test reliability, file inventory, local links, SVG validity, workflow permissions and maintenance cost. A green Linux run does not establish Windows or macOS compatibility. A workflow definition alone does not establish that branch protection is enabled.

## 8. Release handoff

After merge, use the release procedure only when a release is required. The current workflow builds an artifact from an existing tag; it does not create a published GitHub Release or sign artifacts.
