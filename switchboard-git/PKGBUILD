# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-git
pkgver=6.0.2.r144.gd6034f29
pkgrel=1
pkgdesc='The Pantheon Control Center'
arch=('x86_64')
url='https://github.com/elementary/switchboard'
license=(LGPL-3.0-or-later)
groups=('pantheon-unstable')
depends=('glib2' 'libadwaita' 'libgee'
         'granite7')
makedepends=('git' 'intltool' 'meson' 'vala' 'sassc')
optdepends=(
  'switchboard-plug-about: About plug'
  'switchboard-plug-applications: Applications plug'
  'switchboard-plug-datetime: Date & Time plug'
  'switchboard-plug-desktop: Desktop plug'
  'switchboard-plug-display: Display plug'
  'switchboard-plug-elementary-tweaks: Elementary Tweaks plug'
  'switchboard-plug-keyboard: Keyboard plug'
  'switchboard-plug-locale: Locale plug'
  'switchboard-plug-network: Network plug'
  'switchboard-plug-notifications: Notifications plug'
  'switchboard-plug-power: Power plug'
  'switchboard-plug-security-privacy: Security & Privacy plug'
)
provides=('switchboard' 'libswitchboard-3.so')
conflicts=('switchboard')
source=('git+https://github.com/elementary/switchboard.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson switchboard build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
