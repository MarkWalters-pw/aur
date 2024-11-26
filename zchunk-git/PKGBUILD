# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Ex-Maintainer: Nikita Puzyryov <PuzyryovN@gmail.com>
#
# PRs are welcome here: https://github.com/yurikoles-aur/zchunk-git
#

pkgname=zchunk-git
pkgver=1.5.1.r0.g69dd7d6
pkgrel=1
pkgdesc='A file format designed for highly efficient deltas while maintaining good compression'
pkgdesc+=' (git version)'
arch=(x86_64)
url=https://github.com/zchunk/zchunk
license=(BSD-2-Clause)
depends=(libcurl.so zstd)
makedepends=(meson)
makedepends+=(git)
provides=(libzck.so)
provides+=(zchunk="${pkgver}")
conflicts=(zchunk)
source=("${pkgname}::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/-/.r/;s/-/./'
}

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
