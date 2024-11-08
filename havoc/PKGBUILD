# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=havoc
pkgver=0.6.0
pkgrel=1
pkgdesc='minimal terminal emulator for Wayland on Linux'
arch=(x86_64)
url='https://github.com/ii8/havoc'
license=('MIT')
depends=(libxkbcommon wayland)
makedepends=('wayland-protocols')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/ii8/havoc/archive/${pkgver}.tar.gz)
b2sums=('d065a05a2ab6aca2352bfa40fdccb4378965980eec3a19bcd93c64986563cae27e9a89ea38a916589bd295c61a2e461162adc78c0a0689ad4851def1ed1fccb5')


build() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
