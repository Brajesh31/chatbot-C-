# 💬 Usage Guide

## Start the application

Build from source using make, then start the generated executable:

~~~sh
make
./build/chatbot
~~~

On Windows, compile with MinGW-w64 and run the generated .exe file. See [installation](installation.md) and [building](building.md).

## Supported phrases

| Example input | Result | Session continues? |
|---|---|---|
| hello | Greeting | Yes |
| HELLO there | Greeting | Yes |
| how are you? | Status response | Yes |
| goodbye | Fallback response | Yes |
| hello and bye | Greeting, because greeting has higher priority | Yes |
| bye | Goodbye response | No |
| Empty line | Fallback response | Yes |
| Any unrecognized line | Fallback response | Yes |

## Input length

At most 255 bytes are accepted in one line. An overlong line is drained through its newline and rejected as one message. The remaining tail is not treated as a separate conversation turn.

## End the session

Enter exact bye and press Enter. Closing standard input also ends the session. The latter is useful when running non-interactively or testing EOF behavior.

## Example transcript

~~~text
Chatbot: Hi! I'm a simple chatbot. Type 'bye' to exit.
You: hello
Chatbot: Hello! How can I help you today?
You: how are you?
Chatbot: I'm just a program, but thanks for asking!
You: bye
Chatbot: Goodbye! Have a great day!
~~~

The transcript reflects the current implementation. For detailed rule precedence see [API/function reference](api.md).
