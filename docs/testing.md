# 🧪 Testing Strategy

| Area | Coverage |
|---|---|
| Greeting/status/fallback | C unit assertions |
| Case normalization | C assertion |
| Exact exit rule | C assertion; embedded “bye” is not an exit |
| Interactive flow | POSIX shell smoke tests |
| EOF and long input | POSIX shell smoke tests |
| Strict compilation | CI warnings-as-errors |
| Platform builds | Linux and Windows CI |
| Documentation links | Python standard-library validator |
| SVG assets | XML parser and accessibility metadata check |

Run:

~~~sh
make test
python3 scripts/validate_docs.py
~~~

Manual matrix: hello -> greeting; HELLO -> greeting; how are you? -> status; goodbye -> fallback and continue; bye -> exit; empty line -> fallback; 256+ bytes -> one warning and line drain; EOF -> clean exit.

CI validates source builds and behavior in hosted environments. It does not verify the historical checked-in Windows executable, every possible compiler/platform, or a numeric test-coverage percentage.
