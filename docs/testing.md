# 🧪 Testing Strategy

| Area | Coverage |
|---|---|
| Greeting/status/fallback | C assertions |
| Case normalization | C assertion |
| Exact exit rule | C assertion including embedded `bye` |
| Interactive flow | Shell smoke tests |
| EOF and long input | Shell smoke tests |
| Strict compilation | CI warnings-as-errors |
| Platform builds | Linux and Windows CI |

Run `make test`.

Manual matrix: `hello` => greeting; `HELLO` => greeting; `how are you?` => status; `goodbye` => fallback; `bye` => exit; empty line => fallback; 256+ bytes => one warning and line drain; EOF => clean exit.

CI validates source builds and behavior in hosted environments. It does not verify the historical checked-in Windows executable or every possible compiler/platform.
