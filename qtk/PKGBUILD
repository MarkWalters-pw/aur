# Maintainer: qsqcqs
pkgname='qtk'
pkgver=nya
pkgrel=1
pkgdesc="random qol stuff"
arch=('x86_64')
url="https://github.com/qsqcqs/qtk"
license=('GPL-3.0-or-later')
depends=('python3')
checkdepends=()
optdepends=()
source=("https://github.com/qsqcqs/$pkgname/archive/refs/tags/$pkgver-$pkgrel.tar.gz")
noextract=()
validpgpkeys=()


package() {
	cd "$pkgname-$pkgver-$pkgrel"
	
    install -Dm644 zwnj "${pkgdir}"/usr/bin/zwnj
    install -Dm644 epscol "${pkgdir}"/usr/bin/epscol
	install -Dm644 nya~ "${pkgdir}"/usr/bin/nya~
    install -Dm644 nyom~ "${pkgdir}"/usr/bin/nyom~
	chmod +x "${pkgdir}"/usr/bin/zwnj
    chmod +x "${pkgdir}"/usr/bin/epscol
	chmod +x "${pkgdir}"/usr/bin/nya~
    chmod +x "${pkgdir}"/usr/bin/nyom~
}



sha256sums=('894fc24f16093e6e58acaa2e78711a782349da9dff6a7d4df5cdf29a52bfed43')
