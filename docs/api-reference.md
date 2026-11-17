# 📖 API and Interface Reference

## Interface type

The project exposes a terminal interaction, not an HTTP or network API. There are no REST routes, GraphQL operations, RPC methods, authentication headers, JSON request payloads, or server response codes.

## User-facing interface

| Interface element | Input/output | Contract |
|---|---|---|
| Startup message | stdout | Prints the introductory prompt |
| User prompt | stdout | Flushes before waiting for input |
| User message | stdin | One logical line, maximum 255 bytes |
| Chatbot response | stdout | One fixed string selected by rule |
| Exit command | stdin | Exact normalized bye |
| End of stream | stdin | Clean process termination |

## Internal function interface

| Function | Signature summary | Responsibility |
|---|---|---|
| normalize_input | mutable char pointer | Lowercase byte values in place |
| is_exit_command | const char pointer | Exact bye comparison |
| classify_input | const char pointer | Ordered rule selection returning ResponseKind |
| response_text | ResponseKind | Maps enum to static response string |
| read_input_line | buffer and capacity | Returns valid, EOF/error, or overlong status |
| main | no arguments | Owns prompt loop and process lifetime |

The helper functions are static implementation details. They are not a published C library ABI and must not be treated as stable external symbols.

## Error and boundary behavior

See [API errors](api-errors.md), [data validation](data-validation.md), and [error handling](error-handling.md). Authentication is not applicable because no remote API or user identity exists. See [API authentication applicability](api-authentication.md).
