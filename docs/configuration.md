# ⚙️ Configuration

The chatbot has no runtime configuration file. Phrase rules, input capacity, and response strings are compile-time constants in the C source.

| Setting | Current value | Location | Change impact |
|---|---|---|---|
| Input capacity | 256-byte array; max 255 input bytes | INPUT_CAPACITY | Changes accepted line length and tests |
| Greeting phrase | hello | classify_input | Changes rule behavior |
| Status phrase | how are you | classify_input | Changes rule behavior |
| Exit command | exact bye | is_exit_command | Changes session lifecycle |
| Response text | fixed strings | response_text | Changes terminal wording |

The Makefile defaults to strict C11 compilation with -Wall -Wextra -Wpedantic -Werror -O2. CC and CFLAGS can be overridden from the make command line.

No runtime secrets or environment-based settings are consumed by the application.
