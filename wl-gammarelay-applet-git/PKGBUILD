_pkgname=wl-gammarelay-applet
pkgname=${_pkgname}-git
pkgver=r16.9b06dec
pkgrel=1
pkgdesc="Control wl-gammarelay-rs via applet"
arch=(any)
url=https://github.com/junelva/wl-gammarelay-applet
license=(MIT)
makedepends=(cargo sed git)
conflicts=(${_pkgname})
source=(
  "git+$url.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd ${srcdir}/${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd ${srcdir}/${_pkgname}
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd ${srcdir}/${_pkgname}
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS=-Awarnings       # Suppress warnings, as build generates a lot of then and they are not relevant to end user
  cargo build --frozen --release --all-features
}

package() {
  cd ${srcdir}/${_pkgname}
  install -Dm0755 -t "$pkgdir/usr/bin/" target/release/${_pkgname}
}