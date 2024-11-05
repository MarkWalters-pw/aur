#!/bin/bash

URL=$(curl -s https://app.gitbutler.com/releases | jq '.platforms."linux-x86_64".url' )


BUILD=$(echo $URL | grep -oE '\-[0-9]+/' | grep -oE '[0-9]+')
VER=$(echo $URL | grep -oE '[0-9]+.[0-9]+.[0-9]+-' | sed 's/-//g')

echo $VER
echo $BUILD

sed -i "s/pkgver=.*/pkgver=$VER/" PKGBUILD
sed -i "s/_pkgvernum=.*/_pkgvernum=$BUILD/" PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO
git add -p
git commit -m "v$VER"
