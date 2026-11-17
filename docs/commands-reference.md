# 📚 Commands Reference

| Command | Purpose | Output |
|---|---|---|
| make | Compile application | build/chatbot |
| make run | Build if needed and launch | Interactive terminal session |
| make test | Build and run unit plus Linux shell tests | Test results |
| make docs-check | Validate local Markdown links and SVG assets | Validation report |
| make check | Run tests and docs-check | Combined quality gate |
| make clean | Remove generated build directory | No build directory |
| python3 scripts/validate_docs.py | Run docs validator directly | Validation report |

## Direct build commands

~~~sh
cc -std=c11 -Wall -Wextra -Wpedantic chatbot/chatbot.c -o chatbot
gcc -std=c11 -Wall -Wextra -Wpedantic -Werror chatbot/chatbot.c -o chatbot
~~~

## Program commands

The chatbot does not have a command-line option parser. It only accepts conversation input through stdin. The exact word bye ends the conversation. Unknown inputs produce a fallback response. There is no --help, --version, configuration flag, or subcommand interface.
