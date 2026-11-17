# 🔬 Technical Overview

## Language and compilation
The application is written in C and targets the C11 language standard. Preferred direct compile command:

~~~sh
cc -std=c11 -Wall -Wextra -Wpedantic -Werror chatbot/chatbot.c -o chatbot
~~~

The Makefile builds into build/ and exposes all, run, test, check, and clean targets.

## Runtime libraries
The source includes ctype.h, stdio.h, and string.h. These are standard C headers. No application-specific package manager or lockfile is required.

## Runtime model
The operating system starts one process. The program writes prompts to stdout, reads from stdin, performs local string operations, and exits normally after exact “bye” or EOF.

## Portability notes
The code avoids POSIX-only runtime APIs. Shell integration tests are POSIX-oriented and execute on Linux CI. Windows CI compiles the source and runs the C unit-test executable with MinGW.

No benchmark baseline, external API, plugin interface, binary compatibility guarantee, or production service deployment is currently offered.
