#!/usr/bin/env bash
set -e

# Ensure entrypoint.sh is executable
chmod +x ./entrypoint.sh

# Create named volumes for apt cache persistence
#APT_CACHE_VOL="apt-cache"
#APT_LISTS_VOL="apt-lists"

#sudo docker volume create "$APT_CACHE_VOL" >/dev/null
#sudo docker volume create "$APT_LISTS_VOL" >/dev/null

# Start container in background with /output mounted
CID=$(docker run -dit \
    --privileged \
    -v "$(pwd)/output:/build" \
    -v "$(pwd)/entrypoint.sh:/entrypoint.sh" \
    --workdir /build \
    "debian:stable-slim" \
    bash)

    #-v "$APT_CACHE_VOL:/var/cache/apt" \
    #-v "$APT_LISTS_VOL:/var/lib/apt/lists" \


# Copy config and auto dirs into container
docker cp ./auto "$CID:/build/auto"
docker cp ./config "$CID:/build/config"

# Install dependencies and run entrypoint
docker exec -it "$CID" bash -c "apt-get update && \
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
