# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=lunasea-bin
_pkgname="${pkgname%%-bin}"
pkgver=10.2.6
pkgrel=1
pkgdesc='A fully-featured open-source self-hosted controller focused on giving you a seamless experience between all of your self-hosted media software remotely on your devices'
arch=('x86_64')
url='https://www.lunasea.app'
license=('GPL-3.0-or-later')
depends=(
  'libepoxy'
  'harfbuzz'
  'fontconfig'
  'gtk3'
  'gcc-libs'
  'at-spi2-core'
  'gdk-pixbuf2'
  'pango'
  'glib2'
  'cairo'
  'glibc'
)
optdepends=(
  'sabnzbd: Usenet downloader'
  'nzbget: Usenet downloader'
  'sonarr: Smart PVR for newsgroup and torrent users'
  'radarr: Movie organizer/manager for usenet and torrent users'
  'lidarr: Music collection manager for newsgroup and torrent users'
  'overseerr: Request management and media discovery tool for the Plex ecosystem'
  'tautulli: A monitoring and tracking tool for Plex Media Server'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JagandeepBrar/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('82bf905e884d18ff4a29aedc1c964fbf8dde400455fb06c313079a68ba848830')

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/opt/${_pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  bsdtar -xf "${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/opt/${_pkgname}"
  ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
