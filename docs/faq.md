# FAQ

## Is this an AI chatbot?

No. It is a small C program that searches for a few lowercase substrings and prints fixed responses.

## Does it need internet access or an API key?

No. It runs locally and uses only standard C I/O and string functions.

## Why does uppercase `HELLO` not work?

The checks are case-sensitive and the input is not converted to lowercase.

## Why can a long line create multiple prompts?

Input is stored in a 100-byte buffer. `fgets` reads at most 99 bytes per iteration; the rest of a longer line remains in the input stream.

## How do I quit?

Enter text containing the lowercase substring `bye`. The current behavior also exits for longer words that contain those letters.

## Is the committed executable portable?

No. `chatbot.exe` is a Windows binary. Compile the C source on the operating system where you plan to run it.

## Where is the conversation saved?

It is not saved. The program does not write chat history to a file or database.

## Does this repository include automated tests?

No. Suggested manual cases are listed in [development.md](development.md).
