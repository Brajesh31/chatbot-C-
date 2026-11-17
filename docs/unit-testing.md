# 🔬 Unit Testing

The unit test executable is built from tests/test_chatbot.c. The test translation unit includes the application source with main temporarily renamed, allowing assertions against private helper functions without making them a public library interface.

## Current coverage areas
- Case normalization.
- Greeting rule.
- Status rule.
- Fallback for unknown and empty input.
- Exact exit command.
- “bye” as part of another phrase does not trigger exit.
- Response text mapping.

Run make test. The test executable returns a non-zero exit code when an assertion fails.

Add assertions for every new classification branch and boundary condition. If a change is observable only through stdin/stdout, cover it in the interactive suite as well.
