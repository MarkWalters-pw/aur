# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=camset
pkgver=0.0.21
pkgrel=1
pkgdesc='GUI for v4l2-ctl'
arch=(any)
provides=($pkgname python-$pkgname)
url="https://github.com/azeam/$pkgname"
license=(GPL3)
depends=(python python-opencv python-gobject v4l-utils)
makedepends=(python-installer)
_wheel="$pkgname-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/$_wheel")
sha256sums=('f886a46dac0902523381385d2893f66b9f7cf82cb854695e3ef7bb9e1ea80158')
noextract=("$_wheel")

# package only provides a wheel file so no build()

package() {
	python -m installer --destdir="$pkgdir" "$_wheel"
	chmod +x "$pkgdir/usr/share/applications/camset.desktop"
}
