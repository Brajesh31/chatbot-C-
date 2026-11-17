# 🐞 Debugging Guide

## Reproduce first

Capture the exact input, operating system, compiler version, command used to build, expected output, actual output, and exit status. Avoid including private or sensitive terminal content in public reports.

## Useful build options

For a debug build with symbols and strict diagnostics:

~~~sh
make clean
make CFLAGS="-std=c11 -Wall -Wextra -Wpedantic -Werror -g -O0"
~~~

If GCC is installed, a static analyzer build can be run with:

~~~sh
gcc -std=c11 -Wall -Wextra -Wpedantic -Werror -fanalyzer chatbot/chatbot.c -o /tmp/chatbot-debug
~~~

A sanitizer build may be useful where supported:

~~~sh
cc -std=c11 -Wall -Wextra -Wpedantic -g -O1 -fsanitize=address,undefined chatbot/chatbot.c -o /tmp/chatbot-sanitized
~~~

## Debugging checklist

- Does the input fit the documented 255-byte limit?
- Is the line terminated with Enter or did the stream reach EOF?
- Does an earlier substring rule take precedence?
- Is the exit input exactly bye after normalization?
- Did you rebuild from the current source rather than run the historical tracked executable?
- Do unit and interactive tests reproduce the problem?

See [troubleshooting](troubleshooting.md) for common compiler and runtime issues.
