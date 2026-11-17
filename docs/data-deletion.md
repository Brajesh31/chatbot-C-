# 🗑️ Data Deletion

## Current application behavior

There is no saved conversation history, user account, local application database, analytics store, or server record to delete. Input remains in the active process buffer and is overwritten on later reads. Process termination releases process memory.

## What this does not delete

The application cannot erase terminal scrollback, shell history, terminal session recordings, screen captures, operating-system logs, CI logs, or files created by third-party tools. Those are outside the chatbot's control.

## If persistence is introduced

A future data store must provide a documented deletion mechanism, authorization checks, propagation to replicas/backups where practical, retention exceptions, deletion verification, and clear error handling. The privacy notice must explain any remaining backup retention.

Do not promise deletion of terminal-host records or external platform logs from within the chatbot.
