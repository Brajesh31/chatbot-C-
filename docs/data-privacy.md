# 🔒 Data Privacy

## Processing overview

The application receives text from a local terminal, stores it temporarily in a bounded process buffer, performs simple phrase checks, and writes a fixed response to stdout. It does not transmit the input to a model provider or external service and does not write chat history.

## Data inventory

| Data | Purpose | Retention by application |
|---|---|---|
| Current line | Match a fixed phrase | Until buffer is reused or process exits |
| Rule category | Select response | Current turn |
| Conversation history | Not collected | None |
| User identity | Not required | None |
| Analytics | Not implemented | None |

## External environment

Terminal applications, shells, screen recorders, terminal multiplexers, operating-system logging, and CI systems may separately capture input/output. Their data practices are not controlled by the chatbot. Do not enter credentials or sensitive content into a shared session.

## Future changes

Any feature that stores or transmits user input must define purpose, notice, data minimization, retention, access, deletion, security, and incident handling before implementation. This file is a technical description, not a legal privacy notice or compliance certification.
