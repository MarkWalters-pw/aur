# Maintainer: 7Ji <pugokushin@gmail.com>

pkgname=sd-networkd-wg-ddns
pkgver=1.1.1
pkgrel=1
pkgdesc="Systemd-networkd wireguard netdev endpoints DynDNS updater."
arch=('x86_64' 'aarch64')
url="https://github.com/7Ji/${pkgname}"
license=('AGPL3')
depends=('systemd')
_srcname="${pkgname}-${pkgver}"
source=(
  "${_srcname}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  '42fb6362cc058c991934425c05dcb1daeb0ee41bb5fc74377e7fd7fe0086d73f'
)

build() {
  cd "${_srcname}"
  make "VERSION=${pkgver}-ArchLinux-${pkgrel}"
}

package() {
  backup=("etc/conf.d/${pkgname}")
  cd "${_srcname}"
  make install DESTDIR="${pkgdir}"
}