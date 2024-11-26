# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Giedrius Slavinskas <giedrius25@gmail.com>

pkgname=opendict
pkgver=0.6.8
pkgrel=3
pkgdesc="Multiplatform computer dictionary software"
arch=('any')
url="http://opendict.sourceforge.net/"
license=('GPL')
depends=('python-wxpython' 'xdg-utils' 'desktop-file-utils' 'gtk-update-icon-cache')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/nerijus/${pkgname}/archive/${pkgver}.tar.gz
        ${pkgname}-python3.diff::https://github.com/nerijus/opendict/commit/49021ad558733189d33789200748f0007fc67b9f.diff
        ${pkgname}-python3-2.diff::https://github.com/nerijus/opendict/commit/27b7f8e752f31b16ef4cbd11110bdf14bfae470e.diff)
md5sums=('0802d2b1b05ac477339084f3cdda6b3f'
         '06b2b3bac041bdf4cb56e4a84f632500'
         'b6d2371ef426ce68359011aed67967ec')


prepare() {
  cd $pkgname-$pkgver

  # python3 support
  patch -Np1 -i ${srcdir}/${pkgname}-python3.diff
  patch -Np1 -i ${srcdir}/${pkgname}-python3-2.diff
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR=$pkgdir/usr install

  # Fix makefile symlink
  cd $pkgdir/usr/bin
  ln -sf ../share/opendict/opendict.py opendict
}
