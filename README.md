# Simple C Chatbot

A small command-line chatbot written in C. It reads one line at a time, checks the input for a few lowercase phrases, and prints a fixed response. It is a learning example for `stdio.h`, strings, `fgets`, and a simple input loop; it does not use AI, a network service, or a database.

## What it recognizes

- `hello` → a greeting
- `how are you` → a short status response
- `bye` → a goodbye response and exit
- Other text → a default “I don't understand” response

Matching uses case-sensitive substring checks. For example, `hello there` matches, while `HELLO` does not. The substring `bye` anywhere in the input ends the loop, even if it appears inside a longer word.

## Requirements

- A C compiler such as GCC, MinGW-w64, or Clang
- A terminal or command prompt

The repository includes a prebuilt Windows executable at `chatbot/chatbot.exe`. Building from source is the recommended way to produce a binary for your own system.

## Build and run

From the repository root, using GCC/MinGW on Windows:

```powershell
gcc chatbot/chatbot.c -o chatbot/chatbot-build.exe
.\chatbot\chatbot-build.exe
```

On Linux or macOS with a C compiler available as `cc`:

```sh
cc chatbot/chatbot.c -o chatbot/chatbot-build
./chatbot/chatbot-build
```

The commands create a separate local executable so the checked-in Windows binary is not overwritten. Generated build outputs are ignored by Git.

## Example session

```text
Chatbot: Hi! I'm a simple chatbot. Type 'bye' to exit.
You: hello
Chatbot: Hello! How can I help you today?
You: how are you?
Chatbot: I'm just a program, but thanks for asking!
You: bye
Chatbot: Goodbye! Have a great day!
```

## Project layout

```text
chatbot/
  chatbot.c                 C source and console input loop
  chatbot.exe               Existing prebuilt Windows executable
  .vscode/settings.json     Editor preference
```

The full source walk-through and limitations are in [docs/architecture.md](docs/architecture.md) and [docs/troubleshooting.md](docs/troubleshooting.md). See [docs/development.md](docs/development.md) for compiling and contributing.

## Known limitations

- Phrase checks are case-sensitive and match substrings rather than complete words.
- Input is stored in a 100-byte buffer, so a longer line is processed in multiple chunks.
- The program does not check whether `fgets` reached end-of-file; terminal EOF can cause repeated output or undefined behavior.
- There are no automated tests, configurable response rules, or persistent conversations.

## Contributing and support

Read [CONTRIBUTING.md](CONTRIBUTING.md) before proposing a change. Report ordinary problems through the repository's GitHub issues and use [SECURITY.md](SECURITY.md) for private security reports. The [ROADMAP.md](ROADMAP.md) lists possible improvements.

## License

This repository is licensed under the MIT License. Copyright belongs to Brajesh Kumar (`@brajesh31`); see [LICENSE](LICENSE) for the complete terms.

Last updated: 2026-10-25 22:57 UTC
