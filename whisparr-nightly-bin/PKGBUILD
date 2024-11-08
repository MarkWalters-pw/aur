# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful URL: https://whisparr.servarr.com/v1/update/nightly?version=0.0.0.0&os=linux&runtime=netcore&arch=x64

pkgname=whisparr-nightly-bin
pkgver=2.0.0.548
pkgrel=2
pkgdesc='Adult movie organizer/manager for usenet and torrent users (nightly builds)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://whisparr.com'
license=('GPL-3.0-or-later')
groups=('servarr-nightly-bin')
depends=(
  'gcc-libs'
  'glibc'
  'zlib'
  'sqlite'
  'ffmpeg'
)
optdepends=(
  'postgresql: postgresql database'
  'sabnzbd: usenet downloader'
  'nzbget: usenet downloader'
  'qbittorrent: torrent downloader'
  'deluge: torrent downloader'
  'rtorrent: torrent downloader'
  'nodejs-flood: torrent downloader'
  'vuze: torrent downloader'
  'aria2: torrent downloader'
  'transmission-cli: torrent downloader (CLI and daemon)'
  'transmission-gtk: torrent downloader (GTK+)'
  'transmission-qt: torrent downloader (Qt)'
  'jackett: torrent indexer proxy'
  'nzbhydra2: torznab and usenet indexer proxy'
  'prowlarr: torrent and usenet indexer proxy'
  'autobrr: irc, torrent and usenet indexer proxy'
)
provides=(whisparr)
conflicts=(whisparr)
options=(!debug)
source=(
  'whisparr.service'
  'whisparr.tmpfiles'
  'whisparr.sysusers'
  'package_info'
)
source_x86_64=("Whisparr.nightly.${pkgver}.linux-core-x64.tar.gz::https://whisparr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64")
source_aarch64=("Whisparr.nightly.${pkgver}.linux-core-arm64.tar.gz::https://whisparr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64")
source_armv7h=("Whisparr.nightly.${pkgver}.linux-core-arm.tar.gz::https://whisparr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")
sha256sums=('e700c5398ca63a053963bb6969988cf489a72cc9507a2b11ff0f90e9e2615f31'
            '4ad46e1c00e60b96cf3df222d996eb24ff96fad4999442d3d3c5e5248c7d7530'
            'd9ea6c40d38602ec0ee25f44f3cec462aba03bc12455e166f79666abeb062338'
            '50da66b86fb42b6457a84c61fe02af5845599fd67f538c79457713795d96d8ed')
sha256sums_x86_64=('9982c3431012e9657c096cc6d604a33e5dfb489695a0b576d4c7a1d5c464e39c')
sha256sums_aarch64=('b348f7658a92d1fa7cc8bc4f5cfdb906f2f32eded48ac97673ef78b1a31610cc')
sha256sums_armv7h=('02af6f5c891839d7dbb23a9dfde88b24fc512ebd303f872b96de405b30038cc0')

package() {
  install -dm755 "${pkgdir}/usr/lib/whisparr/bin"

  # License
  install -Dm644 "${srcdir}/Whisparr/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
  rm "${srcdir}/Whisparr/LICENSE"

  # Remove ffprobe, Service Helpers, and Update files
  rm "${srcdir}/Whisparr/ffprobe"
  rm "${srcdir}/Whisparr/ServiceInstall"*
  rm "${srcdir}/Whisparr/ServiceUninstall"*
  rm -rf "${srcdir}/Whisparr/Whisparr.Update"

  # Use system ffprobe
  ln -s /usr/bin/ffprobe "${pkgdir}/usr/lib/whisparr/bin/ffprobe"

  # Disable built in updater.
  install -Dm644 "${srcdir}/package_info" "${pkgdir}/usr/lib/whisparr"
  echo "PackageVersion=${pkgver}-${pkgrel}" >> "${pkgdir}/usr/lib/whisparr/package_info"

  cp -dpr --no-preserve=ownership "${srcdir}/Whisparr/"* "${pkgdir}/usr/lib/whisparr/bin"

  install -Dm644 "${srcdir}/whisparr.service" "${pkgdir}/usr/lib/systemd/system/whisparr.service"
  install -Dm644 "${srcdir}/whisparr.sysusers" "${pkgdir}/usr/lib/sysusers.d/whisparr.conf"
  install -Dm644 "${srcdir}/whisparr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/whisparr.conf"
}
