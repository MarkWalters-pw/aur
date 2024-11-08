# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
#
# Contributor: Carson Black <uhhadd@gmail.com>
# Contributor: Piotr Rogoża <rogoza.piotr@gmail.com>
# Contributor: Johannes Dewender <arch@JonnyJD.net>
#
# Pull Requests are welcome here: https://github.com/yurikoles-aur/obs-build
#

pkgname=obs-build
pkgver=20240913
pkgrel=1
license=(GPL-2.0-only GPL-3.0-only)
pkgdesc='OBS build script, can be used with OBS or stand alone'
url=https://github.com/openSUSE/obs-build
arch=(any)
depends=(perl)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/openSUSE/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('b10fb10d6c4b924c729ac6ae1aa3b19c0d7ed6c11604063f3b6852df42b8d51d')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
