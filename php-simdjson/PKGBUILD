# Maintainer: William Varmus <0@willvar.tw>

_extname=simdjson
pkgname=php-$_extname
pkgdesc='Faster json decoding through simdjson bindings for PHP'
pkgver=4.0.0
pkgrel=1
arch=('x86_64')
url='https://github.com/crazyxman/simdjson_php'
license=('Apache 2.0')
depends=('php>=7.0')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
sha256sums=('1fb48fe579ff0b6b8f991f236c0caed1645f672baa2abf7b3f8c9f21488119c8')

build() {
  cd $srcdir/$_extname-$pkgver
  echo "extension=$_extname" > $_extname.ini
  phpize
  ./configure --prefix=/usr --with-simdjson
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