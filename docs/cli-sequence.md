# 🔁 Console Sequence

~~~mermaid
sequenceDiagram
 actor User
 participant Main as main
 participant Reader as read_input_line
 participant Rules as classify_input
 participant Output as stdout
 Main->>Output: Print greeting
 loop Each turn
   Main->>Output: Print prompt and flush
   Main->>Reader: Read bounded line
   alt EOF or read error
     Reader-->>Main: 0
     Main->>Output: Print input closed
   else Overlong line
     Reader-->>Main: -1
     Main->>Output: Print length warning
   else Valid line
     Reader-->>Main: 1 and buffer
     Main->>Rules: Normalize and classify
     Rules-->>Main: ResponseKind
     Main->>Output: Print fixed response
   end
 end
~~~

This sequence describes the current synchronous process. There are no HTTP requests, database queries, background jobs, or asynchronous events.
