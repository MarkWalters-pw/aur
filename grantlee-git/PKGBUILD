# Merged with official ABS grantlee PKGBUILD by João, 2024/03/30 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=grantlee-git
pkgver=5.1.0_r1417.g90f0278
pkgrel=1
pkgdesc='A string template engine based on the Django template system and written in Qt'
arch=($CARCH)
url='https://github.com/steveire/grantlee'
license=(LGPL2.1)
depends=(qt6-declarative)
makedepends=(git cmake doxygen graphviz)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(git describe | sed 's/^v//;s/-.*//')"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DQT_MAJOR_VERSION=6 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=OFF
  cmake --build build
  cmake --build build --target docs
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 build/apidox/* -t "$pkgdir"/usr/share/doc/$pkgname
}
