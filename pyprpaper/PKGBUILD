# Maintainer: Raphael Tannous <raphaeltannous at proton dot me>
pkgname=pyprpaper
pkgver=0.3.2
pkgrel=2
pkgdesc="Randomly change wallpaper for given monitor(s) in hyprpaper."
arch=('x86_64')
url="https://github.com/rofe33/pyprpaper"
license=('GPL-3.0-only')
depends=(
  'python'
  'hyprpaper'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
  'python-wheel'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/rofe33/pyprpaper/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=(
  '0dbca4a8a4187cca82bbc62d8f60b8d14e9464cdf2c4317fe5d2df70e0889cd0'
)

prepare() {
	cd "${pkgname}-${pkgver}"
}

build() {
	cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
  python -I -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/${pkgname}-${pkgver}/LICENSE"
}
