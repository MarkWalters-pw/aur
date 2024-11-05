# Maintainer: Andrew O'Neill <andrew at haunted dot sh>

_pkgname=mini
pkgname=cpp-${_pkgname}
pkgver=0.9.17
pkgrel=1
pkgdesc="Tiny, header only C++ library for manipulating INI files."
arch=('any')
license=('MIT')
conflicts=('mini-git')
url="https://github.com/metayeti/mINI"
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('2b5a5772a01691269d13c259590c5e5cff0334d1131778bc93408d6757a63be0')

package() {
  cd "mINI-${pkgver}"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m644 src/mini/ini.h "${pkgdir}/usr/include/mini/ini.h"
}
