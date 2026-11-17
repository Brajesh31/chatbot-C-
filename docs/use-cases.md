# 🧪 Use Cases

| ID | Actor | Trigger | Expected result |
|---|---|---|---|
| UC-01 | Terminal user | Launches the program | Startup message appears |
| UC-02 | Terminal user | Enters text containing “hello” | Greeting response appears |
| UC-03 | Terminal user | Enters “how are you” | Status response unless an earlier rule matches |
| UC-04 | Terminal user | Enters exactly “bye” | Goodbye and process exit |
| UC-05 | Terminal user | Enters “goodbye” | Fallback; process remains active |
| UC-06 | Terminal user | Enters an empty line | Fallback response |
| UC-07 | Terminal user | Enters more than 255 bytes | Warning and line drain |
| UC-08 | Terminal user | Closes stdin | Clean termination |
| UC-09 | Contributor | Runs make test | Unit and interactive tests execute |

## Acceptance principle
A use case is considered implemented only when its behavior exists in source and is covered by an automated or documented manual test. A roadmap entry is not evidence of implementation.
