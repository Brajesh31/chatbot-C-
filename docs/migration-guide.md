# 🔄 Migration Guide

No released data format or persistent conversation format exists, so there is no database migration procedure.

For source revisions:
- Read the changelog for behavior or build changes.
- Rebuild the executable from the new source.
- Run the new test suite.
- Do not reuse a binary compiled from an unknown revision.
- Update local scripts if a documented Make target changes.

When a future release introduces incompatible CLI behavior, add a version-specific migration section here before tagging that release.
