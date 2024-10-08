#!/bin/sh
set -e

mount_point="/mnt/uv-persistent-cache"

sudo() {
    if [ "$USER" = root ]; then
        "$@"
    else
        command sudo "$@"
    fi
}

# Prepare mounted volume permissions
sudo chown "$USER":"$USER" "$mount_point"