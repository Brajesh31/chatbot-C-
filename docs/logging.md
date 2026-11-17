# 🧾 Logging and Diagnostics

## Current runtime behavior

The chatbot does not maintain a log file, structured event stream, telemetry pipeline, or diagnostic history. It writes prompts, responses, and a small long-input warning to stdout. Input is read from stdin.

## Why persistent logs are absent

A local learning example has no operational need to retain conversation transcripts. Avoiding persistence also avoids accidentally collecting sensitive user-entered text.

## Future diagnostic changes

If diagnostic output is added, keep it separate from normal conversation responses where practical. Never log full user messages by default. Document destination, retention, permissions, redaction, and failure behavior. Update tests to ensure diagnostics do not change the conversation contract.
