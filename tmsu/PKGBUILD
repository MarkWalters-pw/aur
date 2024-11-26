# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Tomáš Mládek <tmladek{at}inventati{dt}org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=tmsu
pkgver=0.7.5
pkgrel=2
pkgdesc="A tool for tagging your files and accessing them through a virtual filesystem."
arch=('i686' 'x86_64')
url="https://tmsu.org/"
depends=('fuse2' 'sqlite>=3')
makedepends=('go')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oniony/TMSU/archive/v$pkgver.tar.gz"
        0001-${pkgname}-structure.patch::https://github.com/oniony/TMSU/commit/0beb23187d14a48f217f8ede2981cb5eaf6d89f2.patch
        0002-${pkgname}-go-files.patch::https://github.com/oniony/TMSU/commit/66a9facdacb48e1f81bb8a854f70485e3a361e59.patch
        0003-${pkgname}-makefile.patch::https://github.com/oniony/TMSU/commit/b10338e9136e35cbbd9ac4ebcf7d366f3a1b4a9e.patch)
sha256sums=('0ac7f09336aaedf73623c4f486c05137c024a726c16dd32525463aee9d70b46a'
            'c6e19521d7ba204193701507c7267f0bdd1e413f128205c57c34af279212a502'
            '914404ff4ce9e1afdf4a420d44734d2e4caf760d120bba41f2722b6ff57218e0'
            '267f40a0379491bc10327a498daaf0b2bda3cb616efa484ec26f5601145126fd')

prepare() {
  cd "TMSU-$pkgver"

  # Add upstream patches as the latest release has a wrong project structure
  # and cannot be compiled with recent go versions
  patch -Np1 -i ${srcdir}/0001-${pkgname}-structure.patch
  patch -Np1 -i ${srcdir}/0002-${pkgname}-go-files.patch
  patch -Np1 -i ${srcdir}/0003-${pkgname}-makefile.patch
}

build() {
  export GOPATH=/tmp

  cd "$srcdir/TMSU-$pkgver"
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin" \
           "$pkgdir/usr/bin" \
           "$pkgdir/usr/share/man/man1" \
           "$pkgdir/usr/share/zsh/site-functions"

  cd "$srcdir/TMSU-$pkgver"
  make INSTALL_DIR="$pkgdir/usr/bin" \
  MOUNT_INSTALL_DIR="$pkgdir/usr/bin" \
  MAN_INSTALL_DIR="$pkgdir/usr/share/man/man1" \
  ZSH_COMP_INSTALL_DIR="$pkgdir/usr/share/zsh/site-functions" \
  install
}
