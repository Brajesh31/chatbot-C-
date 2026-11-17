# 🎯 Scope and Limitations

## Product scope

Simple C Chatbot is a local, single-process C11 terminal program. It reads one bounded line from standard input, normalizes byte values to lowercase, checks ordered phrase rules, prints a fixed response, and repeats until exact bye or EOF.

## Implemented capabilities

| Capability | Current behavior | Evidence |
|---|---|---|
| Console interaction | Prompt, read one line, print response | chatbot/chatbot.c |
| Greeting | Substring match for hello after lowercase conversion | tests/test_chatbot.c |
| Status | Substring match for how are you when greeting did not match | tests/test_chatbot.c |
| Exit | Whole normalized input must equal bye | tests/test_chatbot.c |
| Fallback | Fixed response for unmatched input | tests/test_chatbot.c |
| Input bound | 255 bytes accepted, longer logical lines rejected | tests/test_interactive.sh |
| EOF | Exit without classifying uninitialized input | tests/test_interactive.sh |

## Non-goals

The project does not implement generative AI, semantic intent detection, language models, memory, user profiles, a database, HTTP endpoints, network sockets, authentication, authorization, a graphical interface, a mobile app, voice input/output, analytics, or a hosted service.

## Input and language limitations

The input capacity is 256 bytes including the terminating NUL, so the maximum accepted line is 255 bytes. This is a byte limit, not a Unicode character limit. Lowercase conversion is not full Unicode case folding. Substring rules can match phrases in unintended contexts, and rule order affects outcomes.

## Extension requirements

Before adding a capability, state the real user need, expected interaction, rule precedence, resource and portability implications, test cases, documentation impact, privacy and security effects, and maintenance cost. Do not add an empty framework layer merely to resemble a larger application.

Related: [feature scope](feature-scope.md), [known issues](known-issues.md), [roadmap](roadmap.md), [technical debt](technical-debt.md).
