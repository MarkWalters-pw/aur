# Maintainer: Perkelo <alessandro [dot] scala [eight] [at] gmail [dot] com>

pkgname=ttf-eight-bit-dragon
pkgver=1.0
pkgrel=1
pkgdesc="Eight Bit Dragon Font"
arch=(any)
license=('FSLA')
depends=(fontconfig xorg-font-utils)
url="https://www.fontspace.com/eight-bit-dragon-font-f30428"
source=("eight-bit-dragon-font.zip::https://get.fontspace.co/download/family/7129l/5a9e90291d144b3cb9a23b78f87ae2e6/eight-bit-dragon-font.zip")
sha256sums=('bab4055a193b86693e6d6e6fbf77ccceeda825dd465a367143c2c5dd9463efe0')
install=$pkgname.install

package() {
    install -d "$pkgdir/usr/share/fonts/TTF"
    install -m644 "$srcdir/EightBitDragon-anqx.ttf" "$pkgdir/usr/share/fonts/TTF/"
    install -d "$pkgdir/usr/share/licenses/ttf-eight-bit-dragon"
    install -m644 "$srcdir/misc/FSLA_NonCommercial_License-4726.html" "$pkgdir/usr/share/licenses/ttf-eight-bit-dragon/LICENSE"
}
