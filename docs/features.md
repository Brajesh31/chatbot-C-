# ✨ Feature Catalogue

| Feature | Behavior | Verification |
|---|---|---|
| Startup greeting | Prints an introductory message before the first prompt | Interactive smoke test |
| Greeting rule | Matches “hello” after lowercase normalization | Unit test |
| Status rule | Matches “how are you” when the greeting rule has not matched | Unit test |
| Exact exit | Only the entire normalized input “bye” exits | Unit and integration tests |
| Fallback | Returns a default response for unmatched or empty lines | Unit test |
| Bounded input | Accepts at most 255 bytes plus the NUL terminator | Interactive test |
| Long-line drain | Discards the remainder of an overlong logical line | Interactive test |
| EOF handling | Ends safely when stdin closes | Interactive test |

## Rule precedence
The greeting rule is checked first, followed by the status rule, exact exit, and fallback. Consequently, a message containing both “hello” and “bye” receives the greeting and does not terminate the session.

## Explicitly absent functionality
There is no AI model, sentiment analysis, language detection, conversation history, voice interface, GUI, network endpoint, user profile, or configurable response database. See [feature scope](feature-scope.md).
