# 🔐 Security Notes

The program is local, uses no network or authentication, does not read credentials/environment variables, and does not persist messages. Input reads are bounded; EOF is checked; overlong lines are discarded. Character values are cast to unsigned char before `tolower`.

Avoid unsafe string functions, unchecked input calls, and shell execution of user text. The tracked Windows executable is a binary artifact; compile reviewed source when provenance matters. This is not a formal security audit. See [root security policy](../SECURITY.md).
