# 🧩 Module Documentation

## Application module: chatbot/chatbot.c
The repository currently has one application module. Its responsibilities are divided into static functions:

| Function | Contract | Notes |
|---|---|---|
| normalize_input | Mutates a NUL-terminated string to lowercase | Uses an unsigned-char conversion before tolower |
| is_exit_command | True only for exact “bye” | Does not match “goodbye” or “hello bye” |
| classify_input | Returns greeting/status/goodbye/fallback enum | Order determines precedence |
| response_text | Returns static text for an enum | No allocation or ownership transfer |
| read_input_line | Returns 1, 0, or -1 | Valid line, EOF/error, long line |
| main | Runs the terminal interaction | Owns the buffer and loop |

## Test module
tests/test_chatbot.c verifies helper contracts. tests/test_interactive.sh launches the real executable and checks stream behavior.

## Future modularization
Each future module should have one narrow responsibility and tests. Split code only when there is enough implementation to justify the additional interface and build complexity.
