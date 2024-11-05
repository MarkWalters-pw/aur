# Maintainer: Andrew O'Neill <andrew at haunted dot sh>

pkgname=satdump
pkgver=1.2.1
pkgrel=1
pkgdesc='A generic satellite processing software'
arch=('x86_64')
license=('GPL-3.0-only')
url='https://github.com/altillimity/SatDump'
depends=('airspy' 'fftw' 'glfw' 'hackrf' 'jemalloc' 'libad9361' 'libpng' 'libvolk' 'nng' 'ocl-icd' 'portaudio' 'rtl-sdr' 'zstd')
makedepends=('boost' 'cmake' 'opencl-headers')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
optdepends=('limesuite' 'bladerf')
sha256sums=('1cf6fb3cde9a057cc95894ae02b28758793221e63fa0d12d0fda986b61ac3415')

build() {
  cd "SatDump-${pkgver}"

  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "SatDump-${pkgver}/build"

  make DESTDIR="${pkgdir}" install
}
