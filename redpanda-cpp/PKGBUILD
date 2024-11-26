_pkgname=RedPanda-CPP
pkgname=${_pkgname,,}
pkgver=3.1
pkgrel=1
pkgdesc='A fast, lightweight, open source, and cross platform C/C++/GNU Assembly IDE'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64' 'riscv64')
url="https://github.com/royqh1979/$_pkgname"
license=('GPL3')
depends=(qt5-base qt5-svg gcc gdb astyle)
makedepends=(qt5-tools imagemagick librsvg)
optdepends=(
    'clang: C/C++ compiler (alternative)'
)
optdepends_x86_64=(
    'mingw-w64-gcc: Windows C/C++ compiler'
    'wine: run Windows executable'
    'aarch64-linux-gnu-gcc: AArch64 C/C++ compiler'
    'qemu-user-static: run AArch64 executable'
    'qemu-user-static-binfmt: run AArch64 executable'
)
source=(
    "$_pkgname-$pkgver.tar.gz::https://github.com/royqh1979/$_pkgname/archive/refs/tags/v$pkgver.tar.gz"
    'compiler_hint.lua'
)
sha256sums=('96a3c5883de50ed42dc0000b654050c1043da411d85c48877e63ffc71382093a'
            '207f409d93100575e1d01842475880f6a78f095680246d98e61e72d272671448')

prepare() {
    sed -i '/CONFIG += ENABLE_LUA_ADDON/ { s/^#\s*// }' "$srcdir/$_pkgname-$pkgver/RedPandaIDE/RedPandaIDE.pro"
}

build() {
    mkdir redpanda-build
    cd redpanda-build
    qmake \
        PREFIX='/usr' \
        LIBEXECDIR='/usr/lib' \
        "$srcdir/$_pkgname-$pkgver/Red_Panda_CPP.pro"
    make
}

package() {
    local _libexecdir="$pkgdir/usr/lib/RedPandaCPP"
    install -Dm644 "compiler_hint.lua" "$_libexecdir/compiler_hint.lua"

    cd redpanda-build
    make INSTALL_ROOT="$pkgdir" install

    for size in 16 22 24 32 36 48 64 72 96 128 192 256 512; do
        mkdir -p "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        magick convert \
            -background none \
            "$pkgdir/usr/share/icons/hicolor/scalable/apps/redpandaide.svg" \
            -resize ${size}x${size} \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/redpandaide.png"
    done
}
