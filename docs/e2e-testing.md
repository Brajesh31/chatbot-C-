# 🧪 End-to-End Testing

## Scope

The POSIX shell integration test acts as the end-to-end test for the current terminal executable. It launches the built program, supplies input through stdin, captures stdout, and checks observable output and process behavior.

## User journeys covered

- Startup followed by a supported greeting.
- Status phrase and continued conversation.
- Exact exit command.
- A phrase containing bye that must not exit.
- End-of-file handling.
- An overlong logical line followed by a fresh prompt.

## Run

~~~sh
make test
~~~

The Makefile compiles the application and test executable before invoking tests/test_interactive.sh. The script relies on a POSIX shell and awk, and is executed on Linux CI.

## Boundary

This is a command-line end-to-end smoke suite, not browser automation, GUI automation, a distributed system test, or a multi-user integration suite. Windows CI currently compiles the source and runs C unit tests; it does not run the POSIX shell integration script.
