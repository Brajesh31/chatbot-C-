# 🗒️ Page and Screen Documentation

## Scope
There are no browser pages, mobile screens, desktop windows or route components. This guide documents actual terminal output surfaces as screen-equivalent specifications. These are output states, not screenshots.

## Terminal surface catalogue
| Surface | Trigger | Current content | Next state |
|---|---|---|---|
| Startup | Process starts | Introduction and exit instruction | Prompt |
| Input prompt | Each turn | `You: ` | Read line |
| Greeting | Input contains `hello` | Fixed greeting | Prompt |
| Status | Greeting missed; input contains `how are you` | Fixed status | Prompt |
| Fallback | No earlier rule matches | Not-understood response | Prompt |
| Length warning | Line exceeds buffer | Warning text; payload limit is 255 bytes | Prompt |
| Goodbye | Entire normalized input equals `bye` | Fixed goodbye | Exit |
| EOF notice | Input closes or read fails | Input-closed message | Exit |

## Example transcript
~~~text
Chatbot: Hi! I'm a simple chatbot. Type 'bye' to exit.
You: hello
Chatbot: Hello! How can I help you today?
You: can you explain C?
Chatbot: I'm sorry, I don't understand that.
You: bye
Chatbot: Goodbye! Have a great day!
~~~

## Content and state rules
- Prompt precedes each read and is flushed.
- Long-line warning is not a chatbot response category.
- EOF does not pass through phrase classification.
- No separate error screen exists.
- SVG illustrations are not captured screens.

When output changes, update this catalogue, [usage](usage.md), tests, [diagram catalogue](diagrams.md) and README example. Related: [responsive design](responsive-design.md), [typography](typography.md), [color system](color-system.md), [screenshot policy](assets/screenshots/README.md).
