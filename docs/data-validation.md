# ✅ Input Data Validation

## Current input boundary

All user content enters through standard input and is read into a fixed-size buffer. The program does not parse JSON, XML, binary uploads, configuration payloads, or network requests.

## Validation and normalization stages

~~~mermaid
flowchart TD
 A[stdin stream] --> B[fgets with fixed capacity]
 B --> C{Read successful?}
 C -->|No| X[EOF/error path]
 C -->|Yes| D{Line terminator consumed?}
 D -->|No and more bytes remain| E[Drain through newline or EOF]
 E --> W[Reject overlong line]
 D -->|Yes or valid final line| N[Lowercase normalization]
 N --> R[Rule classification]
 R --> O[Fixed response]
~~~

## Validation rules

- The buffer must have non-zero capacity.
- A failed read must not be treated as valid user input.
- The logical line must fit within the defined capacity.
- Overlong input must be drained so the remainder is not misinterpreted as another turn.
- Accepted input must remain NUL-terminated.
- Normalization is byte-oriented and should not be treated as Unicode validation.
- Exit detection must compare the entire normalized message, not a substring.

## Not implemented

There is no schema validation, business-object validation, file upload validation, database constraints, API request validation, or server-side validation layer.

## Test coverage

Unit tests cover normalized rule behavior. The POSIX integration suite covers overlong input and EOF. Add new boundary tests whenever capacity or parsing changes.
