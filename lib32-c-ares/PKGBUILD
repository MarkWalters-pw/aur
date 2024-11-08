# Maintainer: Yaksh Bariya <yaksbari4@gmail.com>

pkgname=lib32-c-ares
pkgver=1.32.2
pkgrel=1
pkgdesc="A C library for asynchronous DNS requests"
arch=(x86_64)
url="https://c-ares.haxx.se/"
license=(MIT)
depends=(lib32-glibc)
makedepends=(cmake)
provides=(libcares.so)
source=(https://github.com/c-ares/c-ares/releases/download/v${pkgver}/c-ares-${pkgver}.tar.gz{,.asc})
sha512sums=('f552dbe9cb7f7b28ed05d93ee866a161e77c841453cde3659cb1e0bf6d501894bf5f6b8db308f7397e6ead4b42f34ce17e1c2ef307352de50f2aad25e4610de8'
            'SKIP')
b2sums=('1acd4d90d0e9d8abcbc49561db8ae2e55295398353896a7ab0108c1ac8718eb08c655dff8aa6c0efa138524805972ac4033d0c49cfcebaeca1a019021073e981'
        'SKIP')
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2', # Daniel Stenberg <daniel@haxx.se>
              'DA7D64E4C82C6294CB73A20E22E3D13B5411B7CA') # Brad House <brad@brad-house.com>

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"
  local cmake_options=(
    -B build
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=lib32
    -DCMAKE_BUILD_TYPE=None
    -S c-ares-$pkgver
    -Wno-dev
  )
  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -rf "$pkgdir"/usr/{bin,include,share}
  install -vDm 644 c-ares-$pkgver/LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 c-ares-$pkgver/{AUTHORS,{CONTRIBUTING,DEVELOPER-NOTES,README,RELEASE-NOTES}.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
