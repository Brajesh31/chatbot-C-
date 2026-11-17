# 📚 Data Dictionary

This dictionary describes data that exists in the current C source. It does not imply a database or persistent schema.

| Name | Representation | Meaning | Lifetime | Validation/boundary |
|---|---|---|---|---|
| input | char array | Current line from stdin | Reused in main loop | Capacity 256 bytes |
| INPUT_CAPACITY | Macro integer | Number of bytes in the input array | Compile time | 256 |
| ResponseKind | Enum | Greeting, status, goodbye, fallback | Current classification | One declared enum value |
| response text | Static const char pointer | Fixed user-visible sentence | Static storage duration | Selected by enum switch |
| reader status | int | Valid line, EOF/error, or overlong input | One read operation | 1, 0, -1 |
| normalized input | Mutable char array content | Lowercased input bytes | Until next line read | NUL-terminated within array |

## Data handling rules

The input is transient and is not written to a file by the chatbot. No account, profile, session identifier, telemetry event, or conversation archive exists. Terminal hosts and external screen/session recording tools may separately capture terminal content.

## Encoding notes

The application performs byte-oriented lowercase conversion using the C character library. This should not be described as Unicode normalization, Unicode case folding, or full multilingual input processing.

## Updating this dictionary

Update this document when a new persistent or transient data structure is introduced. Record its owner, source, lifetime, validation, sensitivity, and tests.
