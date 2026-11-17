# 📝 Accessible Forms Applicability

## Product interface

The C chatbot has no graphical forms, browser inputs, mobile form controls, or form-validation interface. User input is a single line read from standard input.

The GitHub issue forms under .github/ISSUE_TEMPLATE are YAML definitions rendered by GitHub's platform. They are repository contribution tooling, not form controls implemented by the chatbot application.

## Terminal input guidance

- Show a clear prompt before reading.
- Explain supported input and the 255-byte limit.
- Distinguish an overlong-line warning from a normal chatbot response.
- Do not rely on color to communicate validation errors.
- Avoid echoing potentially sensitive input in diagnostics.

## GitHub issue form guidance

Keep field labels explicit, descriptions actionable, and required fields limited to what maintainers need for triage. Warn reporters not to submit passwords, API keys, or private personal details. Security-sensitive disclosures must use private vulnerability reporting.

## Future graphical forms

If a graphical interface is introduced, document labels, keyboard focus order, error association, input purpose, screen-reader announcement behavior, and manual testing results. Do not claim form accessibility based solely on YAML syntax.
