# Maintainer: Lex Black <autumn-wind@web.de>
# Contributor: Firegem <mrfiregem [at] protonmail [dot] ch>

pkgname=wlopm-git
pkgver=0.1.0.r5.g54230d7
pkgrel=1
pkgdesc="Wayland output power management."
arch=('x86_64')
url="https://git.sr.ht/~leon_plickat/wlopm"
license=('GPL-3.0-only')
depends=(wayland{,-protocols})
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://git.sr.ht/~leon_plickat/wlopm'
        0001_makefile.patch)
md5sums=('SKIP'
         '2c6d3e6c75f398f0223ce6ffc6477eaa')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  patch -Np2 -i ${srcdir}/0001_makefile.patch
}

build() {
  cd "${pkgname%-git}"
  make PREFIX='/usr' DESTDIR="$pkgdir"
}

package() {
  cd "${pkgname%-git}"
  make install PREFIX='/usr' DESTDIR="$pkgdir"
}
