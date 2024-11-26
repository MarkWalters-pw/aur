# Maintainer: Perkelo <alessandro [dot] scala [eight][at] gmail [dot] com>
pkgname=mew-cursors-git
pkgver=r11.6b5d3c7
pkgrel=1
pkgdesc="Mew cursor theme for X11"
arch=('any')
url="https://github.com/Perkelo/mew-cursors"
license=('custom:FAL')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/Perkelo/mew-cursors.git")
noextract=()
sha256sums=('SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
	cd "$srcdir/${pkgname%-git}"
	THEME_DIR="$pkgdir/usr/share/icons/Mew Cursors"
	install -d "$THEME_DIR"
	cp cursor.theme "$THEME_DIR/cursor.theme"
	cp -r cursors "$THEME_DIR/cursors"
	
	LICENSE_DIR="$pkgdir/usr/share/licenses/$pkgname"
	install -d "$LICENSE_DIR"
	cp LICENSE "$LICENSE_DIR/LICENSE"
}
