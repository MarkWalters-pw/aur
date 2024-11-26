# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-zxing-cpp
_name=${pkgname#python-}
pkgver=2.2.1
pkgrel=1
pkgdesc="Python bindings for zxing-cpp"
arch=('x86_64')
url="https://github.com/zxing-cpp/zxing-cpp"
license=('Apache-2.0')
depends=(
  'python'
  'zxing-cpp'
)
makedepends=(
  'cmake'
  'pybind11'
  'python-setuptools-scm'
)
source=("$_name-$pkgver.tar.gz::https://github.com/zxing-cpp/zxing-cpp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('02078ae15f19f9d423a441f205b1d1bee32349ddda7467e2c84e8f08876f8635')

build() {
  cd "$_name-$pkgver/wrappers/python"
  python setup.py build
}

package() {
  cd "$_name-$pkgver/wrappers/python"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
