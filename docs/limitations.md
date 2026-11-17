# ⚠️ Project Limitations

## Behavior limitations
- Phrase matching is deterministic and substring-based.
- The rule set is small and cannot understand semantic intent.
- The fixed response strings do not adapt to conversation context.
- Rule order affects the response when an input contains multiple supported phrases.
- Exact bye is the only text command that ends a normal session.

## Input and language limitations
- Maximum accepted input is 255 bytes.
- The program does not perform Unicode normalization or locale-aware case folding.
- Very long input is rejected rather than processed in chunks.
- Terminal editing and history are delegated to the host terminal.

## Platform and quality limitations
- The source is targeted at C11, but every compiler and OS is not tested.
- Linux runs the POSIX shell integration suite; Windows CI currently runs compile and C unit tests.
- No numeric test coverage metric or fuzzing campaign is configured.
- No formal security audit or accessibility certification has been performed.
- The checked-in Windows executable is historical; build from current source.

## Product limitations
There is no model integration, prompt system, retrieval pipeline, persistent memory, database, API, network client, authentication, GUI, mobile app, or voice support.

## How to propose improvements

Use the feature proposal template and include a concrete use case, tests, portability analysis, and maintenance costs. Do not describe a roadmap item as implemented until source, tests, and documentation are merged.
