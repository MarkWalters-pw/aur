# Maintainer: AltoXorg

pkgname=pigment64
pkgver=0.4.5
pkgrel=1
pkgdesc="A library for handling conversion between N64 texture formats and modern image formats"
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/decompals/pigment64"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/decompals/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('a8ace1c5484df0a8406b93a65d2f0930d60ea988ea4007748923fca3e28c16e4d3a8d4abeba7feefce182ddbe96f1183d7fbdc0b417997698903491e3afc0811')

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"

  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE"
}
