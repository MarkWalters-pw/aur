#!/bin/bash

VERSION="$1"

if [ -z "$VERSION" ]
then
	echo Please provide version number as first argument to the script
	exit 1
fi

echo == Cleaning up things...
rm -f midica-*.jar
rm -f midica-*.zst

echo == Changing pkgver in PKGBUILD...
sed -i "s/^pkgver=.*$/pkgver=$VERSION/" PKGBUILD

echo == Downloading source to compute SHA256...
makepkg --verifysource --skipchecksums
SHA256=$(sha256sum midica-${VERSION}.jar | awk '{print $1}')
echo SHA256=$SHA256

echo == Changing sha256sums in PKGBUILD...
sed -i "s/^sha256sums=.*$/sha256sums=\(\"${SHA256}\"\)/" PKGBUILD

echo == Checking package build...
if ! makepkg -frs
then
	echo
	echo "PACKAGE BUILD FAILED !!!"
	echo
	exit 1
fi

echo == Generating .SRCINFO file...
makepkg --printsrcinfo > .SRCINFO

echo == Creating release commit...
git add .
git commit -m "release $VERSION"

echo
echo The release commit is ready.
echo Please check that it is correct, then run 'git push' when ready
echo
