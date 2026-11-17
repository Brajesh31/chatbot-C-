# ▶️ Running Locally

## Run the Makefile build

~~~sh
make run
~~~

Or launch the generated executable directly:

~~~sh
./build/chatbot
~~~

## Input contract

The application reads one line at a time. It accepts at most 255 bytes in the current buffer. A longer line is discarded as one message and produces a warning. EOF ends the session.

## Supported examples

| Input | Expected result |
|---|---|
| hello | Greeting |
| HELLO | Greeting |
| how are you? | Status |
| goodbye | Fallback, continue |
| bye | Goodbye, exit |
| any unsupported phrase | Fallback |

The phrase matching behavior is described in [features](features.md) and [API/function reference](api.md).
