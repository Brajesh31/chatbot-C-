# 🖼️ Visual Regression Testing Applicability

## Current product surface

The chatbot has no graphical screen, browser UI, dashboard, charting component, or mobile interface. There is therefore no visual UI baseline or screenshot-diff test suite.

## What can be validated visually

The repository does contain SVG diagrams and a project banner used in documentation. The existing documentation validator parses SVG XML and checks for title and description metadata. It does not compare rendered pixels, verify every renderer, or guarantee visual consistency across all themes.

## Manual asset review

When an SVG changes:
1. Open it in an SVG-capable viewer.
2. Check text clipping and arrow direction.
3. Confirm labels are readable at the intended size.
4. Verify title/description metadata and embedded README alt text.
5. Run the documentation validator.
6. Update docs/assets/README.md when purpose or content changes.

Do not create UI screenshot diffs for a screen that the product does not have.
