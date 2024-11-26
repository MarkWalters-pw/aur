#!/usr/bin/env bash

URL=https://console.automox.com/installer

# pretend to be debian bookworm
DEBIAN_OPTS="os=Linux&osname=Debian&osver=12"

deb="$(mktemp)"
wdir="$(mktemp -d)"

wget "${URL}?${DEBIAN_OPTS}&arch=x86_64&has_systemd=1&release=stable" -O "$deb"

bsdtar xf "$deb" -C "$wdir"
bsdtar xf "$wdir/control.tar.xz" -C "$wdir"

version="$(grep Version: "$wdir/control" | awk '{print $2}' | \
  awk -F- '{print $1}')"

cp "$deb" "./amagent_${version}_amd64.deb"

rm "$deb"
rm -rf "$wdir"
