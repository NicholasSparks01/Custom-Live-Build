#!/usr/bin/env bash
set -e

echo ""
echo "================================"
echo "Current date/time: $(date)"
echo "Working directory: $(pwd)"
echo "Listing files:"
tree
echo "================================"
echo""

sleep 8

chmod +x auto/*

sudo lb clean && \
sudo lb config && \
sudo lb build && \
echo "ISO build complete. Check the output directory."

# Keep the container alive if needed
# exec "$@"

