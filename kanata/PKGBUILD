# Maintainer: fenuks

pkgname=kanata
pkgver=1.6.1
pkgrel=2
pkgdesc="Bring the customizability of a QMK board to any keyboard near you"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/jtroo/kanata"
license=("LGPL-3.0")
depends=(libevdev)
optdepends=()
makedepends=(cargo)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        'kanata.service'
        'cargo.lock.patch'
)
sha256sums=('c0e047197af23cf434adf20e21a871b7b12c876b58ac75852d662c004bf49f2c'
            '02f657a0d3e6c2621d74282b192c45bbfba868a26c35fe0f351cb77c3c666e55'
            '0e20c9f168d165ff76785e7c2560f6359ebfae1e480d4e6be4c70e79400fe61b'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  patch -i "${srcdir}/cargo.lock.patch"
  cargo fetch --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname}"
  install -Dm0644 -t "$pkgdir/usr/lib/systemd/system/" "${srcdir}/kanata.service"
}
