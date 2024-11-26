# Maintainer: sukulent
pkgname='namefix'
pkgver="1.2.0"
pkgrel="1"
# epoch=
pkgdesc="Fix bad filenames"
arch=("x86_64")
url="https://github.com/sukulent/namefix"
license=('GPL-3-or-later')
# groups=()
depends=('icu' 'gcc-libs' 'glibc')
makedepends=('make' 'binutils' 'gcc')
# checkdepends=()
# optdepends=()
# provides=()
# conflicts=()
# replaces=()
# backup=()
# options=()
# install=
# changelog=
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/sukulent/namefix/tar.gz/refs/tags/v$pkgver")
# noextract=()
sha256sums=(8f72618045340dd92948b91d4e6cb8e2bd6f4ee07e739f37b12b56f1079bd5b7)
# validpgpkeys=()


build() {
	cd "$pkgname-$pkgver"
	make namefix
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ./namefix "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 ./man/namefix.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}
