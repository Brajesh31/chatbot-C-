# ⚠️ Known Issues and Limitations

| Area | Current limitation | Impact |
|---|---|---|
| Matching | Simple substring rules | May respond unexpectedly to phrases containing a supported word |
| Language | Byte-oriented lowercase conversion | Not Unicode case folding or language-aware processing |
| Memory | No conversation history | Cannot refer to previous messages |
| Responses | Static strings | No contextual or generated answers |
| Input | 255-byte limit | Longer messages are rejected |
| Output | Standard output errors are not fully handled | Broken output streams may not be reported clearly |
| Platforms | Shell integration tests are POSIX-based | Windows CI runs build and C unit tests only |
| Binary | Tracked Windows executable is historical | Provenance and freshness are not guaranteed by source CI |

These are known scope or engineering limitations, not claims of open security vulnerabilities. Report reproducible defects through the issue template.
