# 🗃️ Database and Persistence

## Current architecture: no database

The chatbot does not use a database, file-backed store, embedded SQL engine, remote datastore, or conversation-history file. The application reads a line into a fixed in-memory buffer, classifies that line, prints a static response, and then reuses the buffer for the next turn.

| Data category | Current location | Persistence |
|---|---|---|
| Current user input | Local stack buffer in the process | None |
| Rule definitions | Compiled source code | Present in executable |
| Response strings | Compiled source code | Present in executable |
| Conversation history | Not implemented | None |
| User profile/settings | Not implemented | None |
| Logs/analytics | Not implemented | None |

## Why an ER diagram is not provided

There are no entities, tables, columns, primary keys, foreign keys, relationships, indexes, or migrations in the current implementation. An ER diagram would therefore be fabricated rather than descriptive. The repository includes a reusable [database schema template](templates/database-schema-template.md) in case a future, approved design introduces persistence.

## Privacy and operational implications

The chatbot itself does not retain conversations after the process exits. Terminal applications, shell session recorders, operating-system logging, or screen capture configured outside this program may still record what a person types. Users should not enter credentials or sensitive personal information into the demonstration.

There is no database backup, restore, retention, deletion, migration, or encryption operation to run today.

## Requirements before adding persistence

A database proposal must explain the user need, data model, data classification, retention and deletion rules, access control, backup/restore, migration approach, failure handling, dependency/license implications, and security testing. It must also update privacy, threat-model, operations, and architecture documentation before being treated as an implemented capability.
