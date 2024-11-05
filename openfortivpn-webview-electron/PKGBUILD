# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=openfortivpn-webview-electron
pkgver=1.2.3
pkgrel=1
pkgdesc="SAML single sing-on and easily retrieve the SVPNCOOKIE needed by openfortivpn"
arch=(any)
url=https://github.com/gm-vm/openfortivpn-webview
license=(MIT)
_electron=electron28
depends=("$_electron")
provides=(openfortivpn-webview)
conflicts=(openfortivpn-webview-qt)
makedepends=(git npm asar)
source=("$pkgname::git+https://github.com/gm-vm/openfortivpn-webview.git#commit=9273bd24605337b633cf22dde8275bc1593c9cb1")
sha256sums=('c3d5fc75fdf3885a8da4f181ed004f6266316767067c6059c79ce3a15e682454')

prepare() {
    _ver="$(</usr/lib/${_electron}/version)"
    cd $pkgname/openfortivpn-webview-electron
    npm ci
}

build() {
    cd $pkgname/openfortivpn-webview-electron
    local i686=ia32 x86_64=x64
    export NODE_ENV=production
    ./node_modules/.bin/electron-builder --linux --"${!CARCH}" --dir \
         -c.electronDist=/usr/lib/"$_electron" \
         -c.electronVersion="$_ver"
}

package() {
    local i686=linux-ia32-unpacked x86_64=linux-unpacked aarch64=linux-arm64-unpacked
    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/openfortivpn-webview" <<EOF
#! /usr/bin/sh
exec $_electron /usr/lib/openfortivpn-webview-electron "\$@"
EOF
    cd "$pkgname"
    install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd openfortivpn-webview-electron
    install -dm0755 "$pkgdir/usr/lib/$pkgname"
    asar e "dist/${!CARCH}/resources/app.asar" "$pkgdir/usr/lib/$pkgname/"
}

# vim: set ts=2 sw=2 et:
