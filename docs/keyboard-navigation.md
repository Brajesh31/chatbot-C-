# ⌨️ Keyboard Interaction

The application is controlled entirely through the terminal input stream.

| Interaction | Current behavior |
|---|---|
| Type characters | Collected into the current line |
| Press Enter | Submits the line |
| Type exact “bye” and press Enter | Prints goodbye and exits |
| Send EOF | Exits cleanly |
| Enter more than 255 bytes | Discards the logical line and warns |

The program does not define custom key bindings, arrow-key navigation, menus, or interactive history. Editing before Enter is provided by the terminal line discipline, not by the chatbot itself.

Do not claim that the executable has a built-in keyboard navigation system. It is a simple line-oriented console interaction.
