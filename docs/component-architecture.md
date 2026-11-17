# 🧱 Component Architecture

There are no separately deployed components. The following logical modules are functions in one translation unit.

~~~mermaid
flowchart TB
 Main[main: console loop]
 Reader[read_input_line]
 Normalizer[normalize_input]
 Rules[classify_input and is_exit_command]
 Mapper[response_text]
 Main --> Reader
 Main --> Normalizer
 Main --> Rules
 Main --> Mapper
~~~

| Component | Input | Output | Side effects |
|---|---|---|---|
| main | stdin stream | process exit code | stdout and stdin |
| read_input_line | stream and buffer | status plus buffer | consumes stdin |
| normalize_input | mutable string | normalized string | mutates buffer |
| classify_input | normalized string | enum | none |
| response_text | enum | pointer to static text | none |

Helper functions are static and private to the implementation. The unit test includes the implementation with main temporarily renamed so it can exercise helpers. This is not a public library ABI.

If the program grows enough to justify separate translation units, introduce a public header and build each module independently. Do not create empty layers before there is a real need.
