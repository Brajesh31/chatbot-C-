# 📦 Deployment and Distribution

## Delivery model

This is a native console program, not a web service. It needs no server, hosting platform, API key, database, domain, reverse proxy, or production runtime.

## Build from source

The recommended local build is:

~~~sh
make clean
make
./build/chatbot
~~~

For a Windows executable, use a supported Windows compiler such as MinGW-w64:

~~~powershell
gcc -std=c11 -Wall -Wextra -Wpedantic -Werror chatbot/chatbot.c -o chatbot-build.exe
.\chatbot-build.exe
~~~

## Pre-distribution validation

- [ ] Select and record the exact source commit or tag.
- [ ] Build using a supported C11 compiler.
- [ ] Record compiler name/version, flags, OS and architecture.
- [ ] Run C unit tests.
- [ ] Run the POSIX integration suite on Linux.
- [ ] Run documentation, Markdown, tree and security hygiene checks.
- [ ] Review CodeQL and GCC analyzer results.
- [ ] Confirm the generated file format matches the target platform.
- [ ] Include the MIT license and relevant source reference.
- [ ] Document the 255-byte input limit and terminal usage.
- [ ] Record known compatibility gaps.
- [ ] Avoid bundling unrelated local build products.

## Existing executable

The checked-in chatbot/chatbot.exe is a historical Windows executable retained from the original repository. Source CI does not rebuild or attest that existing binary. Users should compile the current source for the target platform when provenance matters.

## GitHub source artifact workflow

The manual release workflow checks out an existing tag, runs tests, builds a Linux executable and uploads it as a workflow artifact. It does not create a tag, publish a GitHub Release, sign an artifact, generate checksums, or attest binary provenance.

## Hosting and containerization

There is no production hosting configuration, Docker image, container runtime, infrastructure-as-code, service health check, monitoring agent or hosted endpoint. See deployment-scope.md before proposing any service deployment.

## Recovery

If a distributed artifact is defective, identify its exact source tag, prepare a reviewed fix, rebuild, rerun tests, and publish a clearly versioned replacement. Do not silently overwrite an artifact with unknown provenance.
