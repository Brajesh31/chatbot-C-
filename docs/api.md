# 📖 Program API Reference

There is no HTTP, network, or separately installed library API. The interface is a terminal program.

## Standard I/O
- Reads one logical line from stdin.
- Prints prompts and replies to stdout.
- Accepts up to 255 bytes per line.
- Discards overlong lines and reports the limit.
- Exits cleanly on EOF.

## Rule table
| Rule | Match | Response | Exit? |
|---|---|---|---|
| Greeting | Lowercased input contains `hello` | Greeting | No |
| Status | Contains `how are you`, if greeting did not match | Status | No |
| Exit | Entire normalized input equals `bye` | Goodbye | Yes |
| Fallback | No rule matches | Unknown response | No |

## Internal function contract
- `normalize_input(char *text)`: modifies a NUL-terminated string.
- `is_exit_command(const char *text)`: true only for exact `bye`.
- `classify_input(const char *text)`: returns a `ResponseKind` enum.
- `response_text(ResponseKind kind)`: returns a static response string.
- `read_input_line(char *buffer, size_t capacity)`: 1 valid line, 0 EOF/error, -1 overlong line.

These are private implementation details, not an exported library ABI.
