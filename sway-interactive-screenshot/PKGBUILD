# Maintainer: Clément Martinez <me at moverest dot xyz>
pkgname=sway-interactive-screenshot
pkgver=2.0.4
pkgrel=1
url="https://github.com/moverest/sway-interactive-screenshot"
pkgdesc="Interactively take screenshot within Sway."
arch=('x86_64')
license=('MIT')
depends=('sway' 'fuzzel' 'grim' 'slurp' 'libnotify' 'wl-clipboard' 'python')
optdepends=(
	'rofi: selector'
	'swappy: edit screenshots'
	'dragon-drop: drap file to other programs'
	'xdg-utils: open file'
	'wf-recorder: capture screencasts'
)
source=("https://github.com/moverest/sway-interactive-screenshot/archive/$pkgver.tar.gz")
sha256sums=('7bb2337437976901ba5a2cb7aa809c670d668a61416dd83cbfdef3a9d4710cd0')

package() {
	cd "sway-interactive-screenshot-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	cp sway-interactive-screenshot "$pkgdir/usr/bin/"
}
