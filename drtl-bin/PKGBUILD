# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
#
pkgname=drtl-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='Yet another tldr client written in Zig.'
url='https://github.com/jiripospisil/drtl'
source_x86_64=("https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-x86_64-linux")
source_aarch64=("https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-aarch64-linux")
arch=('x86_64' 'aarch64')
provides=('drtl')
conflicts=('drtl')
license=('MIT')
b2sums_x86_64=('e24254a7a7a3114ce06f8f5f1a0f2bfb9b0dec8beb2f00cb63c9e61acc7d97e2ecd5dce9c265963d74fdfdf65c6e34087f44aacd6d102dcd62c142a635eb56d4')
b2sums_aarch64=('1bc7d499e7cc20d2af3a15532e95e4ce364b578231871c602e7c60859fbcc726a8c25a053b54856fac97e5ef8ee7d5d18ceee7ebca9dddd6b25c88ec7559dbe2')

package() {
  install -Dm755 "$srcdir/drtl-v$pkgver-$CARCH-linux" "$pkgdir/usr/bin/drtl"
}
