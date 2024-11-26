# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# private key generated with `openssl genrsa 2048| openssl pkcs8 -topk8 -nocrypt -traditional`

_extension=return-youtube-dislike
pkgname="chromium-extension-$_extension"
pkgver=3.0.0.16
pkgrel=1
pkgdesc="Return YouTube Dislike - chromium extension"
arch=('any')
url="https://github.com/Anarios/$_extension"
license=('GPL3')
depends=('chromium')
makedepends=('openssl' 'jq' 'unzip')
source=("$_extension-$pkgver.zip::$url/releases/download/v$pkgver/chrome.zip"
        "$_extension.pem")
noextract=("$_extension-$pkgver.zip")
sha256sums=('a85ac098d5fd4e20d4ee4b1a419e7da2418e50467539b4aec4e34a1497171630'
            'b25ae9e44d68756e8124b60be28dccc308570f5576440989aa8fa0d639d2c8f2')

build() {
    # unpack release
    mkdir -p "$_extension-$pkgver"
    unzip -u -d "$_extension-$pkgver" "$_extension-$pkgver.zip"
    cd "$_extension-$pkgver"

    # create extension json
    _extver="$(jq -r '.version' manifest.json)"
    pubkey="$(openssl rsa -in "$srcdir/$_extension.pem" -pubout -outform DER |base64 -w0)"
    export _id="$(echo $pubkey |base64 -d |sha256sum |head -c32 |tr '0-9a-f' 'a-p')"
    echo "extenson id should be: $_id"
    cat << EOF > "$srcdir/$_id".json
{
    "external_crx": "/usr/lib/$pkgname/$_extension-$pkgver.crx",
    "external_version": "$_extver"
}
EOF

    # update manifest key
    jq --ascii-output --arg key "$pubkey" '. + {key: $key}' manifest.json > manifest.json.new
    mv manifest.json.new manifest.json

    # pack extension
    cd "$srcdir"
    tmpdir="$(mktemp -d chromium-pack-XXXXXX)"
    chromium --user-data-dir="$tmpdir" --pack-extension="$_extension-$pkgver" --pack-extension-key="$_extension.pem"
}

package() {
    install -Dm644 -t "$pkgdir/usr/share/chromium/extensions/" "$_id.json"
    install -Dm644 -t "$pkgdir/usr/lib/$pkgname/" "$_extension-$pkgver.crx"
}
