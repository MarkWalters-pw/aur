# Maintainer: Brian Thompson <brianrobt@pm.me>

pkgname=python-urlman
_srcname=urlman
pkgver=2.0.2
pkgrel=1
pkgdesc='A nicer way to do URLs for Django models'
arch=('x86_64')
url='https://github.com/andrewgodwin/urlman'
license=('Apache-2.0')
depends=('python' 'python-django-rest-framework')
makedepends=('python-wheel' 'python-build' 'python-installer')
source=("https://github.com/andrewgodwin/urlman/archive/refs/tags/$pkgver.tar.gz") # https://github.com/andrewgodwin/urlman/archive/refs/tags/2.0.2.tar.gz
sha512sums=('87e43bbbd6a83e72c0761ee2ea8710ddd70f137b1691ae6226538b7c46942b8fc4c3e40ae93a10c1c87727516caa46f64b59c1d9a703445a07e50871adf63bfe')

build() {
  cd $_srcname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_srcname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
