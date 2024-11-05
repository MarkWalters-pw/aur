# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Donald Webster <fryfrog@gmail.com>
# Helpful URL: https://services.lidarr.audio/v1/update/nightly?version=0.0.0.0&os=linux&runtime=netcore&arch=x64

pkgname=lidarr-nightly-bin
pkgver=2.8.1.4442
pkgrel=1
pkgdesc='Music collection manager for newsgroup and torrent users (nightly builds)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://lidarr.audio'
license=('GPL-3.0-or-later')
groups=('servarr-nightly-bin')
depends=(
  'chromaprint'
  'gcc-libs'
  'glibc'
  'zlib'
  'sqlite'
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
provides=(lidarr)
conflicts=(lidarr)
options=(!debug)
source=(
  'lidarr.service'
  'lidarr.tmpfiles'
  'lidarr.sysusers'
  'package_info'
)
source_x86_64=("Lidarr.nightly.${pkgver}.linux-core-x64.tar.gz::https://lidarr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64")
source_aarch64=("Lidarr.nightly.${pkgver}.linux-core-arm64.tar.gz::https://lidarr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64")
source_armv7h=("Lidarr.nightly.${pkgver}.linux-core-arm.tar.gz::https://lidarr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")
sha256sums=('dcbe3d2a3d64a78a4b2b84a3486991a8b90fdd6900d7345004827a168f8b5645'
            'abde8989e7ab9dc62b6a501644da5a9253953b6394b890565e00a69cbfd89068'
            '19b36aefd2ef93d4a630ceaefe582573ecdaa72ec21bfb48ce3941ead7b967fb'
            '90a1960fef0d3833cd3635cedd16af3ee9ae6c7b95babc3021f6031d4e44c200')
sha256sums_x86_64=('584842957f8cb36b15a0bd3cfd1b60bd6108804a552a18a37e6a0c75ede7a45e')
sha256sums_aarch64=('715df7a9995b4a77fa10d8426673d6b0ab4e41d77d315fbf7cbce98a2daf8f61')
sha256sums_armv7h=('a3bd6de5ccba29fac165461fb266b189b58ae318405aa81a9ecd299b285454a2')

package() {
  install -dm755 "${pkgdir}/usr/lib/lidarr/bin"

  # License
  install -Dm644 "${srcdir}/Lidarr/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}"
  rm "${srcdir}/Lidarr/LICENSE.md"

  # Remove fpcalc, Service Helpers, and Update files
  rm "${srcdir}/Lidarr/fpcalc"
  rm "${srcdir}/Lidarr/ServiceInstall"*
  rm "${srcdir}/Lidarr/ServiceUninstall"*
  rm -rf "${srcdir}/Lidarr/Lidarr.Update"

  # Disable built in updater.
  install -Dm644 "${srcdir}/package_info" "${pkgdir}/usr/lib/lidarr"
  echo "PackageVersion=${pkgver}-${pkgrel}" >> "${pkgdir}/usr/lib/lidarr/package_info"

  cp -dpr --no-preserve=ownership "${srcdir}/Lidarr/"* "${pkgdir}/usr/lib/lidarr/bin"

  install -Dm644 "${srcdir}/lidarr.service" "${pkgdir}/usr/lib/systemd/system/lidarr.service"
  install -Dm644 "${srcdir}/lidarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/lidarr.conf"
  install -Dm644 "${srcdir}/lidarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/lidarr.conf"
}
