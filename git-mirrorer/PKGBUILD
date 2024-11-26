# Maintainer: 7Ji <pugokushin@gmail.com>

pkgname=git-mirrorer
pkgver=1.1.3
pkgrel=1
pkgdesc="To mirror git repos, and archive and checkout them with submodules included implicitly."
arch=('x86_64' 'aarch64')
url="https://github.com/7Ji/${pkgname}"
license=('AGPL3')
depends=('libgit2' 'libyaml' 'xxhash')
_srcname="${pkgname}-${pkgver}"
source=(
  "${_srcname}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  '619c8563a6c81d74efe48000ad28d61420889950dfb2ec0174a7b087e5c6265e'
)

build() {
  cd "${_srcname}"
  make "VERSION=${pkgver}-ArchLinux-${pkgrel}"
}

package() {
  cd "${_srcname}"
  make install DESTDIR="${pkgdir}"
}