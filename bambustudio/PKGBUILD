# Maintainer: envolution
# Contributor: Alexander Jacocks <alexander@redhat.com>

pkgname="bambustudio"
pkgver=01.10.00.81
pkgrel=1
pkgdesc="PC Software for BambuLab's 3D printers"
arch=('x86_64')
url="https://github.com/bambulab/BambuStudio"
license=('AGPLv3')
depends=('mesa' 'glu' 'cairo' 'gtk3' 'libsoup' 'webkit2gtk' 'gstreamer' 'openvdb' 'wayland' 'wayland-protocols' 'libxkbcommon' 'ttf-harmonyos-sans')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'm4' 'pkgconf')
source=(
  "https://github.com/bambulab/BambuStudio/archive/refs/tags/v${pkgver}.tar.gz"
  'OCCT.cmake.patch'
  'OpenCV.cmake.patch'
  'BambuStudio.desktop'
  )
sha256sums=('cbd2154b6d14683015183b11589c5ff0e953b6b86bdc5f6786dddf9fc172891d'
            '5912ed94d8647a7dc65d1d70d8e9b8e505300455c77e618eb749871385b29c3a'
            'af0cc5e071bb50d47aabdfeac1974f99a3e6380e1c5edb8a9537e2d22e0a929d'
            '23416806dbe9bba0f501270945e4296bb5843b12e57961af896bfb648ea28f26')
prepare() {
  cd "$srcdir/BambuStudio-${pkgver}"
  patch -p0 -i ../OCCT.cmake.patch # https://github.com/bambulab/BambuStudio/issues/4689
  patch -p0 -i ../OpenCV.cmake.patch # same as above
}

build() {
  cd "$srcdir/BambuStudio-${pkgver}"
  echo -e "FOUND_GTK3=true\nFOUND_GTK3_DEV=true\n" > linux.d/arch
  ./BuildLinux.sh -rd
  ./BuildLinux.sh -rs
}

package() {
  install -vDm644 BambuStudio.desktop "$pkgdir/usr/share/applications/BambuStudio.desktop"
  cd "$srcdir/BambuStudio-${pkgver}"
  install -dm755 "$pkgdir/opt/${pkgname}/resources"
  find resources/ -type d -exec install -dm755 "$pkgdir/opt/${pkgname}/{}" \;
  find resources/ -type f -exec install -Dm644 "{}" "$pkgdir/opt/${pkgname}/{}" \;
  install -vDm755 "build/src/bambu-studio" "$pkgdir/opt/${pkgname}/bin/bambu-studio" 
  install -vDm644 "resources/images/BambuStudio_192px.png" "$pkgdir/usr/share/icons/hicolor/192x192/apps/BambuStudio.png"
}
