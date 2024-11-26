# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname=chromium-extension-keepassxc-browser-bin
pkgver=1.9.0.5
pkgrel=1
pkgdesc="KeePassXC Browser Integration - chromium extension (binary version)"
arch=('any')
url="https://github.com/noahvogt/chromium-extension-keepassxc-browser-aur"
license=('GPL3')
makedepends=('chromium' 'openssl' 'jq')
source=("$url/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('8d6e44c1d0f670858f4a686d6d1eac4a09d845d77397a154350a9bf0fcc94453')
provides=('chromium-extension-keepassxc-browser')
conflicts=('chromium-extension-keepassxc-browser')

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
}
