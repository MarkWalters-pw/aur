# Maintainer:
# Contributor: Benjamin Hedrich <code [at] pagenotfound [dot] de>
# Contributor: Sitansh Rajput <me [at] lostpolaris [dot] com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Michael Lutonsky <m@luto.at>
# Contributor: Tássio Virgínio <tassiovirginio@gmail.com>

## links
# https://www.beekeeperstudio.io
# https://github.com/beekeeper-studio/beekeeper-studio

_pkgname="beekeeper-studio"
pkgname="$_pkgname-bin"
pkgver=4.6.8
pkgrel=1
pkgdesc="Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more"
url="https://github.com/beekeeper-studio/beekeeper-studio"
license=('MIT')
arch=('x86_64' 'aarch64')

optdepends=(
  'dbus-glib: used by libgconf'
  'gtk2: used by libappindicator'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="Beekeeper-Studio-$pkgver"
_pkgext="AppImage"
source=("$_pkgsrc-license.txt"::"$url/raw/v$pkgver/LICENSE.md")
source_x86_64=("$url/releases/download/v$pkgver/$_pkgsrc.$_pkgext")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgsrc-arm64.$_pkgext")
sha256sums=('1409fbbc5265c85da91684660c87f85d74c3fdc63a2d355169f40dac5cc7a078')
sha256sums_x86_64=('2f23bdc42a991b980d02f0885fdc1a7126f9f7088b8d73c3b5af858a9bb6e1f9')
sha256sums_aarch64=('10a18bf9a7ae09c06e4a1f95b647601612352dc72ebcef161e8a9b67f25d5fb7')

prepare() {
  if [[ "$CARCH" == "aarch64" ]]; then
    ln -sf "$_pkgsrc-arm64.$_pkgext" "$_pkgsrc.$_pkgext"
  fi

  chmod ugo+x "$_pkgsrc.$_pkgext"
  "./$_pkgsrc.$_pkgext" --appimage-extract

  sed -E -e "s&^Exec=.*\$&Exec=$_pkgname %F&" -i "squashfs-root/$_pkgname.desktop"
}

package() {
  depends+=(
    'alsa-lib'
    'gtk3'
    'libdbusmenu-glib'
    'nspr'
    'nss'
  )

  local _install_path="$pkgdir/opt/$_pkgname"

  # main files
  install -dm755 "$_install_path"
  mv squashfs-root/* "$_install_path/"

  # share
  install -dm755 "$pkgdir/usr/share"
  cp -a --reflink=auto "$_install_path/usr/share/icons" "$pkgdir/usr/share/"
  cp -a --reflink=auto "$_install_path/usr/share/mime" "$pkgdir/usr/share/"

  install -Dm755 "$_install_path/$_pkgname.desktop" -t "$pkgdir/usr/share/applications/"

  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env sh
exec "/opt/$_pkgname/$_pkgname" "\$@"
END

  # licenses
  install -Dm644 "$_pkgsrc-license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 \
    "$pkgdir/opt/$_pkgname/LICENSE.electron.txt" \
    "$pkgdir/opt/$_pkgname/LICENSES.chromium.html" \
    -t "${pkgdir}/usr/share/licenses/$pkgname/"

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
