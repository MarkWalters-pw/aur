# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=turbocase
pkgver=1.8.0
pkgrel=1
pkgdesc="Generate an OpenSCAD case template from a KiCAD PCB"
arch=('any')
url="https://git.sr.ht/~martijnbraam/turbocase"
license=('MIT')
depends=('python' 'python-sexpdata')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('e2656a4708d54842e8aa1f151a163eabae30b3d524bd824c29f3d2fd1b53c745')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
