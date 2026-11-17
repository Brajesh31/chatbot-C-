# 🧯 API and Input Error Reference

## No network API errors

The program has no HTTP endpoint, so HTTP status codes, API error envelopes, rate-limit responses, and server exception identifiers do not exist. The meaningful error contract is the terminal input reader.

## Input result contract

| Reader result | Meaning | Main-loop action |
|---:|---|---|
| 1 | A valid logical line was read | Normalize, classify and respond |
| 0 | EOF or input error | Print closure message and exit |
| -1 | The logical line exceeded capacity | Drain remaining characters, warn and prompt again |

## User-visible behavior

- Empty input is a valid line and receives the fallback response.
- Unsupported input receives the fallback response.
- An overlong line is rejected as one unit. Its remainder is not processed as a second message.
- EOF is a stream condition, not a message. The classifier is not called with an uninitialized buffer.
- Exact bye prints the goodbye response and terminates normally.

## Diagnostics

The application prints messages to stdout and does not maintain a structured error log. Output-stream write failures are not comprehensively checked. Do not claim that every I/O failure is recoverable.

## Testing

Use unit tests for classification and interactive tests for long input, EOF, and actual output. See [test plan](test-plan.md) and [error handling](error-handling.md).
