# 🔗 Integration Testing

The integration suite launches the compiled chatbot and drives it through standard input. It verifies behavior at the executable boundary rather than calling helper functions directly.

Current scenarios include a multi-turn conversation, exact exit behavior, a non-exit phrase containing the letters “bye”, EOF, and a line longer than the configured capacity.

Run it through make test or directly:

~~~sh
sh tests/test_interactive.sh ./build/chatbot
~~~

The shell test uses POSIX utilities and runs on Linux CI. Windows CI currently covers compilation and C unit tests, not this shell script.
