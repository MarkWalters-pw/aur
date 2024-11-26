# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: alejandrogomez <alejandroogomez@gmail.com>

pkgname=ydiff
pkgver=1.3
pkgrel=2
pkgdesc="Colored, incremental, side-by-side diff viewer"
arch=('any')
url="http://pypi.python.org/pypi/ydiff/"
license=('BSD-3-Clause')
depends=('python')
makedepends=(python-setuptools python-build python-installer python-wheel)
optdepends=("patchutils: uses filterdiff for context diffs")
conflicts=('cdiff')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/ymattw/${pkgname}/archive/refs/tags/${pkgver}.tar.gz)
md5sums=('96bf288a051fe266ff3d3e4f87d90286')


build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
