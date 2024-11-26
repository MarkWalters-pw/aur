# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Ravi Desai <ravster3@hotmail.com>

pkgname=xfe
pkgver=1.46.2
pkgrel=1
pkgdesc='X File Explorer (Xfe) is an MS-Explorer like file manager for X'
arch=('x86_64')
url='http://roland65.free.fr/xfe'
license=('GPL-2.0-or-later')
depends=('fox>=1:1.6' 'fox<1:1.7' 'freetype2' 'xcb-util' 'libxft')
makedepends=('intltool')
source=("https://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('ea134d75ae0128263d134dae158267b7427248da7f8acd59aa31653b041c456b')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr 
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
