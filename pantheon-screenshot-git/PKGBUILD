# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-screenshot-git
pkgver=6.0.4.r45.g4187e8f
pkgrel=1
pkgdesc='The Pantheon Screenshot Tool'
arch=('x86_64')
url='https://github.com/elementary/screenshot-tool'
license=('GPL-3.0-or-later')
groups=('pantheon-unstable')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc'
         'gtk3' 'libcanberra' 'libhandy'
         'libgranite.so')
makedepends=('git' 'granite' 'intltool' 'meson' 'vala')
provides=('pantheon-screenshot')
conflicts=('pantheon-screenshot')
source=("pantheon-screenshot::git+https://github.com/elementary/screenshot-tool.git")
sha256sums=('SKIP')

pkgver() {
  cd pantheon-screenshot

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  sed 's/extra/io.elementary.screenshot-tool.extra/' -i pantheon-screenshot/po/extra/meson.build

}

build() {
  arch-meson pantheon-screenshot build
  ninja -C build
}

package() {

  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
