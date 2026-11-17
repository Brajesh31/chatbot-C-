# 📖 Glossary

This glossary defines terms used by the implementation and its engineering documentation. It is specific to the C terminal chatbot, not a general AI/chat platform glossary.

| Term | Meaning in this repository | Related concept |
|---|---|---|
| C11 | The C language standard targeted by the source and strict build commands | Technology stack |
| C standard library | Standard headers and functions provided by the compiler/runtime environment | Dependencies |
| stdin | Standard input stream from which the chatbot receives a user's line | Input contract |
| stdout | Standard output stream used for prompt and response text | CLI interface |
| fgets | Standard C function that reads a bounded string from a stream | Input boundary |
| NUL terminator | Zero byte marking the end of a C string | Buffer safety |
| Buffer | Fixed-size memory area holding the current input line | Input capacity |
| INPUT_CAPACITY | Compile-time macro set to 256 bytes, including the final NUL | Input size |
| Logical line | One user message ending at newline or the end of the input stream | Long-line handling |
| EOF | End-of-file indicator returned by the input stream | Termination |
| Overlong line | A logical input line exceeding the available input buffer | Rejection/draining |
| Line draining | Consuming the remaining bytes of an overlong logical line so its tail is not treated as a new message | Input safety |
| Substring | A sequence of bytes occurring within a larger string | Greeting/status matching |
| Exact match | Comparison of the whole normalized input against a command | Exit behavior |
| Normalization | Lowercasing accepted input bytes before phrase checks | Character handling |
| ASCII | Character encoding subset for which common English letters have predictable byte values | Matching limitation |
| Unicode case folding | Language-aware comparison beyond simple byte-to-lowercase conversion | Not implemented |
| Enum | C type that names a finite set of integral values | ResponseKind |
| ResponseKind | Internal enum identifying greeting, status, goodbye or fallback | Rule engine |
| Rule precedence | Order in which matching conditions are evaluated | Classifier |
| Fallback | Fixed response used when no earlier rule matches | Response mapping |
| Unit test | Test of helper behavior without driving the whole interactive process | C assertions |
| Integration test | Test that launches the executable and uses real stdin/stdout | Shell test |
| Static analysis | Tool-assisted source inspection without running all possible program inputs | CodeQL/GCC analyzer |
| CI | Automated workflows that build, test and inspect repository changes | GitHub Actions |
| ADR | Architecture Decision Record explaining a durable technical decision | decisions/ |
| DFD | Data Flow Diagram showing source, processing and destination of data | data-flow.md |
| Historical binary | Existing checked-in executable retained from the original repository, not guaranteed to match current source | chatbot.exe |
| Runtime dependency | Software needed by the application while executing | C standard library |
| Development dependency | Tool required only to build, test or validate repository content | Make/Python/shell |

## Important distinctions

- **Rule-based chatbot** means fixed conditions and fixed responses, not machine learning or semantic language understanding.
- **Case-insensitive** here means byte-oriented lowercase conversion for supported input, not full Unicode case-insensitive matching.
- **Input limit** is 255 bytes, not 255 visible characters.
- **API reference** documents the terminal and private helper contract. There is no HTTP API.
- **Deployment** means local executable distribution. There is no hosted application deployment.

## Maintaining the glossary

When introducing a new technical term in README or multiple guides, add a short definition here and link to the authoritative implementation guide. Remove or mark terms that become obsolete after an architecture change.
