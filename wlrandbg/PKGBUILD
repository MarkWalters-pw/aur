# Maintainer: Trenton Hekman <trenthek@gmail.com>
pkgname=wlrandbg
pkgver=0.0.1
pkgrel=1
pkgdesc="A desktop background image tool with random image cycling for wlroots compositors."
arch=('any')
url="https://github.com/trent-8/wlrandbg"
license=('MIT')
depends=('python' 'swaybg')
source=("wlrandbg.py")
sha256sums=('SKIP')

package() {
    install -Dm755 wlrandbg.py "$pkgdir/usr/bin/wlrandbg"
}