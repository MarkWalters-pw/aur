# Maintainer: Florian Moser <arch@famoser.ch>

pkgname=local-php-security-checker
pkgrel=1
pkgver=2.1.3
pkgdesc="PHP security vulnerabilities checker."
url="https://github.com/fabpot/local-php-security-checker"
arch=('x86_64')
license=('AGPL3')
source=(
    "$pkgname-$pkgver::https://github.com/fabpot/local-php-security-checker/releases/download/v${pkgver}/${pkgname}_linux_amd64"
)
sha256sums=('db03c8c1806924081093fb6e3f752597a6d2ed6aea4621365e87e69d4814fd6c')

package() {
    install -D -m 755 "${srcdir}/$pkgname-$pkgver" "${pkgdir}/usr/bin/local-php-security-checker"
}
