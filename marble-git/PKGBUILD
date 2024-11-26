# Merged with official ABS marble PKGBUILD by João, 2024/03/30 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=marble-git
pkgname=(marble-git
         marble-common-git
         marble-maps-git
         marble-qt-git)
pkgver=24.04.70_r13851.gab23c211a
pkgrel=2
pkgdesc='Desktop Globe'
arch=($CARCH)
url="https://github.com/KDE/${pkgbase%-git}"
license=(GPL-2.0-or-later)
makedepends=(git extra-cmake-modules-git gpsd kdoctools5 knewstuff5 kparts5 krunner5 libwlocate phonon-qt5-git protobuf qt5-serialport qt5-tools qt5-webengine shapelib kirigami2-git)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgbase%-git}
  _major_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MAJOR' CMakeLists.txt | cut -d '"' -f2)"
  _minor_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MINOR' CMakeLists.txt | cut -d '"' -f2)"
  _micro_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MICRO' CMakeLists.txt | cut -d '"' -f2)"
  echo "${_major_ver}.${_minor_ver}.${_micro_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgbase%-git} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_CXX_STANDARD=17 \
    -DQT_PLUGINS_DIR=lib/qt/plugins \
    -DBUILD_TESTING=OFF \
    -DBUILD_TOUCH=ON \
    -DBUILD_MARBLE_EXAMPLES=OFF \
    -DBUILD_MARBLE_TESTS=OFF \
    -DMOBILE=OFF
  cmake --build build
}

package_marble-common-git() {
  pkgdesc='Common libraries and plugins for Marble'
  conflicts=(marble-common)
  provides=(marble-common)
  depends=(gcc-libs
           glibc
           phonon-qt5-git
           protobuf
           qt5-base
           qt5-declarative
           qt5-location
           qt5-svg
           qt5-webchannel
           qt5-webengine
           zlib)
  optdepends=('gpsd: GPS based geolocation'
              'libwlocate: WLAN based geolocation'
              'qt5-serialport: APRS plugin'
              'shapelib: SHP plugin')

  DESTDIR="$pkgdir" cmake --install build
  rm -r "$pkgdir"/usr/share/{config.kcfg,kxmlgui5,metainfo,plasma} \
        "$pkgdir"/usr/bin \
        "$pkgdir"/usr/lib/qt/{qml,plugins/*.so,plugins/kf5} \
        "$pkgdir"/usr/share/applications/{marble_geo.desktop,marble_worldwind.desktop,org.kde.marble*.desktop} \
        "$pkgdir"/usr/share/kservices5/{plasma-*,marble_part.desktop} \
        "$pkgdir"/usr/share/locale/*/LC_MESSAGES/*.mo
}

package_marble-qt-git() {
  pkgdesc+=' (Qt version)'
  conflicts=(marble-qt)
  provides=(marble-qt)
  depends=(gcc-libs
           glibc
           marble-common-git
           qt5-base)

  DESTDIR="$pkgdir" cmake --install build/src/apps/marble-qt
}

package_marble-git() {
  depends=(gcc-libs
           glibc
           kconfig5
           kconfigwidgets5
           kcoreaddons5
           kcrash5
           ki18n5
           kio5
           kparts5
           kwidgetsaddons5
           kxmlgui5
           marble-common-git
           qt5-base
           qt5-declarative)
  conflicts=(marble)
  provides=(marble)
  optdepends=('krunner5: Krunner plugin')
  groups=(kde-applications-git
          kde-education-git)

  DESTDIR="$pkgdir" cmake --install build/src/apps/marble-kde
  DESTDIR="$pkgdir" cmake --install build/src/plasma
  DESTDIR="$pkgdir" cmake --install build/src/plasmarunner
  DESTDIR="$pkgdir" cmake --install build/src/thumbnailer
  rm -r "$pkgdir"/usr/share/{icons,doc}
}

package_marble-maps-git() {
  pkgdesc='OpenStreetMap Navigation'
  conflicts=(marble-maps)
  provides=(marble-maps)
  depends=(gcc-libs
           glibc
           kirigami2-git
           marble-common-git
           qt5-base
           qt5-declarative)

  DESTDIR="$pkgdir" cmake --install build/src/apps/marble-maps
}
