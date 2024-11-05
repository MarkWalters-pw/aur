# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Michael Straube <michael.straube@posteo.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Valsu [arch(at)hylia.de]

pkgname=eureka
pkgver=2.0.2
pkgrel=1
pkgdesc="A map editor for the classic DOOM games"
arch=("i686" "x86_64")
url="http://${pkgname}-editor.sourceforge.net/"
license=("GPL2")
depends=("fltk" "glu" "gmock" "gtest" "libxpm")
makedepends=("cmake" "git" "python")
options=(!buildflags !staticlibs)
source=(
  "https://github.com/ioan-chera/${pkgname}-editor/archive/refs/tags/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=(
  "29ac38fdcb46a4ac2f2a56899abd7fd0994759cf0b74538043fcfbab9b19f88e"
)

prepare() {
  mkdir "${srcdir}/${pkgname}-editor-${pkgname}-${pkgver}/build"
}


build() {
  cd "${srcdir}/${pkgname}-editor-${pkgname}-${pkgver}/build"

  cmake "${srcdir}/${pkgname}-editor-${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd "${srcdir}/${pkgname}-editor-${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/include/gmock"
  rm -rf "${pkgdir}/usr/include/gtest"
  rm -rf "${pkgdir}/usr/lib/cmake/GTest"
  rm -f "${pkgdir}/usr/lib/pkgconfig/gmock"*
  rm -f "${pkgdir}/usr/lib/pkgconfig/gtest"*

  install -Dm644 "${srcdir}/${pkgname}-editor-${pkgname}-${pkgver}/misc/${pkgname}.xpm" "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
  install -Dm644 "${srcdir}/${pkgname}-editor-${pkgname}-${pkgver}/misc/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}-editor-${pkgname}-${pkgver}/misc/${pkgname}.6" "${pkgdir}/usr/share/man/man6/${pkgname}.6"
}
