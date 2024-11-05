# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=libleidenalg
pkgver=0.11.1
pkgrel=1
pkgdesc='Leiden algorithm'
arch=(i686 x86_64)
url='https://github.com/vtraag/libleidenalg'
depends=(igraph)
makedepends=(cmake)
license=(GPL-3.0-or-later)
source=("$pkgname-$pkgver::$url/archive/refs/tags/0.11.1.tar.gz")
sha256sums=('7d7392afd214c584e023cc2f0d0ac375f58575c32f2e49ba85062065f1637c7f')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	mkdir -p build
	echo "$pkgver" > VERSION
}

build() {
	cd "$srcdir/$pkgname-$pkgver/build"

	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" ..
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	(cd build; make install)
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
