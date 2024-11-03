# Dockerfile for GitHub Codespace with Singularity
FROM sylabs/singularity-ce:latest

# Install any additional dependencies if needed
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl git build-essential

# Clean up to keep image size small
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
