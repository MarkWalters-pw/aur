#!/usr/bin/env bash

set -e

curl 'https://download.todesktop.com/230313mzl4w4u92/latest-linux.yml' -o latest-linux.yml

version="$(grep ^path: latest-linux.yml|cut -d- -f2)"
build="$(grep ^path: latest-linux.yml|cut -d- -f4)"
sum="$(grep ^sha512: latest-linux.yml|cut -d' ' -f2|base64 -d|hexdump -v -e '/1 "%02x" ')"

rm latest-linux.yml

echo "${version}" "${build}" "${sum}"

sed -r "s@^(_cursor_version=).+@\1${version}@g" -i PKGBUILD
sed -r "s@^(_cursor_build=).+@\1${build}@g" -i PKGBUILD
sed -r "s@^(sha512sums.+=\(').+('\))@\1${sum}\2@g" -i PKGBUILD

makepkg --printsrcinfo > .SRCINFO
git status
