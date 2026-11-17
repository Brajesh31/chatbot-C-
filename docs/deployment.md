# 📦 Deployment and Distribution

This is a native console program, not a web service. It needs no server, hosting platform, API key, or database.

Build using `make`; output is `build/chatbot`. Create a native Windows executable with MinGW-w64 or another Windows compiler.

Before distribution:
- [ ] Build from the intended commit.
- [ ] Record compiler/version, OS, and architecture.
- [ ] Run unit and interactive tests.
- [ ] Include source and MIT license.
- [ ] Confirm binary target format.
- [ ] Exclude unrelated local build products.

The existing `chatbot/chatbot.exe` is a historical Windows binary. Source CI does not validate its provenance.
