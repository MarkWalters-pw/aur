# Maintainer: William Varmus <0@willvar.tw>
# Contributor: Leo <i@setuid0.dev>

_extname=uuid
pkgname=php-$_extname
pkgver=1.2.1
pkgrel=1
pkgdesc='UUID extension for PHP'
arch=('x86_64')
url='https://github.com/php/pecl-networking-uuid'
license=('LGPL')
depends=('php>=7.0')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
sha256sums=('2235c8584ca8911ce5512ebf791e5bb1d849c323640ad3e0be507b00156481c7')

build() {
  cd $srcdir/$_extname-$pkgver
  echo "extension=$_extname" > $_extname.ini
  phpize
  ./configure --prefix=/usr --with-uuid
  make
}

check() {
  cd $srcdir/$_extname-$pkgver
  NO_INTERACTION=1 make test
}

package() {
  cd $srcdir/$_extname-$pkgver
  make INSTALL_ROOT=$pkgdir install
  install -Dm644 $_extname.ini $pkgdir/etc/php/conf.d/$_extname.ini \
  && install -vDm 644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}