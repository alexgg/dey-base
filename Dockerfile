FROM ubuntu:trusty

MAINTAINER Alex Gonzalez <alex.gonzalez@digi.com>

# Non-interactive debconf package configuration
ARG DEBIAN_FRONTEND=noninteractive

# Update Ubuntu and Install Yocto Proyect Quick Start and DEY dependencies
RUN apt-get update && apt-get install -y locales gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat libsdl1.2-dev xterm cpio curl python && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set bash as default shell
RUN echo "dash dash/sh boolean false" | debconf-set-selections - && dpkg-reconfigure dash

# Set the locale
RUN locale-gen en_US.UTF-8 && \
    dpkg-reconfigure locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

# Install repo
RUN curl -o /usr/local/bin/repo http://commondatastorage.googleapis.com/git-repo-downloads/repo && chmod a+x /usr/local/bin/repo

# User management
RUN groupadd -g 1000 dey && useradd -u 1000 -g 1000 -ms /bin/bash dey

# Install Digi Embedded Yocto
ARG DEY_INSTALL_PATH="/usr/local/dey-1.6"
ARG DEY_BRANCH="daisy"

RUN install -o 1000 -g 1000 -d $DEY_INSTALL_PATH
WORKDIR $DEY_INSTALL_PATH
USER dey

RUN repo init -u https://github.com/digi-embedded/dey-manifest.git -b $DEY_BRANCH && repo sync -j4 --no-repo-verify

ENV DEY_INSTALL_PATH=$DEY_INSTALL_PATH
RUN echo "echo Welcome to Digi Embedded Yocto base docker image!" >> /home/dey/.bashrc
