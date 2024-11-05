# Maintainer: Heptazhou <zhou at 0h7z dot com>

pkgbase_=iraf
pkgname_=($pkgbase_{,-noao})
pkgname=(${pkgname_[@]/%/-bin})
debver=2.18.1~rc1-2
pkgver=2.18.1~rc1
pkgrel=2
pkgdesc="IRAF - Image Reduction and Analysis Facility"
arch=("x86_64")
url="https://github.com/iraf-community/$pkgbase_"
url_="https://deb.debian.org/debian/pool/main/${pkgbase_:0:1}/$pkgbase_"
license=("custom")
options=(!debug)
noextract=(${pkgname_[@]/%/_${debver}_amd64.deb})
source=(${noextract[@]/#/${url_}/})
sha256sums=(
	"21a47659a70022747858c36696adf80eb7096297d76dc3e72ba7d0b4cdfed55e"
	"7f4270ff159bb76525d3f126acf473ade69027df05ce88f791693718d8a5bc02"
)
# https://tracker.debian.org/pkg/iraf

prepare() {
	for name in "${pkgname_[@]}"; do
		ar x "${name}_${debver}_amd64.deb" "data.tar.xz"
		mkdir "$name/" -p
		tar Cfx "$name" "data.tar.xz" && rm "data.tar.xz"
	done
}

package_iraf-bin() {
	provides=("$pkgbase_")
	conflicts=("$pkgbase_")
	depends=("glibc" "readline" "sh")
	optdepends=(
		"$pkgbase_-noao: IRAF NOAO data reduction package"
		"ds9: Image display tool for astronomy"
		"xgterm: Terminal emulator to work with IRAF"
	)

	cd -- "$srcdir/$pkgbase_/"

	mkdir "usr/share/licenses/$pkgbase_/" -p
	mv -T "usr/share"/{"doc/$pkgbase_/copyright","licenses/$pkgbase_/LICENSE"}
	rm -r "usr/share"/{"doc","lintian"} -f
	cp -t "$pkgdir/" -a "usr" "etc"
}

package_iraf-noao-bin() {
	provides=("$pkgbase_-noao")
	conflicts=("$pkgbase_-noao")
	depends=("$pkgbase_")

	cd -- "$srcdir/$pkgbase_-noao/"

	mkdir "usr/share/licenses/" -p
	ln -s "usr/share/licenses/$pkgbase_"{,-noao} -r
	rm -r "usr/share"/{"doc","lintian"} -f
	cp -t "$pkgdir/" -a "usr"
}
