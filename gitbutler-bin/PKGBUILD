# Maintainer: Daniel Bowring <aur@daniel.bowring.email>
pkgname=gitbutler-bin
pkgver=0.13.8
pkgrel=1
_pkgvernum=1417
pkgdesc="Version control client, backed by Git, powered by Tauri/Rust/Svelte "
arch=('x86_64')
url="https://gitbutler.com/"
depends=('libayatana-appindicator' 'webkit2gtk' 'gtk3')
license=('FSL-1.0-MIT')
source=("https://releases.gitbutler.com/releases/release/${pkgver}-${_pkgvernum}/linux/$CARCH/git-butler_${pkgver}_amd64.deb")
sha256sums=('59b29ac5b8a13580622e28803d5c679b786c5d341a0b25d77fc74e5cfe23c1de')

package() {
	bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}

