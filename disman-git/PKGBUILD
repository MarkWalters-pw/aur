# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Christoph Haag <christoph.haag@collabora.com>
# Author: Matthias Blaicher <matthias at blaicher dot com>

pkgname=disman-git
pkgver=0.600.0_r1876.ge213fd1
pkgrel=1
pkgdesc='Qt/C++ display management library by the KWinFT project (libkscreen fork)'
arch=($CARCH)
url='https://github.com/winft/disman'
license=(LGPL)
depends=(kcoreaddons-git qt6-base)
makedepends=(git extra-cmake-modules-git kwayland-git libxcb wrapland-git)
optdepends=('libxcb: for the X11 backend plugin'
            'wrapland-git: for the KWinFT and wlroots backend plugins'
            'kwayland-git: for the KDE output-management backend plugin')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -im1 "project(${pkgname%-git} VERSION" CMakeLists.txt | sed 's/.* //; s/-/./g; s/)//')"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
