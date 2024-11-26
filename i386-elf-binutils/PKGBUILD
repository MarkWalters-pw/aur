# Maintainer: Dani Rodríguez <dani@danirod.es>
# Contributor: c0repwn3r <core@coredoes.dev>
pkgname=i386-elf-binutils
pkgver=2.42
pkgrel=2
epoch=
pkgdesc="GNU binutils for the i386- toolchain"
arch=(x86_64)
url="https://www.gnu.org/software/binutils"
license=('GPL')
groups=(i386-elf-toolchain)
makedepends=(gcc)
depends=(xz)
source=("http://ftpmirror.gnu.org/binutils/binutils-$pkgver.tar.xz")
sha256sums=(f6e4d41fd5fc778b06b7891457b3620da5ecea1006c6a4a41ae998109f85a800)

build() {
    # Create temporary build dir
    mkdir -p "i386-binutils-$pkgver-build"
    cd "i386-binutils-$pkgver-build"

    # Configure, we are building in seperate directory to cleanly seperate the binaries from the source
    ../binutils-$pkgver/configure --prefix=/usr --target=i386-elf --disable-nls --disable-werror --disable-multilib --enable-interwork

    # Build
    make
}

check() {
    cd "i386-binutils-$pkgver-build"

    # unset LDFLAGS as testsuite makes assumptions about which ones are active
    # ignore failures in gold testsuite...
    make -k LDFLAGS="" check || true
}

package() {
    cd "i386-binutils-$pkgver-build"
    make install DESTDIR=$pkgdir
    # Remove conflicting files
    rm -rf $pkgdir/usr/share/info
    rm -rf $pkgdir/usr/lib/bfd-plugins
}
