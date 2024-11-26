# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>

pkgname=python-lzf
_name=${pkgname}
pkgver=0.2.6
pkgrel=1
pkgdesc="C Extension for liblzf"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/teepark/python-lzf"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/release-$pkgver.tar.gz")
sha256sums=('19716a98e02a4f2835902642d5f276950131b019737f58b45373d721c10b8190')

build() {
    cd "$_name-release-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-release-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
