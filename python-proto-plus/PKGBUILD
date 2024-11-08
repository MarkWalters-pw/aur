# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>

_name=proto-plus
pkgname=python-$_name
pkgver=1.24.0
pkgrel=2
pkgdesc='A wrapper around protocol buffers.'
arch=('any')
url="https://github.com/googleapis/proto-plus-python"
license=('Apache')
depends=(python python-protobuf)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('29094738e9c84559b8b51b078ecb059e7475c5c6e9392f23925c6df264efebd22c191c5b593fc659aabb20ce9cb0d93cde9df28b0b40aac4bbc80e075a95ec24')

build() {
	cd $_name-python-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $_name-python-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
