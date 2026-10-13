# Installation

## Requirements

- A C compiler: GCC, MinGW-w64, Clang, or a compatible compiler
- A terminal or command prompt
- Git to obtain the source

There are no package-manager dependencies or environment variables.

## Build on Windows

From the repository root, with GCC/MinGW available on `PATH`:

```powershell
gcc chatbot/chatbot.c -o chatbot/chatbot-build.exe
.\chatbot\chatbot-build.exe
```

This creates a local build with a separate name, leaving the checked-in `chatbot/chatbot.exe` untouched.

## Build on Linux or macOS

From the repository root:

```sh
cc chatbot/chatbot.c -o chatbot/chatbot-build
./chatbot/chatbot-build
```

If `cc` is unavailable, install a C compiler for your operating system or substitute the compiler command you use.

## Existing Windows executable

The repository includes `chatbot/chatbot.exe`. Its source is `chatbot/chatbot.c`; compile from source if you need a platform-specific build or want to inspect exactly what you are running.

## Configuration

The current program has no environment or configuration settings. `.env.example` is explanatory only and contains no values.
