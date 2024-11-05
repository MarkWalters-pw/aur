# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
#
# Pull requests are welcome here: https://github.com/yurikoles-aur/obs-service-source_validator
#

_servicename=source_validator
pkgname=obs-service-"${_servicename}"
pkgname=obs-service-source_validator
pkgver=0.39
pkgrel=1
pkgdesc='An OBS source service: running all the osc source-validator checks'
arch=('any')
url="https://github.com/openSUSE/obs-service-source_validator"
license=('GPL-2.0-or-later')
depends=(
  bzip2
  cpio
  diffutils
  gnupg
  libxml2
  obs-build
  patch
  perl-timedate
  unzip
  xz
  zstd
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('b689bca17677ba9de01a618f9d3b7e9f01e3eabe04969ca9f482a6005322670f')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

check() {
  cd "$pkgname-$pkgver"
  make VERBOSE=1 test
}
