#!/usr/bin/env sh
set -eu

APP="$1"
tmp="$(mktemp)"
trap 'rm -f "$tmp"' EXIT HUP INT TERM

assert_contains() {
    file="$1"
    expected="$2"
    if ! grep -Fq "$expected" "$file"; then
        echo "Expected output was not found: $expected" >&2
        cat "$file" >&2
        exit 1
    fi
}

assert_not_contains() {
    file="$1"
    unexpected="$2"
    if grep -Fq "$unexpected" "$file"; then
        echo "Unexpected output was found: $unexpected" >&2
        cat "$file" >&2
        exit 1
    fi
}

printf 'HELLO\nhow are you?\nbye\n' | "$APP" > "$tmp"
assert_contains "$tmp" "Hello! How can I help you today?"
assert_contains "$tmp" "I'm just a program, but thanks for asking!"
assert_contains "$tmp" "Goodbye! Have a great day!"

printf 'goodbye\nbye\n' | "$APP" > "$tmp"
assert_contains "$tmp" "I'm sorry, I don't understand that."
assert_contains "$tmp" "Goodbye! Have a great day!"

printf '' | "$APP" > "$tmp"
assert_contains "$tmp" "Input closed. Goodbye!"

line254="$(awk 'BEGIN { for (i = 0; i < 254; i++) printf "x" }')"
line255="$(awk 'BEGIN { for (i = 0; i < 255; i++) printf "x" }')"
line256="$(awk 'BEGIN { for (i = 0; i < 256; i++) printf "x" }')"
warning="Please keep your message to 255 bytes or fewer."

# Exactly 255 bytes is accepted when followed by a newline.
printf '%s\nbye\n' "$line255" | "$APP" > "$tmp"
assert_contains "$tmp" "I'm sorry, I don't understand that."
assert_contains "$tmp" "Goodbye! Have a great day!"
assert_not_contains "$tmp" "$warning"

# Exactly 255 bytes is also accepted when EOF follows without a newline.
printf '%s' "$line255" | "$APP" > "$tmp"
assert_contains "$tmp" "I'm sorry, I don't understand that."
assert_contains "$tmp" "Input closed. Goodbye!"
assert_not_contains "$tmp" "$warning"

# A 256-byte line is rejected and drained before the next prompt.
printf '%s\nbye\n' "$line256" | "$APP" > "$tmp"
assert_contains "$tmp" "$warning"
assert_contains "$tmp" "Goodbye! Have a great day!"

# A 256-byte final line is rejected before EOF is handled on the next read.
printf '%s' "$line256" | "$APP" > "$tmp"
assert_contains "$tmp" "$warning"
assert_contains "$tmp" "Input closed. Goodbye!"

# A shorter final line without a newline remains valid.
printf '%s' "$line254" | "$APP" > "$tmp"
assert_contains "$tmp" "I'm sorry, I don't understand that."
assert_contains "$tmp" "Input closed. Goodbye!"
assert_not_contains "$tmp" "$warning"

echo "Interactive chatbot smoke tests passed."
