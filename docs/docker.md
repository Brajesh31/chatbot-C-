# 🐳 Docker Applicability

## Status
Docker is not part of the current build or runtime. There is no `Dockerfile`, `docker-compose.yml`, `.dockerignore`, image publishing workflow or registry configuration.

## Current alternative
Use a local compiler and Make:
~~~sh
make clean
make
./build/chatbot
~~~

The program could technically run in a container, but technical possibility alone is not a product requirement.

## Why not add Docker prematurely?
An unnecessary image adds base-image patching, dependency, provenance, registry and container-test obligations. It can mislead users into thinking this is a hosted service.

## Adoption checklist
- [ ] A real use case benefits from image distribution.
- [ ] Target OS and CPU architectures are defined.
- [ ] Base-image and patch strategy have an owner.
- [ ] Runtime uses non-root and minimal filesystem permissions.
- [ ] stdin/stdout and signal behavior are tested.
- [ ] Image scanning, provenance and registry ownership are documented.
- [ ] CI builds and tests the image.

Related: [containerization](containerization.md), [production setup](production-setup.md), [hosting](hosting.md), [deployment scope](deployment-scope.md).
