# ✍️ Coding Guidelines

## Function design
Each function should have one clear responsibility. Keep the control loop in main, input boundary handling in read_input_line, normalization in normalize_input, and rule selection in classify_input. Avoid coupling tests to console text when a helper-level assertion is sufficient.

## Input and string safety
- Use bounded reads.
- Check fgets before accessing the buffer.
- Ensure input is NUL-terminated.
- Drain excess characters through the end of the current logical line.
- Keep exact-command checks separate from substring checks.
- Do not assume byte-wise lowercase conversion is Unicode case folding.

## Portability
Prefer standard C library facilities. Platform-specific code must be isolated, documented, and tested on the affected platform.

## Change checklist
1. Explain the behavior change.
2. Add tests for ordinary and boundary inputs.
3. Compile with warnings-as-errors.
4. Run make test.
5. Review all diagrams and examples affected by the change.
