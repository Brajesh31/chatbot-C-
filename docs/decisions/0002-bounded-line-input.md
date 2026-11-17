# ADR 0002: Bounded Input and Clean EOF Behavior

- **Status:** Accepted
- **Date:** 2026-11-17
- **Decision owner:** Project maintainer
- **Related source:** chatbot/chatbot.c
- **Related tests:** tests/test_chatbot.c, tests/test_interactive.sh

## 1. Context

The original program used a small fixed input buffer and did not check the return value of fgets. At EOF, later code could operate on a buffer that did not contain a newly read line. When a physical input line exceeded the buffer, the unread tail could be consumed as a separate loop iteration, creating multiple logical messages from one user submission.

The exit behavior also needed a whole-command comparison rather than an incidental substring match.

## 2. Decision drivers

- Bound memory use.
- Never classify an unsuccessful input read.
- Treat one overlong user line as one rejected message.
- Keep input handling deterministic.
- Avoid dynamic allocation for the current small use case.
- Make exit behavior explicit and testable.

## 3. Options considered

| Option | Benefits | Costs and risks | Decision |
|---|---|---|---|
| Fixed buffer with checked read and line drain | Simple, bounded, portable | Maximum message length is fixed | Selected |
| Read until newline using dynamic growth | Accepts arbitrary line lengths | More allocation/error paths and ownership complexity | Not needed |
| Process buffer chunks as multiple messages | Simple loop mechanics | Splits one user message into several turns | Rejected |
| Ignore failed read and reuse buffer | No explicit handling code | Can use stale/uninitialized input | Rejected |

## 4. Decision

Use a 256-byte buffer, allowing at most 255 bytes plus the NUL terminator. Check the result of the read before accessing the line. If the logical line is longer than the buffer can accept, consume the remainder through newline or EOF, report a warning, and continue with a fresh prompt.

On EOF or input error, leave the loop without classifying the buffer. Normalize accepted input bytes using an unsigned-char conversion before tolower. Exit only when the entire normalized line equals bye.

## 5. Consequences

**Positive:** bounded memory, predictable logical lines, clean EOF behavior, exact exit semantics, and straightforward tests.

**Trade-offs:** messages longer than 255 bytes are rejected. The byte-oriented buffer and lowercase conversion are not a Unicode-aware text-processing system.

## 6. Security, privacy and accessibility

The input stream is untrusted and must remain bounded. The program does not retain rejected or accepted lines in an application log. Warnings are plain text and must remain understandable without color.

## 7. Verification

Unit tests cover normalization, classifier outcomes, fallback and exact exit matching. The POSIX integration suite checks long input and EOF. CI builds and tests on Linux and Windows; only Linux runs the POSIX shell suite.

## 8. Reconsideration triggers

Revisit the fixed size if product requirements demand longer messages. Any change must define a new limit or allocation strategy, preserve EOF correctness, test the boundary values, update docs and diagrams, and assess memory/error behavior.
