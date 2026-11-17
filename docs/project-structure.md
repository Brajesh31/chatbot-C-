# 🗂️ Project Structure

```text
chatbot-C-/
├── .github/                 Issue forms, PR template, CI and CodeQL
├── chatbot/chatbot.c        C application source
├── chatbot/chatbot.exe      Existing Windows executable
├── docs/
│   ├── assets/              SVG diagrams
│   ├── decisions/           Architecture decision records
│   └── templates/           Reusable review/release templates
├── tests/
│   ├── test_chatbot.c       C unit tests
│   └── test_interactive.sh  Console smoke tests
├── Makefile
├── README.md
└── project policy files
```

Build output is generated under `build/` and ignored by Git.
