# 🔗 Integration Testing

## Purpose

The integration suite launches the compiled chatbot and drives it through standard input. It verifies observable behavior at the executable boundary rather than calling helper functions directly.

## Current scenarios

| Scenario | Expected result |
|---|---|
| Startup and greeting | Introductory message and greeting response appear |
| Multiple turns | Program continues after a non-exit response |
| Status phrase | Fixed status response is printed |
| Exact bye | Goodbye response appears and process exits |
| goodbye | Fallback response appears and process continues |
| EOF | Process prints closure message and exits cleanly |
| Overlong line | Entire long logical line is drained and one warning appears |
| Input after overlong line | A fresh line is read, not the tail of the rejected message |

## Run

~~~sh
make test
~~~

Or directly after compiling:

~~~sh
sh tests/test_interactive.sh ./build/chatbot
~~~

## Test mechanics

The shell script feeds controlled text to the built executable, captures its output, and checks expected fragments and continuation behavior. It uses POSIX shell utilities and awk. The script should not be treated as a Windows-native test harness.

## Platform coverage

Linux CI runs the full shell integration suite. Windows CI compiles the C application and unit-test executable with MinGW and runs the unit tests. It does not currently run the POSIX shell integration script.

## Limitations

This suite is an executable-level CLI integration test. It is not browser automation, GUI testing, service-to-service integration, network API testing, multi-user concurrency testing or a performance benchmark. New input or exit behavior must add an explicit regression scenario.
