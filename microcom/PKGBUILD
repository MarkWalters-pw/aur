pkgname=microcom
pkgver=2023.09.0
pkgrel=1
pkgdesc="terminal emulator"
arch=('x86_64')
license=('GPL')
url='https://github.com/pengutronix/microcom'
depends=('readline')
source=("https://github.com/pengutronix/microcom/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('ef42184bb35c9762b3e9c70748696f7478efacad8412a88aaf2d9a6a500231a1')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make install DESTDIR="${pkgdir}"
}
