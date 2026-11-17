# 📊 Test Coverage and Evidence

## Current measurement status

The repository uses C assertions and shell-level expected-output checks. It does not currently generate a line, branch, function or condition coverage report. Therefore, no numeric coverage percentage or coverage badge is published.

## Behaviors with automated checks

| Behavior | Test level | Evidence |
|---|---|---|
| Lowercase normalization | Unit | tests/test_chatbot.c |
| Greeting response | Unit | tests/test_chatbot.c |
| Status response | Unit | tests/test_chatbot.c |
| Fallback for unknown and empty input | Unit | tests/test_chatbot.c |
| Exact exit command | Unit and integration | tests/test_chatbot.c, tests/test_interactive.sh |
| Embedded bye does not exit | Unit and integration | tests/test_chatbot.c, tests/test_interactive.sh |
| EOF handling | Integration | tests/test_interactive.sh |
| Long-line rejection/drain | Integration | tests/test_interactive.sh |
| Strict C11 source build | Build/CI | Makefile and ci.yml |
| Markdown fence validity | Repository check | scripts/validate_markdown.py |
| Local doc links and SVG structure | Repository check | scripts/validate_docs.py |
| Tracked tree accuracy | Repository check | scripts/check_project_structure.py |
| Selected secret pattern hygiene | Repository check | scripts/security_check.py |

## Known coverage gaps

- No compiler-generated coverage report is retained.
- No fuzzing campaign or property-based test harness is configured.
- The Windows job does not run the POSIX shell integration test.
- Terminal output-stream write failures are not simulated.
- Not every possible locale, encoding, compiler, terminal or operating-system combination is tested.

## Adding a coverage metric responsibly

Choose a supported coverage tool and compiler, build a separate instrumented test configuration, execute all tests, retain the report, define meaningful thresholds, and ensure the workflow is stable. Exclude generated files and explain any uncovered platform-specific code.

Do not turn test assertion counts into a percentage. Assertion count is not code coverage.

## Evidence reporting

Link the exact workflow run and commit. State which jobs ran, which were skipped, and why. A workflow file existing is not evidence of a passing check.
