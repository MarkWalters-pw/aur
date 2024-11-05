# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Donald Webster <fryfrog@gmail.com>
# Helpful url: https://prowlarr.servarr.com/v1/update/nightly?version=0.0.0.0&os=linux&runtime=netcore&arch=x64

pkgname=prowlarr-nightly-bin
pkgver=1.26.1.4837
pkgrel=1
pkgdesc='Indexer manager/proxy for usenet and torrent users (nightly builds)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://prowlarr.com'
license=('GPL-3.0-or-later')
groups=('servarr-nightly-bin')
depends=(
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
  'sonarr: automatically integrates with and syncs indexers'
  'radarr: automatically integrates with and syncs indexers'
  'lidarr: automatically integrates with and syncs indexers'
  'readarr: automatically integrates with and syncs indexers'
  'whisparr: automatically integrates with and syncs indexers'
)
provides=(prowlarr)
conflicts=(prowlarr)
options=(!debug)
source=(
  'prowlarr.service'
  'prowlarr.tmpfiles'
  'prowlarr.sysusers'
  'package_info'
)
source_x86_64=("Prowlarr.nightly.${pkgver}.linux-core-x64.tar.gz::https://prowlarr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64")
source_aarch64=("Prowlarr.nightly.${pkgver}.linux-core-arm64.tar.gz::https://prowlarr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64")
source_armv7h=("Prowlarr.nightly.${pkgver}.linux-core-arm.tar.gz::https://prowlarr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")
sha256sums=('21ca63506b3cffcca8dcd95e1bdf3fa8415f1bc134c31a153b51b573dc31d390'
            '4c3f9b5fa71810697efbe60f20a2cba24fd1b997d5372c3726457b197d61ccb5'
            '08d51099f09721b173233e58172c486025c16034dd89e73ccb42b647dcc34c4b'
            '5cb90253a2c8c42a98ad8b7573d6905ad478b877dffbe50b9f7667f28cdbd806')
sha256sums_x86_64=('961cca049c8e33de5f12fef65dc48a2d837d70c1f0be7b031174955d1abd564b')
sha256sums_aarch64=('21ab3e4f0372130c9d5236cf26f755f9016fd9b93eded43eeb95e0c521ed52db')
sha256sums_armv7h=('2b32e7fe50a0b517c9dfe8bfef39befff34fa7ef5f2a02952b19b801df4b5f3e')

package() {
  install -dm755 "${pkgdir}/usr/lib/prowlarr/bin"

  # License
  install -Dm644 "${srcdir}/Prowlarr/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
  rm "${srcdir}/Prowlarr/LICENSE"

  # Remove Service Helpers, and Update files
  rm "${srcdir}/Prowlarr/ServiceInstall"*
  rm "${srcdir}/Prowlarr/ServiceUninstall"*
  rm -rf "${srcdir}/Prowlarr/Prowlarr.Update"

  # Disable built in updater.
  install -Dm644 "${srcdir}/package_info" "${pkgdir}/usr/lib/prowlarr"
  echo "PackageVersion=${pkgver}-${pkgrel}" >> "${pkgdir}/usr/lib/prowlarr/package_info"

  cp -dpr --no-preserve=ownership "${srcdir}/Prowlarr/"* "${pkgdir}/usr/lib/prowlarr/bin"

  install -Dm644 "${srcdir}/prowlarr.service" "${pkgdir}/usr/lib/systemd/system/prowlarr.service"
  install -Dm644 "${srcdir}/prowlarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/prowlarr.conf"
  install -Dm644 "${srcdir}/prowlarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/prowlarr.conf"
}
