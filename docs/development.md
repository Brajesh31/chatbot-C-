# 🧑‍💻 Development Guide

Use GCC, Clang, MinGW-w64, or another C11 compiler. Strict flags are `-std=c11 -Wall -Wextra -Wpedantic -Werror -O2`.

## Build and test
```sh
make
make test
make clean
```

On Windows with MinGW-w64, compile directly using `gcc -std=c11 -Wall -Wextra -Wpedantic chatbot/chatbot.c -o chatbot-build.exe`.

## Conventions
- Include standard headers explicitly.
- Prefer `int main(void)`.
- Use `size_t` for sizes.
- Cast to `unsigned char` before `tolower`.
- Check every input function result.
- Keep buffer bounds explicit and handle long lines as one logical message.
- Centralize responses and avoid undefined behavior or unbounded input functions.

Unit tests include the implementation in a separate test translation unit. Shell smoke tests exercise the actual program. Update README, API, architecture, troubleshooting, and changelog when behavior changes.
