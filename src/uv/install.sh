#!/bin/bash

set -e

# Install UV binary
echo "Installing UV..."

UV_BINARY_URL="https://ghcr.io/astral-sh/uv:latest"
UV_INSTALL_PATH="/usr/local/bin/uv"
UV_CACHE_DIR="/mnt/uv-persistent-cache"

# Ensure cache directory exists
mkdir -p "$UV_CACHE_DIR"

# Download and extract UV using the cache directory
curl -L "$UV_BINARY_URL" -o /tmp/uv.tar.gz
tar -xzf /tmp/uv.tar.gz -C /usr/local/bin
chmod +x "$UV_INSTALL_PATH"

# Configure UV to use the cache directory
export UV_CACHE_DIR="$UV_CACHE_DIR"

# Clean up
rm /tmp/uv.tar.gz

echo "UV has been installed and is available at $UV_INSTALL_PATH."