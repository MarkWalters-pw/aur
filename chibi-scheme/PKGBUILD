# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=chibi-scheme
pkgver=0.11.0
pkgrel=1
pkgdesc='Minimal R7RS scheme implementation for use as an extension language'
arch=(x86_64 i686)
url=http://synthcode.com/wiki/chibi-scheme
license=(BSD-3-Clause)
depends=(bash glibc)
source=("http://synthcode.com/scheme/chibi/${pkgname}-${pkgver}.tgz")
b2sums=('68dc87f79acc86c87ed99ce84b6a3ad0ed089678acbf338acd26ff7a548dcbdc40d2ec00036c5361ffbd9aa710b3b645b7d2ec3ed9015ae8eed42dc7e1e4ba29')

build() {
  cd "${pkgname}-${pkgver}"
  make PREFIX="/usr"
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX="$pkgdir/usr" install
}

check() {
  cd "${pkgname}-${pkgver}"
  make test
}
