# 🔄 Upgrade Guide

## Current distribution model

The repository does not publish a package-manager release channel or a stable ABI. Users normally build the executable from the source revision they intend to run.

## Upgrading a local clone

~~~sh
git fetch origin
git checkout main
git pull --ff-only
make clean
make check
make
~~~

If you work from a release tag, check out the intended tag and build from that exact revision. Do not assume a previously compiled executable has updated when source files change.

## Compatibility

The application targets C11 and uses the standard C library. The POSIX shell integration suite is run on Linux. Windows CI compiles the source and C unit tests with MinGW. Review the [compatibility matrix](compatibility.md) before making broader platform claims.

## Behavior changes

Read CHANGELOG.md and the relevant architecture/API documentation. No persistent database or conversation-history migration is currently required. If a future release changes command behavior incompatibly, document the transition here before release.
