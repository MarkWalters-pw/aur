# Maintainer: Frederic Van Assche <frederic@fredericva.com>

pkgname=python-influxdb-client
pkgver=1.44.0
pkgrel=1
pkgdesc="Python client for InfluxDB 1.8+ and 2.0"
arch=('any')
url="https://github.com/influxdata/influxdb-client-python/"
license=('MIT')
depends=('python>=3.7' 'python-dateutil>=2.5.3' 'python-reactivex>=4.0.4' 'python-certifi>=14.05.14' 'python-urllib3>=1.26.0')
makedepends=('python-setuptools>=21.0.0')
optdepends=('influxdb' 'python-ciso8601>=2.1.1' 'python-pandas>=1.0.0' 'python-numpy' 'python-aiohttp>=3.8.1' 'python-aiocsv>=1.2.2')
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://github.com/influxdata/influxdb-client-python/archive/v$pkgver.tar.gz)
sha512sums=('96d7c0151f576f687b97098e54824b4f489c0aa76d6fcab453ad18f8129c61896b5abf2ac1795c44d635657440bfa268c8b09dea18ba04cf7044b268b37672de')

build() {
  cd "$srcdir/influxdb-client-python-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/influxdb-client-python-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
