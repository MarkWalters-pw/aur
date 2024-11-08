# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=dnglab
pkgver=0.6.1
pkgrel=2
pkgdesc="Camera RAW to DNG file format converter"
arch=(x86_64)
url=https://github.com/dnglab/dnglab
license=(LGPL-2.1-only)
depends=(gcc-libs)
makedepends=(cargo)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('576e818a0d857d7e2101a6b4f57db17ca67d51c83feaa7c36d8af7f645782caf')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

check() {
  cd $pkgname-$pkgver
  cargo test --all --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 target/release/dnglab "$pkgdir/usr/bin/dnglab"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" *.md
  install -Dm0644 -t "$pkgdir/usr/share/man/man1/" bin/dnglab/manpages/*.1

  install -Dm0644 bin/dnglab/completions/dnglab.bash \
    "$pkgdir/usr/share/bash-completion/completions/dnglab"
  install -Dm0644 bin/dnglab/completions/dnglab.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/dnglab.fish"
  install -Dm0644 bin/dnglab/completions/_dnglab \
    "$pkgdir/usr/share/zsh/site_functions/_dnglab"
}

# vim: set ts=2 sw=2 et:
