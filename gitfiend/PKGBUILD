# Maintainer: Erik Dubois <erikdubois@gmail.com>
pkgname=gitfiend
pkgver=0.45.3
pkgrel=1
pkgdesc='A Git client designed for humans'
arch=('x86_64')
license=('ISC')
depends=('libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-atk' 'libappindicator-gtk3' 'libsecret')
url="https://gitfiend.com"
options=('!strip')
source=("https://github.com/GitFiend/Support/releases/download/v${pkgver}/GitFiend_${pkgver}_amd64.deb")
md5sums=('747fd58463ae899f0cebc44264e1a35e')
package() {
	tar -xvf data.tar.xz -C ${pkgdir}
	chmod 4755 ${pkgdir}/opt/GitFiend/chrome-sandbox
	install -dm755 "$pkgdir/usr/bin"
	ln -sf "/opt/GitFiend/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
