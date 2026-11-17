# 📊 Test Coverage Notes

The repository currently uses explicit assertions and shell-level expected-output checks. It does not publish a line or branch coverage percentage.

## Covered behavior
Input normalization, all four response categories, rule precedence, exact exit matching, empty input, EOF behavior, and overlong-line handling.

## Gaps
- No compiler-based coverage report is produced.
- No fuzzing campaign is configured.
- The Windows job does not run the POSIX shell integration test.
- Terminal write failures are not currently simulated.

Do not add a numeric coverage badge until a coverage tool is configured, run, and its output is retained as evidence.
