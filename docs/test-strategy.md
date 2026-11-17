# 🧪 Test Strategy

## Test levels
| Level | Test artifact | Purpose |
|---|---|---|
| Unit | tests/test_chatbot.c | Check normalization, classification, and response selection |
| Interactive integration | tests/test_interactive.sh | Check compiled program stdin/stdout behavior |
| Build validation | Makefile and CI | Enforce C11 compilation and warnings-as-errors |
| Static analysis | CodeQL and GCC analyzer workflow | Find supported source-level issues |
| Documentation validation | scripts/validate_docs.py | Catch broken local links and invalid SVG files |

Use deterministic inputs and expected output. Cover ordinary phrases, case changes, empty lines, substring collisions, exact exit behavior, long input, and EOF. Keep tests independent of external services and network availability.

A release candidate must compile, pass tests, have updated docs and diagrams, and have no unresolved release-blocking security findings. A passing local test does not imply all platforms were tested.
