# 🔁 Application Lifecycle

~~~mermaid
stateDiagram-v2
 [*] --> Startup
 Startup --> WaitingForInput
 WaitingForInput --> ReadFailure: EOF or error
 WaitingForInput --> RejectLine: overlong input
 RejectLine --> WaitingForInput
 WaitingForInput --> Normalize: valid line
 Normalize --> Classify
 Classify --> Respond
 Respond --> WaitingForInput: not exact bye
 Respond --> Terminated: exact bye
 ReadFailure --> Terminated
 Terminated --> [*]
~~~

## Lifecycle stages
1. **Startup:** create the fixed stack buffer and print the introduction.
2. **Wait:** prompt and flush stdout so an interactive user sees it immediately.
3. **Read:** call the bounded line reader.
4. **Reject:** for an overlong line, drain the remaining bytes through newline or EOF and prompt again.
5. **Normalize:** lowercase accepted bytes.
6. **Classify:** evaluate rules in stable priority order.
7. **Respond:** map the classification to constant response text.
8. **Terminate or repeat:** exact “bye” exits; otherwise wait for another line.

EOF is a terminal condition, not a user utterance. It does not pass through the classifier.
