# Maintainer: Fady Nagh <Fady@Fadyio.com>

pkgname=teller-bin
pkgver=2.0.7
pkgrel=1
pkgdesc="Binary package of Teller - Cloud native secrets management for developers"
arch=('x86_64')
url="https://github.com/tellerops/teller"
license=('Apache-2.0')
depends=('openssl-1.1')
source=("https://github.com/tellerops/teller/releases/download/v$pkgver/teller-x86_64-linux.tar.xz")
sha256sums=('3f4d13aeb516f3c330809f0dc22119d7b7bcb757c0c441431734c0746bf9684f')

package() {
    cd "$srcdir"
    tar -xf "teller-x86_64-linux.tar.xz"
    cd "teller-x86_64-linux"
    install -Dm755 "teller" "$pkgdir/usr/bin/teller"
}
