# Maintainer: Lili1228 <aur at lili dot lgbt>
pkgname=86box-roms
pkgver=4.2.1
pkgrel=1
pkgdesc='ROMs for the 86Box emulator'
arch=('any')
url='https://github.com/86Box/roms'
license=('custom')
options=('!strip')
source=("https://github.com/86Box/roms/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('188e1ebd8bef19d3e3d56260bd9340b3d583d55932ee2fbc5a4c6a4760b05adacef104e58b873dc79d87d6fb270356e569bf63a25956daedc2d84e5d16a9468f')

package() {
    cd "${srcdir}/roms-${pkgver}"
    install -d "$pkgdir/usr/share/86Box/roms"
    cp -R [a-z]* "$pkgdir/usr/share/86Box/roms"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
