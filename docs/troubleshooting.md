# 🧯 Troubleshooting Guide

## 1. Compiler not found

**Symptom:** make or a direct command reports that cc, gcc or clang is unavailable.

**Resolution:** install a C11-capable compiler and ensure it is available on PATH. On Windows use a MinGW-w64 distribution. Run:

~~~sh
cc --version
gcc --version
~~~

GNU Make is optional if you compile directly.

## 2. Build fails because warnings are errors

The Makefile deliberately uses -Wall -Wextra -Wpedantic -Werror. Read the first compiler diagnostic and fix the source issue. Do not remove warning flags simply to force a successful build.

## 3. Application seems to stop after piped input

EOF is a normal termination condition. The application reads until exact bye or standard input is exhausted. When using redirected input, ensure the input file contains all intended lines.

## 4. Uppercase supported phrase

The source normalizes input bytes before classification. Uppercase English ASCII phrases should match the same rule as lowercase phrases. This is not Unicode case folding.

## 5. goodbye does not exit

This is expected. Only the entire normalized line equal to bye exits. The goodbye string is not an exact match.

## 6. Input longer than the limit

The maximum accepted line is 255 bytes. Longer lines are drained and rejected as one logical message. Reduce the input length or deliberately change the capacity and its tests.

## 7. A line at the end of a file behaves differently

The reader supports a final valid line that reaches EOF without a newline. EOF after all input is exhausted closes the conversation. When reporting a defect, state whether the final line contains a newline.

## 8. Prebuilt executable does not match source

The checked-in chatbot/chatbot.exe is a historical binary from the original repository. It may not include current source fixes. Compile chatbot/chatbot.c on the target platform and run the freshly built file.

## 9. make test fails

Run the unit test executable and shell script separately to identify the failing layer:

~~~sh
make clean
make
./build/test_chatbot
sh tests/test_interactive.sh ./build/chatbot
~~~

The shell script requires a POSIX shell and awk. Windows CI currently runs the C unit tests, not this POSIX script.

## 10. Documentation validation reports a missing path

Check relative links from the document containing the link. Run:

~~~sh
python3 scripts/validate_docs.py
python3 scripts/validate_markdown.py
python3 scripts/check_project_structure.py
~~~

The validators check local references and Markdown code fences. They do not test external website uptime or all Markdown style rules.

## 11. Project tree reports stale documentation

After adding or removing tracked files, regenerate the inventory:

~~~sh
python3 scripts/check_project_structure.py --write
git diff -- docs/project-structure.md
~~~

Review and commit the regenerated tree with the file change.

## 12. Repository security scanner reports a possible secret

The scanner is heuristic. Inspect the reported file without printing or sharing credential values. If a real token or key was exposed, revoke or rotate it at the issuing provider immediately, then follow SECURITY.md. Removing the visible file alone does not revoke a credential.

## 13. Report a reproducible problem

Include source commit, OS/architecture, compiler/version, exact command, minimal input, expected/actual output, and exit status. Redact secrets and private data. Use private reporting for vulnerabilities.

See FAQ.md, SUPPORT.md, and bug-reporting.md.
