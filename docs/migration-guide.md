# 🔄 Migration Guide

## Current migration requirements

The application has no persistent conversation history, database, user profile, schema version, or saved configuration format. Normal source upgrades therefore do not require database or user-data migration.

The main migration action is to rebuild the executable from the desired source revision and verify its behavior.

## Upgrade an existing local clone

~~~sh
git fetch origin
git checkout main
git pull --ff-only
make clean
make check
make
~~~

For a tagged source version, check out that exact tag and build from it. Do not assume a binary already present in a folder has changed when the source changes.

## Behavior-change checklist

When a change affects the terminal contract:
- Identify the previous and new behavior.
- State whether supported phrase precedence changes.
- Document exact input and output examples.
- Explain any change to the 255-byte input limit.
- Explain whether EOF and exit behavior change.
- Add regression tests for old and new behavior.
- Update README, API/function reference, FAQ and changelog.
- Define a transition period when the previous behavior has been published and users may rely on it.

## Platform/toolchain changes

If compiler requirements or Make targets change, update installation.md, building.md, compatibility.md, commands-reference.md and the CI workflows. Preserve a direct compiler path where practical.

## Binary migration

The checked-in chatbot/chatbot.exe is a historical binary retained from the original repository. It should not be assumed to match the latest source. Build a fresh executable from a reviewed tag for the target OS and architecture.

## Future persistence

If persistent user data is added, this guide must be expanded with schema migration, data backup, validation, rollback, retention and deletion procedures before that feature is released.

## Verification and support

Run make check and consult upgrade-guide.md, release-management.md, and SUPPORT.md.
