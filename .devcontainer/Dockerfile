# Use Ubuntu 22.04 as a base image
FROM ubuntu:22.04

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true

# Preconfigure keyboard layout
RUN apt-get update && \
    echo 'keyboard-configuration keyboard-configuration/layoutcode string us' | debconf-set-selections && \
    echo 'keyboard-configuration keyboard-configuration/xkb-keymap select us' | debconf-set-selections && \
    apt-get install -y --no-install-recommends keyboard-configuration && \
    rm -rf /var/lib/apt/lists/*

# Install Singularity prerequisites
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    libseccomp-dev \
    pkg-config \
    squashfs-tools \
    cryptsetup \
    wget && \
    rm -rf /var/lib/apt/lists/*

# Download and install Singularity
ENV SINGULARITY_VERSION=3.11.3
RUN wget https://github.com/hpcng/singularity/releases/download/v${SINGULARITY_VERSION}/singularity-${SINGULARITY_VERSION}.tar.gz && \
    tar -xzf singularity-${SINGULARITY_VERSION}.tar.gz && \
    cd singularity && \
    ./mconfig && \
    make -C ./builddir && \
    make -C ./builddir install && \
    cd .. && \
    rm -rf singularity singularity-${SINGULARITY_VERSION}.tar.gz

# Set environment variables for Singularity
ENV PATH="/usr/local/bin:${PATH}"
