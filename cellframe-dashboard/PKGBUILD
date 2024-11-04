	# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname="cellframe-dashboard"
pkgver=3.0.71
pkgrel=1
pkgdesc="Super application for managing Cellframe node"
arch=(x86_64 aarch64)
url="https://cellframe.net"
license=(GPL3)
depends=(qt5-graphicaleffects qt5-base qt5-quickcontrols2 qt5-quickcontrols cellframe-node)
makedepends=(git qt5-base qt5-declarative)
options=(!debug)
source=(git+https://gitlab.demlabs.net/cellframe/$pkgname.git#commit=24af07483b5ff2f0b8e771365c4582ed7f606ecf
		cellframe-dashboard-tmpfiles.conf)
md5sums=('SKIP'
         '8e95f02e07c1f24093d01415cf59af2c')
install=$pkgname.install

prepare() {
	cd "$srcdir/$pkgname"
	sed -i 's|url = ../prod_build_cellframe-dashboard|url = https://gitlab.demlabs.net/cellframe/prod_build_cellframe-dashboard|' .gitmodules
	git submodule sync > /dev/null 2>&1
	git submodule update --init --recursive --progress
}

build() {
	cd "$srcdir/$pkgname"
	qmake
	make -j$(nproc)
}

package() {
	cd "$srcdir/$pkgname"
	make INSTALL_ROOT="$pkgdir" install
	install -Dm644 "$pkgdir/opt/$pkgname/share/CellFrameDashboard.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm644 "$pkgdir/opt/$pkgname/share/init.d/$pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm644 "$srcdir/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$srcdir/$pkgname-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
