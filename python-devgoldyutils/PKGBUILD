# Maintainer: Goldy <goldy@devgoldy.xyz>
pkgname=python-devgoldyutils
pkgver="3.0.0"
pkgrel=1
pkgdesc="Goldy's small python util library."
arch=("x86_64" "i686")
url="https://github.com/THEGOLDENPRO/devgoldyutils"
license=("MIT")
makedepends=(
	"python-build" "python-setuptools-scm" "python-wheel"
)
depends=(
	"python"
)
checkdepends=()
provides=()
conflicts=()
md5sums=("SKIP")
source=(
	"https://github.com/THEGOLDENPRO/devgoldyutils/archive/refs/tags/$pkgver.zip"
)

build() {
	cd $srcdir/devgoldyutils-$pkgver
	python -m build --wheel --no-isolation
}

package() {
    cd devgoldyutils-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}