# Maintainer: Alejandro Osornio <aoxo.contact@gmail.com>
pkgname=tinymist-nightly-bin
_pkgname=tinymist
pkgver=0.11.33
pkgrel=1
pkgdesc="An integrated language service for Typst"
arch=('x86_64')
url="https://github.com/Myriad-Dreamin/tinymist"
license=('Apache-2.0')
options=('strip')
provides=('tinymist')
conflicts=('tinymist-git' 'tinymist-bin')
depends=(gcc-libs glibc)
source=("https://github.com/Myriad-Dreamin/tinymist/releases/download/v$pkgver/$_pkgname-linux-x64?v=$pkgver")
sha256sums=('d71f24e6972a9eb98c636cfa763ab9aeeb6d927be16d756bc71409bd54be60b1')

package() {
	cd "$srcdir/"
	mv "$_pkgname-linux-x64?v=$pkgver" "$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
}
