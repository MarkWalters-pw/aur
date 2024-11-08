# Maintainer: 7Ji <pugokughin@gmail.com>

pkgname=ampart
pkgver=1.4.1
pkgrel=1
pkgdesc="A partition tool to modify Amlogic's proprietary eMMC partition format and FDT"
arch=('x86_64' 'aarch64')
url="https://github.com/7Ji/${pkgname}"
license=('GPL3')
depends=('glibc' 'zlib')
_srcname="${pkgname}-${pkgver}"
source=(
  "${_srcname}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  'a4426dec656261235f5c1925a9e3daa31fa87a165f1f1153cb7fee4387854591'
)

build() {
  cd "${srcdir}/${_srcname}"
  make "VERSION_CUSTOM=${pkgver}-ArchLinux-${pkgrel}"
}

package() {
  install -Dm755 "${srcdir}/${_srcname}/${pkgname}" -t "${pkgdir}"/usr/bin/
}
