# Architecture

## Overview

The program is a single-process C command-line application. `main` prints an opening line, repeatedly reads input from standard input, calls `respond`, and stops when the input contains the substring `bye`. There are no modules beyond the C standard I/O and string libraries.

```text
Terminal input
  -> main() in chatbot/chatbot.c
  -> fgets into a 100-byte buffer
  -> remove the first newline, if present
  -> respond(input) performs ordered substring checks
  -> printf writes the response to standard output
```

## Source responsibilities

- `chatbot/chatbot.c`: declares `respond` and `main`, handles the input loop, matches phrases, and prints responses.
- `chatbot/chatbot.exe`: a prebuilt Windows executable committed alongside the C source.
- `chatbot/.vscode/settings.json`: an editor setting; it does not affect program behavior.

## Response and exit behavior

`respond` checks for lowercase `hello`, then `how are you`, then `bye`, and otherwise prints a fallback response. `strstr` performs case-sensitive substring matching. The main loop independently checks for `bye` anywhere in the line and exits after calling `respond`, whether or not the selected response was the goodbye text.

## Input limits and error handling

The local buffer is 100 bytes. A successful `fgets` stores at most 99 input bytes plus the terminating NUL. A longer line can be consumed as multiple loop iterations because the remaining bytes stay in standard input. The program does not check the return value of `fgets`; terminal EOF is therefore not handled safely.

## Runtime and data

The application runs entirely in the local terminal. It opens no sockets or files, reads no environment variables, and does not persist conversation history. It needs no database or API.
