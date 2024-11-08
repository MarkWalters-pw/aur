# Maintainer: Vladyslav Aviedov <aur at vladaviedov dot org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Christian Heusel <gromit@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_orig_pkgname=devtools
pkgname=devtools-doas
epoch=1
pkgver=1.2.1
pkgrel=1
pkgdesc='Tools for Arch Linux package maintainers (patched for opendoas)'
arch=('any')
license=('GPL-3.0-or-later')
url='https://gitlab.archlinux.org/archlinux/devtools'
depends=(
  arch-install-scripts
  awk
  bash
  binutils
  coreutils
  curl
  diffutils
  expac
  fakeroot
  findutils
  grep
  jq
  openssh
  parallel
  rsync
  sed
  util-linux

  breezy
  git
  mercurial
  subversion

  opendoas
)
makedepends=(
  asciidoctor
  shellcheck
)
checkdepends=(
  bats
)
provides=('devtools')
conflicts=('devtools')
optdepends=(
  'btrfs-progs: btrfs support'
  'bat: pretty printing for pkgctl search'
  'nvchecker: pkgctl version subcommand'
)
replaces=(devtools-git-poc)
source=(
  https://gitlab.archlinux.org/archlinux/devtools/-/releases/v${pkgver}/downloads/devtools-${pkgver}.tar.gz{,.sig}
  doas.patch
)
# Import a key from the main devtools package
# https://gitlab.archlinux.org/archlinux/packaging/packages/devtools/-/tree/main/keys/pgp
validpgpkeys=(
  'E240B57E2C4630BA768E2F26FC1B547C8D8172C8' # Levente Polyak <anthraxx@archlinux.org>
  'F00B96D15228013FFC9C9D0393B11DAA4C197E3D' # Christian Heusel (gromit packager key) <gromit@archlinux.org>
)
sha256sums=('a484d13823c8eb5246ad97325f60c9fcddaacb698d685793c018272eeb440f25'
            'SKIP'
            'SKIP')
b2sums=('8a864388619c40b8093b1af184aa157c1fc12ae1788f7d2b38f7b9f36d2fabbe0f2afdf1e300ca4d760fe4c8e9de5305d9bde4b5d3825f19c3845b13ef5f6f63'
        'SKIP'
        'SKIP')
install=devtools.install

build() {
  mv ${_orig_pkgname}-${pkgver} ${pkgname}-${pkgver}
  cd ${pkgname}-${pkgver}
  patch -Np1 -i ../doas.patch
  make BUILDTOOLVER="${epoch}:${pkgver}-${pkgrel}-${arch}" PREFIX=/usr
}

check() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr test
}

package() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
