# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=govarnam
pkgname=${_base}-bin
pkgver=1.9.1
pkgrel=1
pkgdesc="Transliteration and reverse transliteration for Indian languages - Go port of libvarnam"
arch=('x86_64')
url="https://www.varnamproject.com"
license=('AGPL3')
makedepends=('unzip')
depends=('go')
provides=('govarnam')
source=("https://github.com/varnamproject/${_base}/releases/download/v${pkgver}/${_base}-${pkgver}-${arch}.zip")
sha256sums=('ce7cd06e03d2435313624ad31c2130f7b8b6779c626281ef11318e4045289aaa')
optdepends=('govarnam-ibus: Ibus engine support'
            'govarnam-schemes: Language schemes support')

prepare() {
	cd "${_base}"-"${pkgver}"-"${arch}"
	sed -i 's/prefix=\/usr\/local/prefix=\/usr/' govarnam.pc
}

package() {
	cd "${_base}"-"${pkgver}"-"${arch}"

	install -Dm 755 varnamcli "${pkgdir}/usr/bin/varnamcli"

	install -Dm 644 libgovarnam.so "${pkgdir}/usr/lib/libgovarnam.so.${pkgver}"
	ln -s /usr/lib/libgovarnam.so.${pkgver} "${pkgdir}/usr/lib/libgovarnam.so"
	ln -s /usr/lib/libgovarnam.so.${pkgver} "${pkgdir}/usr/lib/libgovarnam.so.1"

	install -Dm 644 govarnam.pc "${pkgdir}/usr/lib/pkgconfig/govarnam.pc"

	mkdir -p "${pkgdir}/usr/include/libgovarnam"
	cp -a --no-preserve=ownership *.h "${pkgdir}/usr/include/libgovarnam/"
}
