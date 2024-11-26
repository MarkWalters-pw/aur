# Contributor: Carlchristian Eckert <carli-eckert at gmx dot de>

pkgname=pngwriter-git
pkgver=0.7.0.r0.g79bb3ef
pkgrel=1
pkgdesc="A C++ library for creating PNG images"
url="http://${pkgname%-git}.sourceforge.net/"
source=("${pkgname}::git+https://github.com/pngwriter/${pkgname%-git}.git")
install=${pkgname}.install
license=('GPL-2.0-or-later')
arch=('x86_64')
depends=('libpng' 'freetype2')
makedepends=('git' 'cmake')
sha256sums=('SKIP')
option=('staticlibs')

pkgver() {
    cd ${pkgname}
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
    cd ${pkgname}
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd ${pkgname}
    make DESTDIR="${pkgdir}" install
}
