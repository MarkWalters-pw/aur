# Maintainer: Ian Glen <ian@ianglen.me>
pkgname=lepton-eda-git
pkgver=1.9.18.20220529.r2028.316720dcd
pkgrel=1
pkgdesc="A suite of free software tools for designing electronics."
arch=('x86_64')
url="https://github.com/lepton-eda/lepton-eda"
license=('GPL-2.0-or-later OR LGPL-2.1-or-later')
groups=()
depends=('gtk2' 'gtk2+extra' 'guile')
makedepends=('git' 'pkg-config' 'flex' 'gawk')
optdepends=('libstroke: mouse gesture support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/lepton-eda/lepton-eda.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr --disable-update-xdg-database
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
