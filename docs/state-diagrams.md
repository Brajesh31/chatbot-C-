# 🔀 Application and Reader State Diagrams

The chatbot has a small transient execution state. It does not maintain persisted conversation state, a user profile, a session database, authentication state, or background processes.

## Main application lifecycle

~~~mermaid
stateDiagram-v2
    [*] --> Startup
    Startup --> Prompting: Welcome message printed
    Prompting --> Reading: Prompt printed and flushed
    Reading --> InputEnded: EOF or input error
    Reading --> Rejecting: Logical line exceeds 255 bytes
    Reading --> Normalizing: Complete line accepted
    Rejecting --> Prompting: Warning printed
    Normalizing --> Classifying: Lowercase normalization complete
    Classifying --> Responding: ResponseKind selected
    Responding --> Finished: Exact normalized "bye"
    Responding --> Prompting: Any continuing response
    InputEnded --> Finished
    Finished --> [*]
~~~

## Input-reader decision states

~~~mermaid
stateDiagram-v2
    [*] --> ReadBuffer
    ReadBuffer --> Accepted: Newline captured
    ReadBuffer --> Accepted: Short final line reaches EOF
    ReadBuffer --> ProbeNextByte: Buffer filled without newline
    ProbeNextByte --> Accepted: Next byte is newline
    ProbeNextByte --> Accepted: Next read is clean EOF
    ProbeNextByte --> DrainRemainder: Extra content exists
    ProbeNextByte --> ReadFailure: Stream error
    DrainRemainder --> Rejected: Newline or EOF reached
    DrainRemainder --> ReadFailure: Stream error while draining
    Accepted --> [*]
    Rejected --> [*]
    ReadFailure --> [*]
~~~

## State descriptions

| State | Entry condition | Exit behavior |
|---|---|---|
| Startup | `main` begins | Welcome text is printed |
| Prompting | A previous turn completed or an overlong line was rejected | Prompt is printed and stdout is flushed |
| Reading | The process waits for a complete logical line | Accept, reject, or end the session |
| Rejecting | More than 255 bytes belong to one logical line | Remainder is drained and one warning is printed |
| Normalizing | Reader returned an accepted line | Input bytes are lowercased using the C locale |
| Classifying | Normalization completed | Ordered phrase rules choose one `ResponseKind` |
| Responding | A response kind is available | Constant text is printed |
| Input ended | EOF or a stream read failure is reported | Session exits without classifying stale buffer content |
| Finished | Exact `bye` was entered or input ended | Main loop terminates |

## State invariants

1. The classifier only receives an accepted input line.
2. Rejected long input is consumed through the line terminator or EOF, so its tail is not treated as a new user message.
3. A response is selected from a finite enum, not generated from user content.
4. The exit transition happens only after the goodbye response is printed for exact normalized `bye`.
5. No state is restored after process termination.

Changes to transitions should update [runtime sequences](sequence-diagrams.md), [application lifecycle](application-lifecycle.md), [workflow](workflow.md), and [test strategy](test-strategy.md). Boundary tests cover 254-, 255-, and 256-byte lines, with and without a trailing newline.
