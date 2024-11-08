# Maintainer: Arnau Abella <arnau.abella@monadplus.pro>

pkgname=elgato-keylight
pkgver=0.5.0
pkgrel=1
pkgdesc="An Elgato Key Light Controller GUI"
arch=('x86_64')
url="https://github.com/monadplus/elgato-keylight"
license=('MIT')
depends=('gcc-libs' 'pango' 'cairo' 'glib2' 'glibc' 'openssl' 'avahi' 'gtk3' 'gdk-pixbuf2' 'xdotool' 'libappindicator-gtk3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('093d54aabc9cf793573b5887d16a48d4f1b748c19eaa63770f340c764227dce8e291e97c34c0e6ce959b1e100afbfbb9f4999aba9f0d14427cb5667cf04aa0e3')

prepare() {
  cd "$pkgname-$pkgver" || exit 1
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver" || exit 1
  CFLAGS+=' -ffat-lto-objects' # hidden symbol `ring_core_0_17_8_OPENSSL_ia32cap_P' isn't define
  local _features="--features=tray-icon"
  cargo build --release --frozen --bin=$pkgname $_features
}

check() {
  cd "$pkgname-$pkgver" || exit 1
  # cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver" || exit 1
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
