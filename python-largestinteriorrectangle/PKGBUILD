# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>

pkgname=python-largestinteriorrectangle
_name=${pkgname#python-}
_shortname=lir
pkgver=0.2.1
pkgrel=1
pkgdesc="Largest Interior/Inscribed Rectangle implementation in Python"
arch=('any')
url="https://github.com/OpenStitching/lir"
license=('Apache-2.0')
depends=('python-opencv' 'python-numba' 'python-numpy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('72b27714d017a970f3a8da8a5796bde14bdeb354721e5400fbe1260abb9bbe07')

build() {
    cd "$_shortname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_shortname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
