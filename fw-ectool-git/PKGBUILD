# Maintainer: Vladyslav Aviedov <aur at vladaviedov dot org>
# Contributor: Cole Deck <cole at deck dot sh>
pkgname=fw-ectool-git
_gitname=ectool
pkgver=r2763.0ac6155
pkgrel=1
pkgdesc="ectool for the Framework laptop."
arch=(x86_64)
url="https://gitlab.howett.net/DHowett/ectool"
provides=('ectool')
depends=('libftdi')
makedepends=('inetutils' 'git' 'cmake')
license=('BSD-3-Clause')
source=(git+https://gitlab.howett.net/DHowett/ectool.git)
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/ectool"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/ectool"
  mkdir -p build && cd build
  cmake .. \
	  -DCMAKE_BUILD_TYPE=Release \
	  -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build .
}

package() {
  cd "$srcdir/ectool"

  install -Dm755 build/src/ectool "$pkgdir/usr/bin/ectool"
  ln -s /usr/bin/ectool "$pkgdir/usr/bin/fw-ectool"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
