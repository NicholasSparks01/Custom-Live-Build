FROM debian:bookworm

LABEL maintainer="you@example.com"
LABEL description="Debian live-build automatic ISO builder"

ENV DEBIAN_FRONTEND=noninteractive

# Install live-build and necessary tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        live-build \
        syslinux-common \
        syslinux \
        squashfs-tools \
        xorriso \
        mtools \
        dosfstools \
        cpio \
        wget \
        git \
        make \
        sudo \
        ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create build directory
WORKDIR /build

# Optional: add a non-root builder user
RUN useradd -ms /bin/bash builder && \
    echo "builder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER builder

# Copy your auto/ directory into container (if needed for custom config)
# Otherwise, live-build will run with defaults
COPY --chown=builder:builder auto/ ./auto/

# Default command: configure and build ISO
CMD sudo lb config && sudo lb build && \
    echo "ISO build complete. Check the output directory."
