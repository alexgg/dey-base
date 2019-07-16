Digi Embedded Yocto docker base image
=====================================

This image will install an operating system ready to build Digi Embedded Yocto.

Build:

`
docker build \
-t dey-base:2.6 \
--build-arg DEY_INSTALL_PATH="/usr/local/dey-2.6" \
--build-arg DEY_BRANCH="thud" \
--no-cache .
`

Use:

`docker run -it --rm <container-id>`
