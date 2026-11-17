# ⚠️ Known Issues and Limitations

| Area | Current limitation | Impact |
|---|---|---|
| Matching | Simple substring rules | May respond unexpectedly to phrases containing a supported word |
| Language | Byte-oriented lowercase conversion | Not Unicode case folding or language-aware processing |
| Memory | No conversation history | Cannot refer to previous messages |
| Responses | Static strings | No contextual or generated answers |
| Input | 255-byte limit, measured in bytes | Longer logical lines are rejected after the remainder is drained |
| Output | Standard output errors are not fully handled | Broken output streams may not be reported clearly |
| Platforms | POSIX shell tests run on Linux and PowerShell process tests run on Windows CI | macOS and other toolchains are not yet covered by CI |
| Binary | Tracked Windows executable is historical | Provenance and freshness are not guaranteed by source CI |

These are known scope or engineering limitations, not claims of open security vulnerabilities. Report reproducible defects through the issue template.
