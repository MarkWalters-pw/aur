# Maintainer: Rizzzi Git <rizzzigit@gmail.com>

tmlver="2024.09.3.0"
terrariaver="1.4.4.9"
pkgrel=1
epoch=0

pkgname="tmodloader-bin"
pkgdesc="An open-source, community-driven, modification and expansion of the Terraria game that makes it possible to make and play mods."
pkgver="$tmlver"_"$terrariaver"
url="https://www.tmodloader.net/"
arch=("x86_64")
license=("MIT")
depends=('unzip>=6.0')

source=(
  "tml-$tmlver.zip::https://github.com/tModLoader/tModLoader/releases/download/v$tmlver/tModLoader.zip"
)

sha256sums=(
  "05803c53f6e99ed6b2f5e3daaae2e84adb930c71d9a1b07d4aa18e43bbb1be65"
)

noextract=("tml-$tmlver.zip")

prepare() {
  rm -rf "${pkgdir:?}/${pkgname:?}"
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/tModLoader/tmodloader.sh" "$pkgdir/usr/bin/tmodloader"
  ln -s "/opt/tModLoader/tmodloader-server.sh" "$pkgdir/usr/bin/tmodloader-server"
  ln -s "/opt/tModLoader/tmodloader-familyshare.sh" "$pkgdir/usr/bin/tmodloader-familyshare"

  install -Dm444 "tml-$tmlver.zip" "$pkgdir/opt/tModLoader/tml.zip"
  install -Dm555 -t "$pkgdir/opt/tModLoader" "$startdir"/*.sh
  echo "$tmlver" | install -Dm444 "/dev/stdin" "$pkgdir/opt/tModLoader/ver.txt"
}
