# 🔄 Application Workflow

## Interactive workflow

~~~mermaid
flowchart TD
 A([Program starts]) --> B[Print opening message]
 B --> C[Print prompt and flush stdout]
 C --> D[Read bounded line]
 D --> E{Read result}
 E -->|EOF or error| X([Exit])
 E -->|Too long| F[Drain rest of line and warn]
 F --> C
 E -->|Valid line| G[Normalize lowercase]
 G --> H{Greeting substring?}
 H -->|Yes| I[Greeting response]
 H -->|No| J{Status phrase?}
 J -->|Yes| K[Status response]
 J -->|No| L{Exact bye?}
 L -->|Yes| M[Goodbye response]
 L -->|No| N[Fallback response]
 I --> C
 K --> C
 N --> C
 M --> X
~~~

## Rule-priority implications

The first matching rule wins. A string containing hello and bye triggers the greeting, not the exit condition. The exit command is exact after normalization, so goodbye does not exit.

## Failure and recovery

An EOF or input error ends the process. A line exceeding the configured capacity is discarded, a warning is printed, and the next prompt begins. See [error handling](error-handling.md).

## Scope

This is an in-process workflow. There is no frontend render lifecycle, backend request lifecycle, database transaction, message broker, webhook, or remote integration.
