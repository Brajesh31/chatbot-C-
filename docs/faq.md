# ❓ Frequently Asked Questions

## Product and behavior

### Is this chatbot powered by AI or a large language model?
No. It is a deterministic C program with a small number of fixed phrase checks and predefined text responses. It does not call an AI model, use embeddings, perform retrieval, or understand natural-language intent.

### What does the chatbot currently recognize?
It checks for the phrase hello, then how are you, then an exact bye command. All other input receives a fallback response. Rule order is important.

### Why does hello and bye not exit?
The greeting rule has higher priority than the exit rule. The entire input must equal bye after normalization to trigger a normal goodbye exit.

### Why does goodbye not exit?
The exit rule is an exact comparison. The word goodbye is not equal to bye.

### Is matching case-sensitive?
No for the supported English ASCII phrases. Input bytes are passed through lowercase conversion before rule checks. This is not full Unicode case folding.

### Does the program remember the conversation?
No. It keeps the current line in a fixed process buffer. It does not save messages, profiles, or conversation history.

## Input and termination

### What is the maximum input length?
255 bytes. The buffer is 256 bytes so it can contain the input plus a terminating NUL byte.

### What happens when a line is too long?
The remainder of that logical line is drained and rejected. The chatbot prints a warning and shows a fresh prompt. It does not treat the remaining tail as a second message.

### What happens when stdin closes?
The reader returns an EOF/error status. The program prints a closure message and exits without classifying uninitialized data.

### Can I pipe text into the program?
Yes. It reads from standard input, processes lines, and terminates when it receives exact bye or reaches EOF.

## Build and tests

### Do I need GNU Make?
No. Make is the recommended convenience tool, but direct C compiler commands are provided in README and installation.md.

### Do I need Python?
Not to run the chatbot. Python 3 is used only for documentation, Markdown and repository validation scripts.

### Does Windows run the same full integration test?
Not currently. Windows CI compiles the app and runs the C unit tests with MinGW. The POSIX shell integration test runs on Linux CI.

### How do I run all local checks?
Run make check. It builds and tests the application, validates local docs/SVGs, checks Markdown fences, verifies the tracked project tree, and runs the repository secret-pattern hygiene scan.

### Why does CodeQL need a build step?
CodeQL needs to extract C/C++ source from a build process. The workflow runs the CodeQL autobuild action after initialization and before analysis.

## Architecture and privacy

### Is there a database or HTTP API?
No. The current program has no database, server, network endpoint, account system, or remote integration.

### Does the chatbot collect telemetry?
No telemetry or analytics code is included. Terminal hosts, session recorders, operating systems, and screen-sharing tools may independently capture terminal content.

### Is the app suitable for production customer support?
No. It is an educational phrase-matching example. It can return irrelevant fallback messages and has no identity, service monitoring, escalation or contextual understanding.

## Contribution and troubleshooting

### How do I propose a new feature?
Open a feature request with a concrete example, expected output, rule precedence, tests, portability implications and security/privacy considerations. Large scope changes should be discussed before implementation.

### Where should I report a vulnerability?
Use the private GitHub Security Advisory route described in SECURITY.md. Do not publish exploit details, credentials or sensitive payloads in a public issue.

### Where can I find the full file list?
See project-structure.md. The inventory is checked against the tracked Git tree by scripts/check_project_structure.py.

For more help see troubleshooting.md, installation.md, and SUPPORT.md.
