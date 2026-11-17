# 🧭 Navigation Structure

## Product navigation model
There are no pages, routes, menus, tabs, command palette or navigation bar. Users interact through one prompt and a sequence of submitted lines. The accurate navigation model is application control flow, not a fabricated page hierarchy.

## Conversation flow
~~~mermaid
flowchart TD
    Start([Launch]) --> Intro[Startup message]
    Intro --> Prompt[Display You prompt]
    Prompt --> Input[Submit one line]
    Input --> Long{Over 255 bytes?}
    Long -->|Yes| Warn[Drain and warn]
    Warn --> Prompt
    Long -->|No| Classify[Normalize and classify]
    Classify --> Reply[Print fixed response]
    Reply --> Exit{Exact bye?}
    Exit -->|No| Prompt
    Exit -->|Yes| End([Exit])
    Input -->|EOF or error| End
~~~

## User controls
| Action | Result |
|---|---|
| Launch | Startup message and prompt |
| Submit greeting | Fixed greeting and next prompt |
| Submit status phrase | Fixed status reply and next prompt |
| Submit exact `bye` | Goodbye response and exit |
| Submit other text | Fallback and next prompt |
| Send EOF | Clean exit |
| Submit overlong line | Warning, discard remainder, prompt again |

Startup copy identifies the exit command. There is no help command or interactive menu. Supported phrases, rule order and examples are in [usage](usage.md) and [FAQ](faq.md).

A future command parser should specify syntax, invalid-command behavior, help, aliases and compatibility before implementation. Related: [user journeys](user-journeys.md), [application lifecycle](application-lifecycle.md), [CLI UX](cli-ux-guidelines.md).
