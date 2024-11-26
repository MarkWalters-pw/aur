# Maintainer: Daniil "danogentili" Gentili <daniil@daniil.it>
# Maintainer: William Varmus <0@willvar.tw>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: 吕海涛 <aur@lvht.net>

_extname=msgpack
pkgname=php-$_extname
pkgver=3.0.0
pkgrel=2
pkgdesc="PHP extension for interfacing with MessagePack"
arch=("i686" "x86_64")
license=('3-Clause-BSD')
url='https://github.com/msgpack/msgpack-php'
depends=('php>=7.0')
source=("https://pecl.php.net/get/$_extname-${pkgver}.tgz")
sha256sums=('55306a84797d399c6b269181ec484634f18bea1330bbd9d7405043c597de69cd')

build() {
cd $srcdir/$_extname-$pkgver
  echo extension=$_extname > $_extname.ini
  phpize
  ./configure --prefix=/usr
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
