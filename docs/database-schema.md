# 🗃️ Database Schema Applicability

## Current status: no database

The program has no relational database, document database, embedded store, flat-file conversation store, or persistence adapter. There are no tables, records, primary keys, foreign keys, indexes, migrations, query interfaces, or schema versions in the current runtime.

## Runtime data model

| Data | Representation | Lifetime |
|---|---|---|
| Current input | Fixed char array | Current conversation turn, then overwritten |
| Response category | ResponseKind enum | Current turn |
| Response text | Static string literal | Process image |
| Rule definitions | Conditional expressions in source | Compiled executable |
| Conversation history | Not implemented | Not retained |

## Why an ER diagram is not included

An ER diagram would invent entities and relationships that do not exist. The architecture diagram and data-flow diagram instead show the actual in-memory processing pipeline.

## Before introducing persistence

A database proposal must define data ownership, schema, constraints, migrations, backup and restore, access control, retention, deletion, encryption, failure handling, test strategy, and dependency/license implications. It must also update privacy and threat-model documentation before release.

See [database overview](database.md), [data dictionary](data-dictionary.md), and the reusable [database schema template](templates/database-schema-template.md).
