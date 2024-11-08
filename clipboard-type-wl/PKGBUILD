# Maintainer: nougatbyte nougatbyte at itandstuff dot de
pkgname=clipboard-type-wl
pkgver=1.1.1
pkgrel=1
pkgdesc="A simple script using dotool to type clipboard contents"
arch=('any')
url="https://github.com/nougatbyte/clipboard-type-wl"
license=('MIT')
depends=('dotool' 'wl-clipboard')
source=("script.sh")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/script.sh" "$pkgdir/usr/bin/clipboard-type-wl"
}

post_install() {
    echo "Run 'clipboard-type-wl' or set it as a shortcut in your DE to type the contents of your clipboard."
}