# Maintainer: 7Ji <pugokughin@gmail.com>

_pkgbase=ampack
_srcname="${_pkgbase}"
pkgname=${_pkgbase}-git
pkgver=0.1.0.r2.4ce9a91
pkgrel=1
pkgdesc="A tool to unpack / (re)pack AMLogic burning images "
arch=('x86_64' 'aarch64')
url="https://github.com/7Ji/${_srcname}"
license=('AGPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}=${pkgver}")
source=(
  "${_srcname}::git+https://github.com/7Ji/${_pkgbase}.git"
)
sha256sums=(
  'SKIP'
)
prepare() {
  cd "${_srcname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  printf "%s" "$(git --git-dir "${_srcname}/.git" describe --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${_srcname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  install -Dm755 "${_srcname}/target/release/${_pkgbase}" -t "${pkgdir}"/usr/bin/
}
