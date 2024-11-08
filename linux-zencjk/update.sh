#/bin/bash
# This shell script is only used by maintainers.
sed -i "s/pkgver\=.*/pkgver\=$1/" PKGBUILD
less PKGBUILD
read -rp "This is the new PKGBUILD. If there is something wrong, please type q:" quit
if [ xq == x$quit ]; then
  exit 1
fi
updpkgsums
makepkg --printsrcinfo > .SRCINFO
git add .
git commit -m $1
