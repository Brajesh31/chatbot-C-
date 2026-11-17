# 🏗️ Building the Chatbot

## Standard build

The Makefile uses a C11 compiler and defaults to:

~~~text
-std=c11 -Wall -Wextra -Wpedantic -Werror -O2
~~~

Run:

~~~sh
make
~~~

The result is build/chatbot. The build directory is generated and ignored by Git.

## Direct compiler invocation

~~~sh
cc -std=c11 -Wall -Wextra -Wpedantic chatbot/chatbot.c -o chatbot
~~~

## Select a compiler or flags

~~~sh
make CC=clang
make CFLAGS="-std=c11 -Wall -Wextra -Wpedantic -Werror -g"
~~~

## Clean build output

~~~sh
make clean
make
~~~

## Windows

The Windows workflow uses MinGW gcc to compile the program and C unit tests. A local Windows user may invoke gcc directly and choose an executable filename ending in .exe. The POSIX shell integration suite is not currently part of the Windows CI job.

## Build troubleshooting

If make cannot find a compiler, install a supported toolchain and check PATH. If the compiler reports warnings as errors, fix the source warning rather than suppressing it without review.
