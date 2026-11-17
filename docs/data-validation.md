# ✅ Input Data Validation

## Current input boundary

All user content enters through standard input and is read into a fixed-size buffer. The program does not parse JSON, XML, binary uploads, configuration payloads, or network requests.

## Validation and normalization stages

~~~mermaid
flowchart TD
 A[stdin stream] --> B[fgets into 256-byte buffer]
 B --> C{Read successful?}
 C -->|No or stream error| X[EOF/read-error path]
 C -->|Yes| D{Newline in buffer?}
 D -->|Yes| N[Accept complete line]
 D -->|No, EOF already reached| N
 D -->|No, buffer may be full| P[Probe one more character]
 P -->|Newline or clean EOF| N
 P -->|Extra byte exists| E[Drain through newline or EOF]
 E --> W[Reject overlong logical line]
 N --> L[Lowercase normalization]
 L --> R[Rule classification]
 R --> O[Fixed response]
~~~

## Validation rules

- The reader requires a non-null buffer with capacity of at least two bytes; the production buffer is 256 bytes.
- A failed read must not be treated as valid user input.
- The logical line may contain at most capacity minus one bytes, which is 255 bytes for the current buffer.
- When the buffer is full without a newline, the reader probes one additional character. A newline or clean EOF means an exact-limit line and is accepted. Any additional content makes the logical line overlong; the rest is drained so it cannot become another turn.
- Accepted input must remain NUL-terminated.
- Normalization is byte-oriented and should not be treated as Unicode validation.
- Exit detection must compare the entire normalized message, not a substring.

## Not implemented

There is no schema validation, business-object validation, file upload validation, database constraints, API request validation, or server-side validation layer.

## Test coverage

Unit tests cover normalized rule behavior. POSIX and Windows process-level suites cover 254-, 255- and 256-byte lines, both newline-terminated and final-at-EOF cases, plus EOF and exact exit behavior. The exact-limit probe is specifically tested to prevent off-by-one regressions.
