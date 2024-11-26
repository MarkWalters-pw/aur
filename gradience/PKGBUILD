# Maintainer: D3vil0p3r <vozaanthony[at]gmail[dot]com>

pkgname=gradience
_pkgname=Gradience
pkgver=0.4.1_patch1
pkgrel=2
pkgdesc="Change the look of Adwaita, with ease"
arch=('x86_64')
url="https://github.com/GradienceTeam/Gradience"
license=('GPL3')
depends=('libadwaita' 'libsoup3' 'python-gobject' 'python-anyascii' 'python-lxml' 'python-pillow' 'python-pluggy' 'python-svglib' 'python-yapsy' 'python-regex' 'python-material-color-utilities' 'libportal-gtk4' 'python-jinja')
makedepends=('meson' 'blueprint-compiler' 'gobject-introspection' 'sassc')
checkdepends=('appstream-glib')
optdepends=('adw-gtk3: The theme from libadwaita ported to GTK-3'
            'adw-gtk-theme: LibAdwaita Theme for all GTK3 and GTK4 Apps.')
install='xdg-config.install'
source=($url/archive/${pkgver//_/-}.tar.gz)
sha512sums=('aa33365fa004537e1c466878adfa7d1d1b3ce5ab2126c226408babfa22c16f11fabc80e37cfc6ed3ee4845b9dcdbda8088dabd58ac7a4375d222c9289d5f4fb3')

build() {
  arch-meson "$_pkgname-${pkgver//_/-}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
