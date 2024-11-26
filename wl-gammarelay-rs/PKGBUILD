# Maintainer: Bryan Malyn <bim9262 at gmail dot com>

pkgname=wl-gammarelay-rs
pkgver=0.4.1
pkgrel=1
pkgdesc="A simple program that provides DBus interface to control display temperature and brightness under wayland without flickering"
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/MaxVerevkin/wl-gammarelay-rs"
license=('GPL-3.0-only')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('42eec83de003c5f8c9c6c5abce3f0eadb80f5abb027d266bcc77183ecce14edc')
sha512sums=('de652cc3908f7386f0c96c6a8c1dd4d4ab6a7f7ef5c99af9456729c5e1cad3e70ff7344804046b9f1bf6a37adb56dad3a50851183934de97dd10b1cdf08cb4c5')
b2sums=('2dee927537a6117d0b6693e08bd39070f2b8a092acc2e1425497dd19db12e6fbdfd8cfea8ea0f3d80ccd794574faa0eabc3860cf290c140bbc9e8ee686b4ee08')

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
