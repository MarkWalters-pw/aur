# Maintainer: 7Ji <pugokushin@gmail.com>

_pkgname=YAopenvfD
pkgname=${_pkgname,,}
pkgver=1.1
pkgrel=1
pkgdesc="Yet Another openvfd Daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/7Ji/${_pkgname}"
license=('GPL3')
depends=('glibc')
makedepends=('gcc')
conflicts=(
  'openvfd-service'
)
_conf="etc/conf.d/${_pkgname}"
backup=(
  "${_conf}"
)
_srcname="${_pkgname}-${pkgver}"
source=(
  "${_srcname}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  '78dc0bc85ae4e501ab5ee192efeb2c762834f404061e926cebb6581ffb9077f1'
)

build() {
  cd "${srcdir}/${_srcname}"
  make "VERSION=${pkgver}-ArchLinux-${pkgrel}"
}

package() {
  cd "${srcdir}/${_srcname}"
  make DESTDIR="${pkgdir}" install
  install -DTm644 systemd/YAopenvfD.conf "${pkgdir}/${_conf}"
}