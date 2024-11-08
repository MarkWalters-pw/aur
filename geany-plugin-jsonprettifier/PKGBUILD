# Maintainer: fft
# Contributor: Lukas Rose <public@lrose.de>

pkgname=geany-plugin-jsonprettifier
pkgver=1.6.1
pkgrel=1
pkgdesc="Clean up unformatted JSON in Geany editor"
arch=('i686' 'x86_64')
url="https://plugins.geany.org/jsonprettifier.html"
license=('GPL-2.0-or-later')
depends=('geany' 'yajl')
source=("https://github.com/zhgzhg/Geany-JSON-Prettifier/archive/v${pkgver}.tar.gz")
sha256sums=('9e37c755e90389256d028aa35e291615a97bb503d04a09e821f936adbe2a1e9b')

build() {
  cd "Geany-JSON-Prettifier-${pkgver}"
  # NB: upstream uses own yajl version. Here yajl library from archlinux repo is used instead.
  gcc -DLOCALEDIR=\"\" -DGETTEXT_PACKAGE=\"zhgzhg\" geany_json_prettifier.c -fPIC -shared $(pkg-config --cflags geany) -lgeany -lyajl -o jsonprettifier.so
}

package() {
  mkdir -p "${pkgdir}/usr/lib/geany"
  cp "Geany-JSON-Prettifier-${pkgver}/jsonprettifier.so" "${pkgdir}/usr/lib/geany"
}
