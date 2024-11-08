# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: whoami <whoami@systemli.org>
# Contributor: Robert Holt <holt.r94 at gmail dot com>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: Yorhel <projects@yorhel.nl>
# Contributor: archtux <antonio.arias99999@gmail.com>

pkgname=ncdc
pkgver=1.24.1
pkgrel=1
pkgdesc='A lightweight direct connect client with a friendly ncurses interface'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://dev.yorhel.nl/${pkgname}"
license=('MIT')
depends=('gnutls' 'sqlite' 'glib2' 'libmaxminddb')
source=("${url%/${pkgname}}/download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2a8ab9ad7d43f018fc73ba8babd689dfa44aba8cec53b88e4770185cb97778f7')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr --with-geoip
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
