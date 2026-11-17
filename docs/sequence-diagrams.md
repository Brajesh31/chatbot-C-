# 🔁 Runtime Sequence Diagrams

These diagrams describe the current single-process C command-line application. They are not client/server or network API diagrams. Input arrives through standard input and chatbot output is written to standard output.

## Normal conversation turn

~~~mermaid
sequenceDiagram
    actor User
    participant Terminal
    participant Main as main()
    participant Reader as read_input_line()
    participant Normalizer as normalize_input()
    participant Classifier as classify_input()
    participant Mapper as response_text()

    Main->>Terminal: Print welcome message
    loop Until exit or input ends
        Main->>Terminal: Print prompt and flush stdout
        User->>Terminal: Enter one line
        Terminal->>Reader: stdin bytes
        Reader-->>Main: Accepted NUL-terminated line
        Main->>Normalizer: Normalize accepted bytes
        Normalizer-->>Main: Lowercase text
        Main->>Classifier: Evaluate ordered phrase rules
        Classifier-->>Main: ResponseKind
        Main->>Mapper: Map response kind
        Mapper-->>Main: Static response string
        Main->>Terminal: Print response
    end
    Note over Main,Terminal: Exact normalized "bye" prints goodbye and ends the loop
~~~

## Input boundary sequence

~~~mermaid
sequenceDiagram
    participant Main as main()
    participant Reader as read_input_line()
    participant Stdin as stdin
    Main->>Reader: Read into 256-byte buffer
    Reader->>Stdin: fgets(buffer, 256, stdin)
    alt Newline is already in the buffer
        Stdin-->>Reader: Complete line
        Reader-->>Main: Accepted
    else Buffer contains 255 bytes without newline
        Reader->>Stdin: Read one additional character
        alt Additional character is newline
            Stdin-->>Reader: Newline
            Reader-->>Main: Accept exactly 255 bytes
        else Additional read is clean EOF
            Stdin-->>Reader: EOF
            Reader-->>Main: Accept final 255-byte line
        else Additional data exists
            Stdin-->>Reader: Extra byte
            Reader->>Stdin: Drain through newline or EOF
            Reader-->>Main: Reject overlong logical line
        end
    end
~~~

The additional-character probe is important. A fixed-size `fgets` call can fill the buffer before it reads a following newline. Treating every full buffer as overlong would incorrectly reject a line that is exactly at the documented limit.

## EOF and exit sequence

~~~mermaid
sequenceDiagram
    actor User
    participant Main as main()
    participant Reader as read_input_line()
    participant Terminal

    Main->>Terminal: Print prompt
    alt stdin reaches EOF or a read error
        Main->>Reader: Request next line
        Reader-->>Main: EOF/read-error status
        Main->>Terminal: Print input-closed message
        Main-->>User: End process
    else User enters exact "bye"
        Reader-->>Main: Accepted line
        Main->>Main: Normalize and classify
        Main->>Terminal: Print goodbye response
        Main-->>User: End process
    else User enters "goodbye" or another phrase
        Reader-->>Main: Accepted line
        Main->>Main: Classify as fallback
        Main->>Terminal: Print fallback response
        Note over Main,Terminal: Conversation continues
    end
~~~

## Trust and data boundaries

| Boundary | Current behavior |
|---|---|
| Terminal to process | Bytes arrive through `stdin`; one logical line is bounded by the fixed buffer |
| Reader to classifier | Only a complete accepted line is passed to classification |
| Classifier to output | A `ResponseKind` selects a constant response string |
| Process to external systems | No network, filesystem persistence, remote model or database access |

Update these diagrams with [state diagrams](state-diagrams.md), [data flow](data-flow.md), [input validation](data-validation.md), and the [test matrix](testing-matrix.md) whenever input parsing or rule precedence changes.
