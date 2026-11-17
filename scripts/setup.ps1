$ErrorActionPreference = "Stop"
Write-Host "Checking Simple C Chatbot development prerequisites..."

$compiler = Get-Command gcc -ErrorAction SilentlyContinue
if (-not $compiler) { $compiler = Get-Command clang -ErrorAction SilentlyContinue }
if (-not $compiler) { $compiler = Get-Command cc -ErrorAction SilentlyContinue }
if (-not $compiler) {
    Write-Error "A C11 compiler such as MinGW-w64 GCC or Clang is required."
    exit 1
}
& $compiler.Source --version | Select-Object -First 1

$make = Get-Command make -ErrorAction SilentlyContinue
if ($make) {
    & $make.Source --version | Select-Object -First 1
} else {
    Write-Host "GNU Make is optional on Windows. Direct GCC commands are documented."
}

$python = Get-Command python -ErrorAction SilentlyContinue
if (-not $python) { $python = Get-Command py -ErrorAction SilentlyContinue }
if (-not $python) {
    Write-Error "Python 3 is required for documentation validation."
    exit 1
}
& $python.Source --version

$git = Get-Command git -ErrorAction SilentlyContinue
if (-not $git) {
    Write-Error "Git is required to clone and contribute to the repository."
    exit 1
}
& $git.Source --version

Write-Host "Prerequisite check complete. No packages were installed or system settings changed."
