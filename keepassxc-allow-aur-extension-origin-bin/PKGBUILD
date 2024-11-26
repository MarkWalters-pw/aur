# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname=keepassxc-allow-aur-extension-origin-bin
pkgver=2.7.7
pkgrel=2
pkgdesc="Cross-platform community-driven port of Keepass password manager (binary version)"
arch=('x86_64')
url="https://keepassxc.org/"
license=('GPL')
depends=(argon2 botan curl hicolor-icon-theme libxtst
         minizip pcsclite qrencode qt5-svg qt5-x11extras libusb)
optdepends=('xclip: keepassxc-cli clipboard support under X server'
            'wl-clipboard: keepassxc-cli clipboard support under Wayland')
source=(https://github.com/noahvogt/${pkgname%-*}-aur/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-x86_64.pkg.tar.zst)
sha256sums=('a4fed32eef0d442dbaa2d50b2d7132b098e1090321b4edbf114551949f7cd166')
provides=(org.freedesktop.secrets keepassxc)
conflicts=(keepassxc)

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
}
