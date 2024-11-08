# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname='python-apptools'
pkgver=5.3.0
pkgrel=1
pkgdesc="Application tools"
arch=('any')
url="https://github.com/enthought/apptools"
license=('BSD')
depends=('python-traits')
makedepends=('python-setuptools')
optdepends=('python-configobj: for apptools.preferences package'
            'python-traitsui: for user interface to apptools')
source=("apptools-$pkgver.tar.gz::https://github.com/enthought/apptools/archive/${pkgver}.tar.gz")
sha256sums=('c7f1c0001161f68c2764498329d29316c990db2eadad46a517e4328c1c1f1a14')

build() {
  cd "$srcdir"/apptools-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/apptools-$pkgver

  python setup.py install --root="$pkgdir"/  --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
