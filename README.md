Digi Embedded Yocto docker base image
=====================================

This image will install an operating system ready to build Digi Embedded Yocto
versions 1.6, 2.0, 2.2 or 2.4.

Build:

`
docker build \
-t dey-base:2.4 \
--build-arg DEY_INSTALL_PATH="/usr/local/dey-2.4" \
--build-arg DEY_BRANCH="rocko" \
--no-cache .
`

Use:

`docker run -it --rm <container-id>`
