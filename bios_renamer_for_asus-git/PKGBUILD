# Maintainer: Jiri Pospisil <jiri@jpospisil.com>

pkgname='bios_renamer_for_asus-git'
pkgver=r36.04c12c2
pkgrel=1
pkgdesc="Cross-platform Rust implementation of Asus' BIOS renamer utility."
url='https://github.com/iAmSomeone2/bios_renamer_for_asus'
arch=('x86_64')
makedepends=('cargo' 'git')
provides=('bios_renamer_for_asus')
conflicts=('bios_renamer_for_asus')
license=('MIT')
source=("$pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$pkgname"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --release # --locked (there's no Cargo.lock in the repo)
}

package() {
  cd "$pkgname"

  install -Dm755 "target/release/bios_renamer_for_asus" "$pkgdir/usr/bin/bios_renamer_for_asus"
}
