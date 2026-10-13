# Troubleshooting

## `gcc` or `cc` is not recognized

Install a C compiler for your operating system and ensure its executable is available on `PATH`. The project does not install a compiler or provide a build system.

## `chatbot.exe` does not run on this operating system

The checked-in binary is a Windows executable. Compile `chatbot/chatbot.c` on the target system instead; see [installation.md](installation.md).

## Uppercase text gets the fallback reply

The program uses case-sensitive `strstr` checks. `hello` matches but `HELLO` does not. Input is not normalized before matching.

## A longer line appears as multiple prompts

The buffer has 100 bytes, and one `fgets` call consumes at most 99 input bytes plus the terminating NUL. The remaining part of a long line is read by the next loop iteration.

## The program keeps printing after terminal EOF

The return value of `fgets` is not checked. EOF before any successful input can leave the buffer uninitialized; EOF after a normal input can leave old contents in the buffer. Exit with the supported `bye` text for the current implementation, or fix EOF handling before using the program in a pipeline.

## A message containing `bye` exits unexpectedly

The exit condition searches for `bye` anywhere in the raw input. It is not restricted to a standalone command. The response-selection check also has an order, so an input containing both `hello` and `bye` may print the greeting and then exit.
