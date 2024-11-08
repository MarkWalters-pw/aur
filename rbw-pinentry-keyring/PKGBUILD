# Maintainer: Tin Lai <tin@tinyiu.com>
pkgname=rbw-pinentry-keyring
pkgver=1.12.1
pkgrel=1
pkgdesc="pinentry-keyring script for rbw"
arch=('any')
url="https://github.com/doy/rbw"
license=('MIT')
depends=('rbw')
source=("$pkgname-v$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c564484f1054a85014b6b2a1fbade24d56b1b221dbac681c682ffaeba158b697')

package() {
  cd "rbw-$pkgver"

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 755 bin/"${pkgname}" -t "${pkgdir}/usr/bin"
}
