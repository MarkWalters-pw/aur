# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: Ivy Foster <iff@archlinux.org>
# Contributor: Danny Bautista <aur at pyrolagus.de>

_pkgbase=bemenu
pkgbase=bemenu-git
pkgname=(
  bemenu-git
  bemenu-ncurses-git
  bemenu-wayland-git
  bemenu-x11-git
)
pkgver=0.6.22.r0.gbd62fb3
pkgrel=1
pkgdesc="Dynamic menu library and client program inspired by dmenu"
url="https://github.com/Cloudef/bemenu"
arch=(x86_64)
license=(
  GPL-3.0-or-later
  LGPL-3.0-or-later
)
makedepends=(
  git
  libxinerama
  libxkbcommon
  ncurses
  pango
  scdoc
  wayland
  wayland-protocols
)
source=(git+https://github.com/Cloudef/bemenu)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgbase"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgbase"
  make PREFIX=/usr
}

package_bemenu-git() {
  depends=(
    bemenu-renderer-git
    glibc
  )
  provides=(libbemenu-git bemenu libbemenu.so)
  conflicts=('bemenu')

  cd "$_pkgbase"
  make DESTDIR="$pkgdir" PREFIX=/usr install-base install-docs
}

package_bemenu-ncurses-git() {
  pkgdesc="ncurses renderer for bemenu"
  provides=(bemenu-renderer-git bemenu-ncurses)
  conflicts=(bemenu-ncurses)
  depends=(
    glibc
    libbemenu.so
    ncurses
  )

  cd "$_pkgbase"
  make DESTDIR="$pkgdir" PREFIX=/usr install-curses
}

package_bemenu-wayland-git() {
  pkgdesc="Wayland (wlroots-based compositors) renderer for bemenu"
  provides=(bemenu-renderer-git bemenu-wayland)
  conflicts=(bemenu-wayland)
  depends=(
    glibc
    cairo
    glib2
    libbemenu.so
    libxkbcommon
    pango
    wayland
  )
  install=bemenu-wayland-git.install

  cd "$_pkgbase"
  make DESTDIR="$pkgdir" PREFIX=/usr install-wayland
}

package_bemenu-x11-git() {
  pkgdesc="X11 renderer for bemenu"
  provides=(bemenu-renderer-git bemenu-x11)
  conflicts=(bemenu-x11)
  depends=(
    glibc
    cairo
    glib2
    libbemenu.so
    libx11
    libxinerama
    pango
  )

  cd "$_pkgbase"
  make DESTDIR="$pkgdir" PREFIX=/usr install-x11
}
