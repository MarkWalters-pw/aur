# Maintainer: Ian Glen <ian@ianglen.me>
pkgname=lepton-eda-gtk3-git
pkgver=1.9.18.20220529.r2028.316720dcd
pkgrel=1
pkgdesc="A suite of free software tools for designing electronics. (gtk3 version)"
arch=('x86_64')
url="https://github.com/lepton-eda/lepton-eda"
license=('GPL-2.0-or-later OR LGPL-2.1-or-later')
groups=()
depends=('gtk3' 'guile')
makedepends=('git' 'pkg-config' 'flex' 'gawk')
optdepends=('libstroke: mouse gesture support' 'gtksheet: required for lepton-attrib (currently broken)')
provides=("${pkgname%-gtk3-git}")
conflicts=("${pkgname%-gtk3-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/lepton-eda/lepton-eda.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-gtk3-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-gtk3-git}"
	./autogen.sh
	./configure --prefix=/usr --disable-update-xdg-database --disable-attrib --with-gtk3
	make
}

package() {
	cd "$srcdir/${pkgname%-gtk3-git}"
	make DESTDIR="$pkgdir/" install
}
