# 💻 Command-Line UX Guidelines

The interface should remain a simple text conversation. Prompts should be visible before the program waits for input, which is why stdout is flushed after printing the user prompt.

## Interaction principles
- Make the exit command visible in the startup message.
- Use short, unambiguous responses.
- Keep errors distinct from normal fallback replies.
- Do not rely on color, cursor positioning, or animation.
- Keep long-input warnings actionable.
- Ensure the next prompt begins after the previous response.
- Update documentation and examples when text changes.

There is no command parser, help option, argument configuration, history, or interactive line editor implemented by the chatbot itself. Terminal editing before Enter belongs to the terminal environment.
