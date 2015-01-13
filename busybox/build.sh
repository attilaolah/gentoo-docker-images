#!/bin/bash

prefix="uclibc"
version="1.21.0"

echo "Downloading BusyBox ${version}..."

mkdir -p busybox
wget -qO- "http://tinderbox.dev.gentoo.org/${prefix}/amd64/sys-apps/busybox-${version}.tbz2" \
  | tar -C busybox -xjf-

echo "Building Docker BusyBox image..."
docker build -t gentoo/busybox:${version} .

echo "Cleaning up..."
rm -rf busybox
