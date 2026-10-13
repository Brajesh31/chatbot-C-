# API Reference

This project has no HTTP, network, or library API. It is an interactive command-line program.

## Input and output

The executable reads from standard input and prints prompts and replies to standard output. It accepts one input buffer at a time, with a maximum of 99 bytes per successful `fgets` call, plus the terminating NUL. Newline removal is attempted before phrase matching.

## Recognized phrases

| Substring | Response category | Exits afterward? |
| --- | --- | --- |
| `hello` | Greeting | No |
| `how are you` | Status response | No |
| `bye` | Goodbye response if earlier checks did not match | Yes |
| Other input | Fallback response | No |

Matching is case-sensitive and checks substrings in source order. The exit check for `bye` is separate from response selection and can end the program even when another phrase selected the printed response.
