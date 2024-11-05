# Maintainer: Brian Thompson <brianrobt@pm.me>
# Contributor: Christian Brassat <christian.brassat@gmail.com>

pkgname=gnome-shell-frippery
pkgver=46.1
pkgrel=1
pkgdesc='Gnome Shell extensions to make Gnome 3 more like Gnome 2'
arch=('any')
url='http://frippery.org/extensions/index.html'
license=('GPL2')
depends=('gnome-shell>=46.0')
makedepends=()
source=("http://frippery.org/extensions/${pkgname}-${pkgver}.tgz")
sha256sums=('aebe8656304229a22f417f3d91cb6a8633c01a06c1b7b6fb550808a6219a9423')

package() {
  cd .local
  rm -r share/gnome-shell/gnome-shell-frippery
  mkdir -p $pkgdir/usr
  cp -r share $pkgdir/usr/
}

# vim:set ts=2 sw=2 et:
