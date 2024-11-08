# Maintainer: neeshy <neeshy@tfwno.gf>
# Contributor: Evan Chen <evan@evanchen.cc>
# Contributor: éclairevoyant
# Contributor: Devin J dot  Pohly <djpohly+arch at gmail dot com>
# Contributor: Martin Kröning <m dot kroening at hotmail dot de>
# Contributor: sl1pkn07
# Contributor: Ryan Peters <sloshy45 at sbcglobal dot net>
# Contributor: Artefact2 <artefact2 at gmail dot com>
# Contributor: Lauri Niskanen <ape at ape3000 dot com>
# Contributor: Travis Nickles <ryoohki7 at yahoo dot com>
# Contributor: Stefan Lohmaier <noneuss at gmail dot com>
# Contributor: Dan Guzek <dguzek at gmail dot com>
_pkgname=stepmania
pkgname="$_pkgname-git"
pkgver=latest
pkgrel=4
pkgdesc="Advanced rhythm game. Designed for both home and arcade use."
arch=(x86_64)
url="http://www.stepmania.com/"
license=('MIT AND CC-BY-NC-4.0')
depends=('mesa' 'glew' 'glu' 'udev' 'libx11' 'libxext' 'libxtst' 'libxinerama' 'libxrandr'
         'alsa-lib' 'libpulse' 'ffmpeg' 'libmad' 'libogg' 'libvorbis' 'libjpeg' 'libpng'
         'gtk3' 'libtommath' 'libtomcrypt' 'jsoncpp' 'pcre' 'zlib')
makedepends=('cmake')
provides=('stepmania')
conflicts=('stepmania')
source=("git+https://github.com/stepmania/stepmania.git"
        "https://github.com/stepmania/stepmania/commit/3fef5ef60b7674d6431f4e1e4ba8c69b0c21c023.patch"
        "ffmpeg-7.patch"
        "ffmpeg-remove-asm-requirement.patch")
sha256sums=('SKIP'
            'fe3c77293d65b654c91d419ba7421feb2ad2da8e4561fadc5f02b3bd0f791634'
            'f6406a9daa61f53a530402965cfc9533f9836d558026b0fc5627db05f8cde068'
            'ae8d9911eaf7680d7f05a5bafa98588a1582f9b7713a295a66603a2ca8b5addf')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -Np1 -i "$srcdir/3fef5ef60b7674d6431f4e1e4ba8c69b0c21c023.patch"
  patch -Np1 -i "$srcdir/ffmpeg-7.patch"
  patch -Np1 -i "$srcdir/ffmpeg-remove-asm-requirement.patch"
}

build() {
  cd "$srcdir/$_pkgname/Build"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/opt \
    -DWITH_FULL_RELEASE=YES \
    -DWITH_PORTABLE_TOMCRYPT=NO \
    -DWITH_SYSTEM_FFMPEG=YES \
    -DWITH_SYSTEM_MAD=YES \
    -DWITH_SYSTEM_OGG=YES \
    -DWITH_SYSTEM_JPEG=YES \
    -DWITH_SYSTEM_PNG=YES \
    -DWITH_SYSTEM_GLEW=YES \
    -DWITH_SYSTEM_TOMMATH=YES \
    -DWITH_SYSTEM_TOMCRYPT=YES \
    -DWITH_SYSTEM_JSONCPP=YES \
    -DWITH_SYSTEM_PCRE=YES \
    -DWITH_SYSTEM_ZLIB=YES \
    -Wno-dev \
    ..
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make -C Build DESTDIR="$pkgdir" install

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/stepmania-5.1/stepmania "$pkgdir/usr/bin/stepmania"
  install -Dm644 stepmania.desktop "$pkgdir/usr/share/applications/stepmania.desktop"

  install -Dm644 Docs/Licenses.txt "$pkgdir/usr/share/licenses/$pkgname/Licenses.txt"
  cp -a icons "$pkgdir/usr/share"
}
