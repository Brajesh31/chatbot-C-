# 🗒️ Test Plan

## Scope
This plan covers current command-line behavior and repository checks. It does not cover non-existent APIs, database operations, GUI behavior, or model quality.

## Core test cases
| ID | Input or action | Expected result |
|---|---|---|
| TP-01 | Start executable | Introductory message displayed |
| TP-02 | hello | Greeting response |
| TP-03 | HELLO | Same greeting response |
| TP-04 | how are you? | Status response |
| TP-05 | bye | Goodbye and process exit |
| TP-06 | goodbye | Fallback and process remains active |
| TP-07 | hello and bye | Greeting and process remains active |
| TP-08 | Empty line | Fallback response |
| TP-09 | More than 255 bytes | Warning; remainder discarded |
| TP-10 | EOF | Clean termination message |

## Environment
Use a C11-capable compiler. Linux runs the full shell integration suite. Windows CI compiles the application and C unit tests with MinGW; the Linux shell script is not claimed as a Windows test.

For each failure, record compiler/version, operating system, exact input, expected output, actual output, exit code, and relevant CI run.
