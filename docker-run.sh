#!/usr/bin/env bash
set -e

# Ensure entrypoint.sh is executable
chmod +x ./entrypoint.sh

# Start container in background with /output mounted
CID=$(docker run -di \
    --privileged \
    -v "$(pwd)/output:/build" \
    -v "$(pwd)/entrypoint.sh:/entrypoint.sh" \
    --workdir /build \
    "debian:stable-slim" \
    bash)

# Copy config and auto dirs into container
docker cp ./auto "$CID:/build/auto"
docker cp ./config "$CID:/build/config"

# Install dependencies and run entrypoint
docker exec -i "$CID" bash -c "apt-get update && \
    apt-get install -y --no-install-recommends \
        bash \
	live-build \
        syslinux-common \
        syslinux \
        squashfs-tools \
        xorriso \
	file \
	mtools \
        dosfstools \
        cpio \
        wget \
        git \
        make \
        sudo \
        ca-certificates && \
    /entrypoint.sh"

# Stop and remove container
docker stop "$CID" >/dev/null
