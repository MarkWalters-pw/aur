# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname='chromium-extension-decentraleyes'
_id='ldpochfccmkkmhdbclfhpagapcfdljkj'
pkgver=2.0.19
pkgrel=1
pkgdesc="Local emulation of Content Delivery Networks"
license=('MPL2')
arch=('any')
url="https://git.synz.io/Synzvato/decentraleyes"
depends=('chromium')
source=("$pkgname-$pkgver.crx::https://git.synz.io/Synzvato/decentraleyes/uploads/735ff91100f39b2e6b222ad4b9fc453a/Decentraleyes.v$pkgver-chromium.crx")
noextract=("$pkgname-$pkgver.crx")
sha256sums=('9f54afc797b5934d91c0c4d649387f7fd5bc4abe028ee80ba19edf92e943ce1e')

build() {
    echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > "$_id".json
}

package() {
    install -Dm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    install -Dm644 "$_id".json "$pkgdir/usr/share/chromium/extensions/"$_id".json"
}
