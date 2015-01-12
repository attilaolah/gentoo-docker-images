#!/bin/bash

version="1.21.0"

echo "Downloading BusyBox ${version}..."
wget -qO- http://tinderbox.dev.gentoo.org/default-linux/amd64/sys-apps/busybox-${version}.tbz2 \
  | tar \
    --exclude="./etc" \
    --exclude="./usr" \
  -xjf-

echo "Building Docker BusyBox image..."
docker build -t gentoo/busybox:${version} .

echo "Cleaning up..."
rm -rf bin
