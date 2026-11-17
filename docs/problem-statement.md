# ❓ Problem Statement

A minimal string-matching chatbot is easy to write as a classroom demonstration, but a quick example can hide important C programming risks. It may ignore input-read failures, treat one long line as multiple messages, match an exit word inside an unrelated sentence, or omit tests for EOF.

The repository addresses two connected needs:

- **Learning need:** show a clear and understandable chat loop without a heavy stack.
- **Engineering need:** make the example safer to build, run, test, inspect, and extend.

## Constraints
The application must remain a small local console program. It should use standard C facilities, avoid network or persistence features, and keep behavior deterministic. Input is bounded to a fixed array, and overlong input is discarded as one logical line.

## Response
The source isolates normalization, classification, exact exit detection, response mapping, and line reading. Unit tests focus on helper behavior; shell tests exercise the real executable. The [testing guide](testing.md) explains the verification boundary.
