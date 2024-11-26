# Maintainer: l-koehler <lorenz.koehler@posteo.de>
pkgname=cmix
pkgver=20
pkgrel=1
pkgdesc="lossless data compression program aimed at optimizing compression ratio at the cost of high CPU/memory usage"
arch=('x86_64')
url="https://www.byronknoll.com/cmix.html"
license=('GPL-3.0-only')
options=(!debug)
depends=()
makedepends=('make')
optdepends=('tar: compress multiple files by making a tarball')
source=("$pkgname-$pkgver.tar.gz::https://github.com/byronknoll/cmix/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=(SKIP)

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir "$pkgdir/usr/bin" -p
	mv "./cmix" "$pkgdir/usr/bin"
}
