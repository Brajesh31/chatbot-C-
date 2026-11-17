# 🧑‍🔧 Developer Guide

## Understand the code path

Start at main in chatbot/chatbot.c. The loop prints and flushes the prompt, delegates bounded input to read_input_line, normalizes accepted text, classifies it, maps the enum to a static response, and exits only for the goodbye category.

## Make a safe change

- Identify whether the change affects input, normalization, rules, output, or build tooling.
- Preserve function boundaries unless there is a clear reason to refactor.
- Add a direct unit test for a new pure helper or rule.
- Add an integration case when behavior is observable only through stdin/stdout.
- Test empty input, long input, EOF, and substring collisions where relevant.
- Run make check.
- Update README and all docs that state the changed behavior.

## Adding a phrase

Before implementing a new rule, specify its precedence relative to current rules. Add a test for the intended phrase and a collision test. Ensure an exit command does not accidentally match a substring unless that change is explicitly intended.

## Dependency policy

The standard library is sufficient for the current feature set. A third-party dependency requires a written rationale, license review, build integration, and a security/maintenance assessment.
