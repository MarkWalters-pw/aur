# Maintainer: Kannan Thambiah <pygospa at gmail dot com>

pkgname=mopidy-listenbrainz
pkgver=0.2.0
pkgrel=1
pkgdesc="Mopidy extension for scrobbling played tracks to listenbrainz"
arch=("any")
url="https://github.com/suaviloquence/mopidy-listenbrainz"
license=("Apache-2.0")
depends=(
	"mopidy"
	"python"
	"python-pykka"
	"python-pylast"
	"python-setuptools"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7608b361277a8f98e962b552111718897fa5293227c175943bd66268ee72495e')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
