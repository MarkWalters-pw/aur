# Maintainer: Heptazhou <zhou at 0h7z dot com>

pkgbase_=x11iraf
pkgname_=xgterm
pkgname=$pkgname_-bin
debver=2.2~rc1+dfsg-2
pkgver=2.2~rc1
pkgrel=1
pkgdesc="Terminal emulator to work with IRAF"
arch=("x86_64")
url="https://github.com/iraf-community/$pkgbase_"
url_="https://deb.debian.org/debian/pool/main/${pkgbase_:0:1}/$pkgbase_"
license=("custom")
options=(!debug)
provides=("$pkgname_")
conflicts=("$pkgname_")
depends=("libxaw" "ncurses" "tcl" "xaw3d")
optdepends=("iraf: Image Reduction and Analysis Facility")
source=(${url_}/${pkgname_}_${debver}_amd64.deb)
sha256sums=("99bef4f2571135e0498949002131e8f8c56336cb657e205300585b348fe59d28")
# https://tracker.debian.org/pkg/x11iraf

package() {
	cd -- "$srcdir/"
	tar fx "data.tar.xz"

	mkdir "usr/share/licenses/$pkgname_/" -p
	mv -T "usr/share"/{"doc/$pkgname_/copyright","licenses/$pkgname_/LICENSE"}
	rm -r "usr/share"/{"doc","lintian"} -f
	cp -t "$pkgdir/" -a "usr"

	mkdir "$pkgdir/usr/lib/" -p
	ln -s "$pkgdir/usr/lib/libXaw3d.so"{,.6} -r
}
