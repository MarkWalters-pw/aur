# Maintainer: William Varmus <0@willvar.tw>

_extname=jsonpath
pkgname=php-$_extname
pkgdesc='Extract data using JSONPath notation for PHP'
pkgver=2.1.0
pkgrel=1
arch=('x86_64')
url='https://github.com/supermetrics-public/pecl-jsonpath'
license=('PHP License')
depends=('php>=8.0')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
sha256sums=('237dcc570790c68364d07102da29cf1d8e0ce6ca9dad076f6061817351bba7f2')

build() {
  cd $srcdir/$_extname-$pkgver
  echo "extension=$_extname" > $_extname.ini
  phpize
  ./configure --prefix=/usr --enable-jsonpath
  make
}

check() {
  cd $srcdir/$_extname-$pkgver
  NO_INTERACTION=true make test
}

package() {
  cd $srcdir/$_extname-$pkgver
  make INSTALL_ROOT=$pkgdir install
  install -Dm644 $_extname.ini $pkgdir/etc/php/conf.d/$_extname.ini \
  && install -vDm 644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}