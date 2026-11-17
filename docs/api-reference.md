# 📖 C Function and User Interface Reference

## 1. Interface classification

The application exposes a terminal user interface, not a web API. There are no HTTP routes, GraphQL operations, RPC endpoints, webhooks, authentication headers, JSON payload contracts or server status codes.

The source has a small set of file-local helper functions. They are declared `static`, so they are implementation details and are not a supported public C library ABI.

## 2. User-facing contract

| Surface | Direction | Contract |
|---|---|---|
| Welcome line | stdout | Printed once at process startup |
| Prompt | stdout | `You:` is printed and flushed before blocking for input |
| Message | stdin | One logical line; maximum 255 bytes |
| Response | stdout | Fixed string mapped from `ResponseKind` |
| Exit command | stdin | Exact normalized `bye` only |
| EOF/read error | stdin status | Ends the prompt loop through the input-closed path |

## 3. Internal declarations

The following signatures reflect the current source file:

~~~c
typedef enum {
    RESPONSE_GREETING,
    RESPONSE_STATUS,
    RESPONSE_GOODBYE,
    RESPONSE_FALLBACK
} ResponseKind;

static void normalize_input(char *text);
static int is_exit_command(const char *text);
static ResponseKind classify_input(const char *text);
static const char *response_text(ResponseKind kind);
static int read_input_line(char *buffer, size_t capacity);
int main(void);
~~~

### Function contracts

| Function | Preconditions | Return / side effect | Failure or edge behavior |
|---|---|---|---|
| `normalize_input` | Writable NUL-terminated string | Mutates each byte in place | Uses current C locale; not Unicode case folding |
| `is_exit_command` | Non-NULL NUL-terminated string supplied by internal caller | Returns nonzero only for exact `bye` | `goodbye` and `bye now` are false |
| `classify_input` | Accepted normalized string | Returns one enum category | Greeting wins over status and exit when multiple patterns occur |
| `response_text` | A `ResponseKind` value | Returns a constant string pointer | Unknown enum values map to fallback text |
| `read_input_line` | Writable buffer with capacity in supported range | Returns 1 accepted, 0 input-ended/invalid argument, -1 overlong | Drains overlong remainder; detects stream error |
| `main` | Process runtime | Runs prompt loop; returns 0 | Exits on exact `bye`, EOF or input error |

## 4. Reader return contract

| Return value | Meaning | Caller action |
|---:|---|---|
| `1` | Complete accepted line, including valid final line at EOF | Normalize and classify |
| `0` | EOF, stream read error or invalid buffer/capacity | Print input-closed message and exit loop |
| `-1` | Logical line exceeded accepted byte limit | Print byte-limit warning and prompt again |

The main function always passes the local 256-byte input array. The defensive argument checks remain useful if the helper is changed or extracted later, but no external caller can currently invoke it.

## 5. Response enum

| Enum value | Meaning | Text |
|---|---|---|
| `RESPONSE_GREETING` | Greeting substring found | `Hello! How can I help you today?` |
| `RESPONSE_STATUS` | Status phrase found after greeting check | `I'm just a program, but thanks for asking!` |
| `RESPONSE_GOODBYE` | Exact exit command found | `Goodbye! Have a great day!` |
| `RESPONSE_FALLBACK` | No other rule matched | `I'm sorry, I don't understand that.` |

## 6. No remote API or data schema

There are no endpoint definitions, methods, request/response schemas, HTTP error codes, database tables, foreign keys, token formats or remote identity claims. The API and database guide filenames are retained as applicability documentation only.

See [architecture](architecture.md), [data flow](data-flow.md), [error handling](error-handling.md) and [scope and limitations](scope-and-limitations.md).
