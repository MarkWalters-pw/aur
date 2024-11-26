# Maintainer: Gregory G Danielson III <gregdan3@protonmail.com>

pkgname=ttf-unifont-csur
pkgver=15.1.05
pkgrel=1
pkgdesc="TrueType part of the GNU Unifont containing Michael Everson's ConScript Unicode Registry (CSUR) Private Use Area (PUA) glyphs"
url="http://unifoundry.com/unifont.html"
arch=('any')
license=('GPL')
depends=('ttf-unifont')
makedepends=('fontforge')
url=https://unifoundry.com/unifont/index.html
source=(
	"http://unifoundry.com/pub/unifont/unifont-${pkgver}/unifont-${pkgver}.tar.gz"{,.sig}
)
sha512sums=('ce208ac4c5ced01aabd426a5db46e25c01f8a28d840eed42ae42616e3996123fa2609ab330737b03f24d496b2cb75a69f879ccb92ee7d76b49677160332fdb8a'
            'SKIP')
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <com dot unifoundry at unifoundry>

build() {
	cd "${srcdir}/unifont-${pkgver}/font"
	make hex
	make csurttf
}

package() {
	cd "$srcdir"
	install -Dm644 "unifont-${pkgver}/font/compiled/unifont_csur-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/TTF/Unifont_CSUR.ttf"
}
