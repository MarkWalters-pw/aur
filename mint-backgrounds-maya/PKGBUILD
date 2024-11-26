# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=mint-backgrounds-maya
pkgver=1.5
pkgrel=1
pkgdesc="The backgrounds included in Linux Mint 13 Maya"
license=('Various')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
source=("${url}/${pkgname}_$pkgver.tar.gz")
sha256sums=('907ed8d392c5a23934587c0fc14d0756dd7fbf1964ffb3bf7f449682eeff8c0e')

package() {
  mkdir --parents ${pkgdir}/usr/share/backgrounds/linuxmint-maya
  mkdir --parents ${pkgdir}/usr/share/{cinnamon-background-properties,gnome-background-properties}

  cp --archive ${srcdir}/${pkgname}-${pkgver}/backgrounds/linuxmint-maya ${pkgdir}/usr/share/backgrounds
  cp --archive ${srcdir}/${pkgname}-${pkgver}/gnome-background-properties/* ${pkgdir}/usr/share/cinnamon-background-properties
  cp --archive ${srcdir}/${pkgname}-${pkgver}/gnome-background-properties/* ${pkgdir}/usr/share/gnome-background-properties
}
