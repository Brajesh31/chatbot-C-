# Development

## Build commands

There is no package manager, Makefile, or build script. Compile the source directly from the repository root:

```sh
cc chatbot/chatbot.c -o chatbot/chatbot-build
./chatbot/chatbot-build
```

On Windows with MinGW, use `gcc chatbot/chatbot.c -o chatbot/chatbot-build.exe` and run the resulting executable from PowerShell. See [installation.md](installation.md).

## Current implementation

`main` uses `char input[100]` and reads with `fgets`. It removes a newline using `strcspn`, invokes `respond`, and checks for the `bye` substring to end the loop. `respond` uses an ordered `if`/`else if` chain with `strstr` to select fixed text.

## Suggested validation cases

The repository has no automated test harness. When changing behavior, manually verify at least:

- Empty input and an unrecognized phrase
- Lowercase and uppercase versions of each supported phrase
- A phrase embedded inside a longer word
- A line near and above the 99-byte input limit
- EOF before and after a normal line
- An input containing `bye` together with another recognized phrase

Describe exactly which compiler and checks you used. Do not claim that this list has been run unless you ran it.

## Coding guidance

- Check input function return values before using the buffer.
- Decide how to handle lines longer than the buffer and document that behavior.
- Avoid unbounded input functions and unsafe formatting.
- Use a dedicated response-selection function if tests need to inspect returned values without capturing terminal output.
- Keep build output under the ignored `chatbot-build` name so it does not replace the committed Windows executable.

## Secrets and data

The program uses no network, credentials, or persistent storage. Do not introduce environment values or external services without documenting their purpose and handling.
