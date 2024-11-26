# Maintainer: Łukasz Moroz <lukaszmoroz@gmail.com>

pkgname=gnome-shell-extension-alt-tab-scroll-workaround
pkgver=7
pkgrel=1
pkgdesc="Temporary fix for a bug that buffers the scroll between different windows (e.g., Chrome and VS Code)"
arch=('any')
url="https://github.com/lucasresck/gnome-shell-extension-alt-tab-scroll-workaround"
license=('GPL3')
depends=('gnome-shell')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lucasresck/gnome-shell-extension-alt-tab-scroll-workaround/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('568f33f00dbf8190ac6293094078c160df678fc10e5161fb47db88031db1665c339245715870e8ea8083d9983d80a618f5ce60dfecce1918ba65c4c8efaa4617')

package() {
    cd "$pkgname-$pkgver"
    _uuid='alt-tab-scroll-workaround@lucasresck.github.io'
    install -Dm644 -t "$pkgdir/usr/share/gnome-shell/extensions/$_uuid" extension.js metadata.json
}
