# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Kenneth J. Miller <ken plus aur at miller dot ec>

_pkgname=notify-py
pkgname=python-${_pkgname}
pkgver=0.3.43
pkgrel=1
pkgdesc="Cross platform desktop notifications for Python scripts and applications"
arch=(any)
url="https://github.com/ms7m/notify-py"
license=(MIT)
depends=(python python-jeepney python-loguru)
makedepends=(python-build python-wheel python-installer python-setuptools python-poetry-core)
checkdepends=(python-coverage)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ms7m/notify-py/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7080a2bfb8b9c020b7de2e54b8169a92ec6a79430affa7a2c90576ccda6cf470')

build() {
  cd "notify-py-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "notify-py-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
