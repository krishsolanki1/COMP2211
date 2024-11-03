# Use Ubuntu 22.04 as a base image
FROM ubuntu:22.04

# Install Singularity prerequisites
RUN apt-get update && \
    apt-get install -y build-essential libseccomp-dev pkg-config squashfs-tools cryptsetup wget && \
    rm -rf /var/lib/apt/lists/*

# Download and install Singularity
RUN wget https://github.com/hpcng/singularity/releases/download/v3.11.3/singularity-3.11.3.tar.gz && \
    tar -xzf singularity-3.11.3.tar.gz && \
    cd singularity && \
    ./mconfig && \
    make -C ./builddir && \
    make -C ./builddir install

# Clean up
RUN rm -rf singularity singularity-3.11.3.tar.gz
