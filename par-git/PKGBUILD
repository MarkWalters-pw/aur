# Maintainer: Éric NICOLAS <ccjmne@gmail.com>
pkgname=par-git
pkgver=1.53.0.r0.eb0590f
pkgrel=2
pkgdesc="Adam M. Costello's paragraph reformatter, vaguely similar to fmt, but better."
arch=('x86_64' 'i686' 'aarch64' 'arm7h' 'arm6h' 'arm')
url="http://www.nicemice.net/par/"
license=('custom')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('upstream::git+https://bitbucket.org/amc-nicemice/par.git')
md5sums=('SKIP')

pkgver() {
	cd upstream
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd upstream
	make -f protoMakefile CC="cc -c" LINK1="cc" LINK2="-o" RM="rm" JUNK="" $*
}

check() {
	cd upstream
	./test-par ./par
}

package() {
	cd upstream
	install -D -m755 par "$pkgdir/usr/bin/par"
	install -D -m644 par.1 "$pkgdir/usr/share/man/man1/par.1"
	install -D -m644 par.doc "$pkgdir/usr/share/licenses/${pkgname%-git}/par.doc"
}
