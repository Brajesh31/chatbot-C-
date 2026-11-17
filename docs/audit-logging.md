# 🧾 Audit Logging Applicability

## Current application behavior

The chatbot does not produce structured audit logs, access logs, administrative event records, telemetry, or durable conversation transcripts. It writes prompts, responses, and input-length warnings to stdout.

## Why persistent logs are absent

The program is a local educational example with no privileged operation, shared account system, remote service, or operational audit requirement. Persisting conversations would collect user-entered data without a current product need.

## External records

The terminal emulator, operating system, shell recording tool, CI provider, and GitHub platform may maintain their own records. Those systems are controlled by their respective operators, not by chatbot source code.

## Future logging requirements

Any addition must define event categories, purpose, data minimization, redaction, storage destination, access, retention, deletion, failure behavior, and privacy disclosure. Never log full user messages by default. Security-sensitive events should be separated from ordinary conversation output.

See [logging](logging.md), [privacy](privacy.md), and [data retention](data-retention.md).
