#!/usr/bin/env sh
set -eu

APP="$1"
tmp="$(mktemp)"
trap 'rm -f "$tmp"' EXIT HUP INT TERM

printf 'HELLO\nhow are you?\nbye\n' | "$APP" > "$tmp"
grep -q 'Hello! How can I help you today?' "$tmp"
grep -q "I'm just a program, but thanks for asking!" "$tmp"
grep -q 'Goodbye! Have a great day!' "$tmp"

printf 'goodbye\nbye\n' | "$APP" > "$tmp"
grep -q "I don't understand that." "$tmp"
grep -q 'Goodbye! Have a great day!' "$tmp"

printf '' | "$APP" > "$tmp"
grep -q 'Input closed. Goodbye!' "$tmp"

long_line="$(awk 'BEGIN { for (i = 0; i < 300; i++) printf "x"; printf "\nbye\n" }')"
printf '%s' "$long_line" | "$APP" > "$tmp"
grep -q 'Please keep your message' "$tmp"
grep -q 'Goodbye! Have a great day!' "$tmp"

echo "Interactive chatbot smoke tests passed."
