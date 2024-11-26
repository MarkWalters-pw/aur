# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Moritz Lipp <mlq@pwmt.org>

_gitname=zathura-cb
pkgname=zathura-cb-git
pkgver=0.1.11.r1.g8071728
pkgrel=1
pkgdesc="Adds comic book support to zathura"
arch=('i686' 'x86_64')
url="https://pwmt.org/projects/zathura-cb/"
license=('Zlib')
depends=('zathura' 'libarchive' 'desktop-file-utils')
makedepends=('git' 'meson' 'ninja' 'appstream-glib')
conflicts=('zathura-cb')
provides=('zathura-cb')
source=(${_gitname}::git+https://github.com/pwmt/zathura-cb.git#branch=develop)
md5sums=('SKIP')


pkgver() {
  cd "$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_gitname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dm664 "$_gitname"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
