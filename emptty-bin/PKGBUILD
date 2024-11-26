# Maintainer: tijko <konick781@gmail.com> 

pkgname=emptty-bin

pkgver=0.12.1
pkgrel=1
pkgdesc="Dead simple CLI Display Manager on TTY"
arch=('x86_64')
url="https://github.com/tvrzna/emptty"
license=('MIT')
depends=('pam' 'libx11')
makedepends=('go' 'git')
optdepends=('xorg-server: default display server'
            'xorg-xauth: required if using xorg-server'
            'util-linux: mcookie required if using xorg-server'
            'wayland: alternative to xorg-server')
backup=('etc/emptty/conf')
provides=('emptty')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$arch-$pkgver.tar.gz")
sha512sums=('c83e16482369e3dbcdc24053e1a05da8b42d597cfe9a50aed91ebb0f02eee9d12f5789903f89e90472bca23b17e2083e721fb5ae674094d01e6258de572a82dc')

package() {
  install -DZs "usr/bin/emptty" -m 755 -t "/usr/bin"
  install -DZ "etc/emptty/conf" -m 644 -T "/etc/emptty/conf"
  install -D "usr/share/man/man1/emptty.1.gz" -t "/usr/share/man/man1"
  install -DZ "usr/lib/systemd/system/emptty.service" -m 644 -T "/usr/lib/systemd/system/emptty.service"
  install -Dm 644 usr/share/licenses/LICENSE -t /usr/share/licenses/$pkgname/LICENSE
}
