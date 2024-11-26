# Maintainer: maple
pkgname=wl-clip-persist-git
pkgver=0.4.0.r0.g5b1ba6f
pkgrel=1
pkgdesc="Keep Wayland clipboard even after programs close"
arch=('any')
url="https://github.com/Linus789/wl-clip-persist"
license=('MIT')
provides=('wl-clip-persist')
conflicts=('wl-clip-persist')
makedepends=('git' 'cargo')
source=("$pkgname::git+https://github.com/Linus789/wl-clip-persist.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="--remap-path-prefix=$HOME=/home --remap-path-prefix=$PWD=/src"
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/wl-clip-persist" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/wl-clip-persist"
}
