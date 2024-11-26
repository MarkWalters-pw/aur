# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pipreqs
pkgver=0.5.0
pkgrel=3
pkgdesc="Pip requirements.txt generator based on imports in project"
url="https://github.com/bndr/pipreqs"
license=('Apache-2.0')
arch=('any')
depends=('python' 'python-docopt' 'python-yarg' 'python-requests')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
optdepends=('jupyter-nbconvert: for scanning jupyter notebooks')
checkdepends=('jupyter-nbconvert')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('0a15f1b675006ce24408fbca5f87d782c479d33db2a98ec60f619547b74e9220387321bf19c94a312039f50a51f8e47ec8b766e4e631cac740306965b64abb43')

build() {
  cd pipreqs-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd pipreqs-$pkgver
  python -m unittest -v
}

package() {
  cd pipreqs-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
