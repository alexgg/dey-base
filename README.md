Digi Embedded Yocto docker base image
=====================================

This image will install an operating system ready to build Digi Embedded Yocto.

Use:

```
docker run -it --rm <container-id>
```

For example, to use the pre-build images available in dockerhub:

```
docker run -it --rm aggurio/dey-base:<dey-version>
```

For example,

```
docker run -it --rm aggurio/dey-base:2.6
```

Build:

```
docker build \
-t dey-base:master \
--build-arg DEY_INSTALL_PATH="/usr/local/dey-master" \
--build-arg DEY_BRANCH="master" \
--no-cache .
```
