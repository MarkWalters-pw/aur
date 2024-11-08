# Maintainer: Andy Botting <andy@andybotting.com>

_name=futurist
pkgname=python-futurist
pkgver=3.0.0
pkgrel=2
pkgdesc='Code from the future, delivered to you in the now.'
arch=(any)
url='https://docs.openstack.org/futurist/'
license=(Apache)
makedepends=(python-setuptools)
depends=(python-pbr python-six python-monotonic python-prettytable
         python-wheel)
checkdepends=(python-eventlet python-oslotest python-stestr
              python-testrepository python-testscenarios python-testtools)
source=("https://tarballs.opendev.org/openstack/$_name/$_name-$pkgver.tar.gz")
sha512sums=('7a9dbf88f11e22064c0ddc4bca94b12696696736cd36bcc7f06e5dfd4689e9e43293babc8d97094d69e1a4bab224ad3483453327090718802392ed679cb41191')

export PBR_VERSION=$pkgver

build() {
  cd $_name-$pkgver
  python setup.py build
}

check() {
  cd $_name-$pkgver
  stestr run
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
