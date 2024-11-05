# Maintainer: Fredy García (frealgagu@gmail.com)
# Contributor: Pedro Gabriel (pedrogabriel@dcc.ufmg.br)
# Contributor: cookiengineer

pkgname=m64py
pkgver=0.3.0
pkgrel=1
pkgdesc="A Qt5 front-end (GUI) for Mupen64Plus, a cross-platform plugin-based Nintendo 64 emulator"
arch=("any")
url="https://github.com/mupen64plus/mupen64plus-ui-python"
license=("GPL")
depends=("desktop-file-utils" "libxkbcommon-x11" "mupen64plus" "python-pyqt6-webengine" "python-pysdl2" "qt6-tools")
makedepends=("python-build" "python-distribute" "python-installer" "python-setuptools" "python-setuptools-scm" "python-wheel")
source=(
  "https://github.com/mupen64plus/mupen64plus-ui-python/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=(
  "ac81a1b40e2812ac9e27405285e4e0c2b6bddfb32fde28c88300c10112a02f92"
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export PATH="/usr/lib/qt6:/usr/lib/qt6/bin:${PATH}"
  python -m build --wheel --no-isolation --verbose
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export PATH="${PATH}:/usr/lib/qt6/:/usr/lib/qt6/bin/"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
