# Maintainer: Christian Schendel (doppelhelix@gmail.com)
# Maintainer: Kevin Concilio (kevin.concilio1@gmail.com)

pkgname=gnome-shell-extension-pano
pkgver=23_alpha2
version=${pkgver//_/-}
pkgrel=1
pkgdesc="Next-gen Clipboard Manager (forked from -git package)"
arch=('any')
url="https://github.com/oae/gnome-shell-pano"
license=('GPL-2.0-or-later')
depends=('gnome-shell>=45'
         'libgda6'
         'cogl'
         'gsound')
makedepends=('gobject-introspection'
             'yarn'
             'appstream'
             'zip')
source=("$url/archive/refs/tags/v$version.tar.gz")
md5sums=("SKIP")

prepare() {
  cd "gnome-shell-pano-$version"
  yarn install
}

build() {
  cd "gnome-shell-pano-$version"
  yarn build:package
}

package() {
  cd "gnome-shell-pano-$version/dist"

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local schema=$(grep -Po '(?<="settings-schema": ")[^"]*' metadata.json).gschema.xml
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"

  install -d "${destdir}"
  bsdtar xvf ${uuid}.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/"
  install -Dm644 "schemas/${schema}" -t "${pkgdir}/usr/share/glib-2.0/schemas/"

  rm -rf "${destdir}/schemas"
}

