# Maintainer: t3kk3n <corp[at]hush[dot]ai>
# Contributor: Bakasura <bakasura[at]protonmail[dot]ch>

pkgname=fatx
pkgver=1.17
pkgrel=2
pkgdesc="XBox filesystem support for linux"
arch=('any')
url="http://sourceforge.net/projects/fatx/"
license=('GPL')
provides=($pkgname)
makedepends=('boost' 'cmake' 'doxygen' 'graphviz')
depends=('fuse' 'boost-libs' 'libboost_program_options.so')
source=("http://downloads.sourceforge.net/project/fatx/${pkgname}-${pkgver}.tar.gz")
sha256sums=('533b1a40d9fe0e7038d0ad8a461624c01cd0bc7c52a79cdc9293db0fcc1b4e25')

build() {
    sed -i 's/SBIN/BIN/g' "${srcdir}/CMakeLists.txt"
    sed -i 's/sbin/bin/g' "${srcdir}/CMakeLists.txt"
    cmake -B build -S "$srcdir" -DCMAKE_BUILD_TYPE='None' -DCMAKE_INSTALL_PREFIX='/usr' -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
