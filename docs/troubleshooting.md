# 🧯 Troubleshooting

## Compiler not found
Install GCC, Clang, or MinGW-w64 and add it to PATH. GNU Make is optional with direct compiler commands.

## Uppercase phrases
Input is converted to lowercase before matching, so uppercase ASCII phrases are recognized.

## `goodbye` does not exit
Only exact normalized `bye` exits. Embedded letters do not count.

## Overlong input
The accepted line limit is 255 bytes. A longer line is drained as one message and produces one warning.

## Exit on redirected input
EOF causes a clean exit. This is expected for pipes and redirected files.

## Prebuilt executable fails
The checked-in binary is Windows-specific. Build the source on the target OS and architecture.
