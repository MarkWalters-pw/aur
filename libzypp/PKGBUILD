# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Daan De Meyer <daan.j.demeyer@gmail.com>
# Contributor: Joshua Smith <smolsheep@opensuse.org>

# Pull Requests are welcome: https://github.com/yurikoles-aur/libzypp

pkgbase=libzypp
pkgname=(libzypp libzypp-doc)
pkgver=17.35.9
pkgrel=1
pkgdesc="ZYpp Package Management library"
arch=('x86_64')
url=https://en.opensuse.org/Portal:Libzypp
license=('GPL-2.0-or-later')
makedepends=(
  'boost-libs'
  'gpgme'
  'libproxy'
  'libsigc++'
  'libsolv'
  'libsystemd'
  'libxml2'
  'protobuf'
  'yaml-cpp'
  'asciidoc'
  'boost'
  'cmake'
  'dejagnu'
  'doxygen'
  'expat'
  'git'
  'gnupg'
  'graphviz'
  'cppcheck'
)
source=("${pkgname}-${pkgver}.tgz::https://github.com/openSUSE/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('385a6a719442e2997d61a00e6203160dc1c99aaa2eb33e3a612921b79e277d5a')

build() {
  cmake -B build \
    -S "${pkgname}-${pkgver}" \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_C_FLAGS_RELEASE='-DNDEBUG' \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_INSTALL_DOCDIR=share/doc \
    -D CMAKE_INSTALL_LIBEXECDIR=lib \
    -D LIB=lib \
    -D CMAKE_SKIP_RPATH=ON \
    -D DISABLE_MEDIABACKEND_TESTS=ON \
    -D ENABLE_BUILD_DOCS=ON \
    -D ENABLE_BUILD_TRANS=ON \
    -D ENABLE_BUILD_TESTS=ON \
    -D ENABLE_ZSTD_COMPRESSION=ON \
    -D ENABLE_ZCHUNK_COMPRESSION=ON \
    -D ENABLE_CLANG_TIDY=ON \
    -D ENABLE_CPPCHECK=ON \
    -D DISABLE_MEDIABACKEND_TESTS=ON

  cmake --build build
}

#
# See: disabled due to failure
# TODO: verify disabled test in new updates
check() {
  # mkdir -p "${HOME}"/.gnupg
  ctest --test-dir build -E RpmPkgSigCheck_test
}

package_libzypp() {
  depends=(
    'boost-libs'
    'gpgme'
    'libproxy'
    'libsigc++'
    'libsolv'
    'libsystemd'
    'libxml2'
    'protobuf'
    'yaml-cpp'
    'zchunk'
  )

  DESTDIR="${pkgdir}" cmake --install build

  # cmake fix (see GH#28)
  mkdir -p "${pkgdir}"/usr/lib/cmake/Zypp
  mv "${pkgdir}"/usr/share/cmake/Modules/* "${pkgdir}"/usr/lib/cmake/Zypp/
  rm -rf "${pkgdir}"/usr/share/{cmake,doc}
}

package_libzypp-doc() {
  arch=('any')
  DESTDIR="${pkgdir}" cmake --install build/doc
  mv "${pkgdir}"/usr/share/doc/packages/libzypp/libzypp "${pkgdir}"/usr/share/doc/libzypp
  rm -rf "${pkgdir}"/usr/share/{doc/packages,man}
}
