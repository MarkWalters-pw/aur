# Maintainer: Thien An Dang Thanh <thienandangthanh at gmail dot com>

pkgname=mender-artifact
provides=('mender-artifact')
conflicts=('mender-artifact')
pkgdesc="Mender.io utility to work with Mender Artifacts."
url="https://docs.mender.io/downloads#mender-artifact"
pkgver=3.11.2
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL3')
depends=()
optdepends=()

source=("$pkgname::https://downloads.mender.io/mender-artifact/$pkgver/linux/mender-artifact")
sha256sums=('2e7c58a5cf361d813649da9cf28afc9a77841bb0a8fd892a03eb58660b71b9a5')

package() {
    install -Dm 755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
