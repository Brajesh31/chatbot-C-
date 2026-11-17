# 🖥️ Compiler and Platform Compatibility

| Platform | Toolchain | Build path |
|---|---|---|
| Linux | GCC / Clang | Makefile or direct compiler |
| macOS | Apple Clang / LLVM Clang | Makefile or direct compiler |
| Windows | MinGW-w64 GCC | Direct compiler command |
| Other C11 systems | C11-compatible compiler | Direct compiler command |

CI verifies hosted Linux and Windows environments. This does not guarantee compatibility with every compiler version, architecture, shell, or terminal. Use standard C facilities and record compiler flags and versions in test reports.
