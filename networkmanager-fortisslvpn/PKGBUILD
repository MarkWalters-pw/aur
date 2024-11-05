# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=networkmanager-fortisslvpn
pkgver=1.4.0
pkgrel=6
pkgdesc="NetworkManager VPN plugin for Fortinet SSLVPN"
url=https://gitlab.gnome.org/GNOME/NetworkManager-fortisslvpn
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  libnm
  libsecret
  openfortivpn
  ppp
)
makedepends=(
  git
  glib2-devel
  libnma
  libnma-gtk4
  pkg-config
  python
)
optdepends=(
  'libnma-gtk4: GUI support (GTK 4)'
  'libnma: GUI support (GTK 3)'
)
_commit=308987d45faee919e54547eb7ff0120c32c5a84e  # tags/1.4.0^0
source=("git+https://gitlab.gnome.org/GNOME/NetworkManager-fortisslvpn.git#commit=$_commit")
sha256sums=('65781e81e56681169c105380d4d6a3c831f5cc778687cf9638a642974860b771')

pkgver() {
  cd NetworkManager-fortisslvpn
  git describe --tags | sed 's/-dev/dev/;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd NetworkManager-fortisslvpn

  # ppp 2.5.0
  git cherry-pick -n 084ef529c5fb8169 8773f772d39f8eee d59819b5d26db44f

  # https://aur.archlinux.org/packages/networkmanager-fortisslvpn#comment-934156
  sed -i 's/"--no-routes"/"--pppd-accept-remote"/g' src/nm-fortisslvpn-service.c

  autoreconf -fvi
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --libexecdir=/usr/lib
    --disable-static
    --with-gtk4
    --with-pppd-plugin-dir="$(pkgconf --variable=plugindir pppd)"
  )

  cd NetworkManager-fortisslvpn
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd NetworkManager-fortisslvpn
  make DESTDIR="$pkgdir" install dbusservicedir=/usr/share/dbus-1/system.d
}

# vim:set sw=2 sts=-1 et:
