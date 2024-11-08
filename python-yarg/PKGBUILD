# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-yarg
_name=${pkgname#python-}
pkgver=0.1.10
pkgrel=1
pkgdesc="A semi hard Cornish cheese, also queries PyPI (PyPI client)"
url="https://github.com/kura/yarg"
license=('MIT')
arch=('any')
depends=('python' 'python-requests')
makedepends=('python-build' 'python-wheel' 'python-installer')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('a38f8526e6cf79238edfc69a578737fbd6bea4a6aca8a4f265d2f56023a960f409a97aed9ed5b2b5c272c716fb5e1a4c4dc6fa03ee2d39dfb4762c02b0edb0ec')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  nosetests
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
