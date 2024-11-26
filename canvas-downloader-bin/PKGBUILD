# Maintainer:  <lohjingyen at gmail dot com>

pkgname=canvas-downloader-bin
pkgver=0.2.2
pkgrel=1
pkgdesc='Downloads files from all courses in canvas.'
depends=('gcc-libs' 'openssl')
arch=('x86_64')
url='https://github.com/bnjmnt4n/canvas-downloader'
#license=('')
source=("https://github.com/bnjmnt4n/canvas-downloader/releases/download/v$pkgver/canvas-downloader-x86_64-unknown-linux-gnu-v$pkgver")
sha256sums=('ac72a1349badf4ff3adbef7096e1ad79bce8ccbe28f251f84cbef63205cd8347')

package() {
	install -D -m755 canvas-downloader-x86_64-unknown-linux-gnu-v$pkgver "$pkgdir/usr/bin/canvas-downloader"
}
