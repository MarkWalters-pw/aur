# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=gnome-shell-extension-emoji-copy
pkgver=23
pkgrel=2
pkgdesc="simplify emoji selection and clipboard management"
arch=(any)
url=https://github.com/FelipeFTN/emoji-copy
license=(GPL-3.0-or-later)
depends=(gnome-shell)
makedepends=(python python-requests zip)
source=(emoji-copy-$pkgver.tar.gz::${url}/archive/v2.2.0.tar.gz
        emoji-copy-support-gnome47.patch::https://patch-diff.githubusercontent.com/raw/FelipeFTN/Emoji-Copy/pull/70.patch)
sha256sums=('b2aefee7d2bf1add05a1632019464cad80941a999a52d42528aa10c4c3e5f775'
            '549f3b21363b0c3d54781c26f46e927fa680905bd0c056696c87a4ae6421ba47')

prepare() {
  cd Emoji-Copy-2.2.0
  patch -p1 -N -i "${srcdir}/emoji-copy-support-gnome47.patch"
}

build() {
  cd Emoji-Copy-2.2.0
  make
}

package() {
  cd Emoji-Copy-2.2.0

  local metadata="$(find . -name 'metadata.json' | grep -v zip-temp)"
  local uuid="$(grep -Po '(?<="uuid": ")[^"]*' "$metadata")"
  local schema=$(grep -Po '(?<="settings-schema": ")[^"]*' \
    "$metadata").gschema.xml
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"

  install -dm0755 "$destdir"
  bsdtar xvf ${uuid}.zip -C "$destdir/" --no-same-owner
  install -Dm0644 "$destdir/schemas/$schema" \
    -t "$pkgdir/usr/share/glib-2.0/schemas/"

  # for some reason this doesn't get copied into the zip so just grab it
  # manually
  install -m0644 "${uuid}/data/emojis.db" "$destdir/data/emojis.db"

  rm -rf "${destdir}/schemas"
}

# vim: set ts=2 sw=2 et:
