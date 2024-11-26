# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=mothur
pkgver=1.48.2
pkgrel=1
pkgdesc='A bioinformatics program for analyzing microbial communities.'
arch=('x86_64')
url='https://www.mothur.org/'
license=('GPL-3.0-only')
depends=('boost-libs')
makedepends=('boost' 'hdf5')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('bd37b22b5d2629c5f44bd7f104c5e5a2c3a117d724cd113ec7526c4aa62e1793')

prepare() {
  cd "${pkgname}-${pkgver}"

   # I hate this so much.
   sed -i '90d' source/mothur.h
   sed -i '13 i \#include <memory>' source/writer.h
   sed -i '17 i \#include "unistd.h"' source/utils.cpp
   sed -i 's/skipUchime),/skipUchime), source\/,/g' Makefile
   sed -i 's/CXXFLAGS = -O3/CXXFLAGS = -O3 -std=c++11/' source/uchime_src/makefile
}

build() {
  cd "${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 mothur "${pkgdir}/usr/bin/mothur"
  install -Dm755 uchime "${pkgdir}/usr/bin/uchime"
}
