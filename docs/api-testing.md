# 🔌 API Testing Applicability

## Current status

There is no HTTP, REST, GraphQL, RPC, socket, or external programmatic API. API endpoint tests, request authentication tests, HTTP status tests, schema contract tests, and service mocking are therefore not applicable to the current executable.

## What is tested instead

The unit suite verifies internal rule-selection helpers. The POSIX integration suite launches the executable and validates standard input/output behavior, including EOF and overlong input.

## If an API is introduced

Add a separate test matrix for:
- Route/method and request validation.
- Authentication and authorization.
- Response schema and error payloads.
- Timeouts, retry behavior, and rate limits.
- Input size and malformed payload boundaries.
- Integration failures and service unavailability.
- Security tests and privacy-sensitive data handling.

Do not label stdin/stdout assertions as HTTP API tests. See [API reference](api-reference.md) and [integration testing](integration-testing.md).
