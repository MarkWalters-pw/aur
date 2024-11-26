# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-opus
pkgver=1.5.2
pkgrel=1
pkgdesc="Codec designed for interactive speech and audio transmission over the Internet (mingw-w64)"
arch=(any)
url="https://www.opus-codec.org"
license=("BSD-3-Clause")
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('staticlibs' '!strip' '!buildflags')
source=("https://downloads.xiph.org/releases/opus/opus-$pkgver.tar.gz")
b2sums=('1c54de8171df1da69b64a2eca4ce97a0280cfceafb387f40ef1186add366030a397fabc19b18cf1e50d6dbaccb027697d1e2b3da4fa6ab73d70c2b4e723e87f7')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/opus-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --enable-custom-modes \
      --enable-deep-plc \
      --enable-dred \
      --enable-osce \
      --disable-doc
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/opus-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir/usr/${_arch}/share"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

# vim: ts=2 sw=2 et:
