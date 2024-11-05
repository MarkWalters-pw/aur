# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Pieter Goetschalckx <3.14.e.ter@gmail.com>

pkgname=bazarr-beta
_pkgname=${pkgname/-beta}
pkgver=1.4.6_beta.16
pkgrel=1
pkgdesc="Subtitle management and download automation for Sonarr and Radarr."
arch=('any')
url="https://www.bazarr.media"
license=('GPL-3.0-or-later')
depends=(
  'bash'
  'ffmpeg'
  'gdk-pixbuf2'
  'python'
  'python-gevent'
  'python-gevent-websocket'
  'python-lxml'
  'python-numpy'
  'python-pillow'
  'python-webrtcvad'
  'sqlite'
  'unrar'
  'python-platformdirs'
  'python-ujson'
  'python-greenlet'
  'python-setuptools'
  'python-tomli'
)
makedepends=('unzip')
provides=('bazarr')
conflicts=('bazarr')
options=('!debug')
source=(
  "${pkgname}-${pkgver//_/-}.zip::https://github.com/morpheus65535/bazarr/releases/download/v${pkgver//_/-}/bazarr.zip"
  'bazarr.service'
  'bazarr.sysusers'
  'bazarr.install'
  'bazarr.tmpfiles'
)
noextract=("${pkgname}-${pkgver//_/-}.zip")
sha256sums=('ad989f613650f90a49b92955b270e8ea8f2298b248641dab76b17bb7c2cdfd44'
            '2782e250117f7a85110d62472b834316fadcf32ca1874ad01541e7dd9a54215c'
            '73a60121fd2b7b8f5bad75ec4b0f92552fcae0e29a4b9e6aaf15f86a825a88a3'
            '573beeac951d427e980332ce4d8645ae2299082e6c9c04f96e2a41a98c3acc60'
            'e7055260d0f3554e8b628d9560d8e12a40f720d76542048df0dfc838db88357b')

prepare() {
  unzip -qq -o -d "${pkgname}-${pkgver//_/-}" "${pkgname}-${pkgver//_/-}.zip"
}

package() {
  local _pyver="$(python -c 'import sys; print("%i.%i" % sys.version_info[:2])')"
  local _pdir="${pkgdir}/usr/lib/python${_pyver}/site-packages/${_pkgname}"

  install -dm755 "${_pdir}"
  cp -dpr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver//_/-}/"* "${_pdir}"
  python -m compileall "${pkgdir}"

  install -Dm644 "${srcdir}/bazarr.service" "${pkgdir}/usr/lib/systemd/system/bazarr.service"
  install -Dm644 "${srcdir}/bazarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/bazarr.conf"
  install -Dm644 "${srcdir}/bazarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/bazarr.conf"
}
