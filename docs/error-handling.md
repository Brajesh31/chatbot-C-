# 🧯 Error Handling

## Input result contract
read_input_line returns three classes of result:

| Return | Meaning | Caller action |
|---:|---|---|
| 1 | A complete or valid final line was read | Normalize and classify |
| 0 | EOF or input error | Print closure message and leave loop |
| -1 | Input line exceeded capacity | Warn and prompt for a new line |

The function checks fgets before using the buffer. When it detects a line that exceeds the buffer, it consumes the remainder until newline or EOF so the tail does not become another user message.

## Output errors
The program does not currently inspect every printf or puts return value. A terminal write failure can therefore go unreported. This is acceptable for the current demonstration but should be reconsidered if the chatbot becomes part of an automated pipeline.

## Error reporting
Do not echo arbitrary user input in diagnostic output. Keep diagnostics short, avoid secrets, and distinguish an input-length warning from EOF.
