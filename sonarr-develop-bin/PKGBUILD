# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Justin Dray <justin@dray.be>
# Helpful URL: https://services.sonarr.tv/v1/releases

pkgname=sonarr-develop-bin
pkgver=4.0.10.2624
pkgrel=1
pkgdesc='Smart PVR for newsgroup and torrent users (develop branch)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://sonarr.tv'
license=('GPL-3.0-or-later')
groups=('servarr-develop-bin')
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
provides=(sonarr)
conflicts=(sonarr)
options=(!debug)
source=(
  'package_info'
  'sonarr.service'
  'sonarr.sysusers'
  'sonarr.tmpfiles'
)
source_x86_64=("Sonarr.develop.${pkgver}.linux-x64.tar.gz::https://services.sonarr.tv/v1/update/develop/download?version=${pkgver}&os=linux&runtime=netcore&arch=x64")
source_aarch64=("Sonarr.develop.${pkgver}.linux-arm64.tar.gz::https://services.sonarr.tv/v1/update/develop/download?version=${pkgver}&os=linux&runtime=netcore&arch=arm64")
source_armv7h=("Sonarr.develop.${pkgver}.linux-arm.tar.gz::https://services.sonarr.tv/v1/update/develop/download?version=${pkgver}&os=linux&runtime=netcore&arch=arm")
sha256sums=('1a609451c6de4fe0f03c8019e2232b04a552bea98e5863f7e49bba9f00ed05ba'
            'b2673e7b2c7964ceb9672a078797d12fb3c1c8ea908bfaf6330514b8644b0ba2'
            '00141d4cbf34daa6d91b26179d4847ec970e2767382e18fdf9af2ec84a0ff43e'
            '0acb3697a5001b00f79269581cd08645f9d5e1e9f0a57cc3e7deeb12d66accc9')
sha256sums_x86_64=('f5e8a1145bb4c02fc572a985e9f0c0cb3b5a829b0260a51be20f3dffad0d4704')
sha256sums_aarch64=('3ee32d929e7ea750bab538a8cd625798eabeb647aff40cc2a168673adea325b6')
sha256sums_armv7h=('bc756f52dca1281079910616c5cafda5929a62c23a143afccb661a15f9ebda61')

package() {
  install -dm755 "${pkgdir}/usr/lib/sonarr/bin"

  # License
  install -Dm644 "${srcdir}/Sonarr/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}"
  rm "${srcdir}/Sonarr/LICENSE.md"

  # Remove ffprobe, Service Helpers, and Update files
  rm "${srcdir}/Sonarr/ffprobe"
  rm "${srcdir}/Sonarr/ServiceInstall"*
  rm "${srcdir}/Sonarr/ServiceUninstall"*
  rm -rf "${srcdir}/Sonarr/Sonarr.Update"

  # Use system ffprobe
  ln -s /usr/bin/ffprobe "${pkgdir}/usr/lib/sonarr/bin/ffprobe"

  # Disable built in updater.
  install -Dm644 "${srcdir}/package_info" "${pkgdir}/usr/lib/sonarr"
  echo "PackageVersion=${pkgver}-${pkgrel}" >> "${pkgdir}/usr/lib/sonarr/package_info"

  cp -dpr --no-preserve=ownership "${srcdir}/Sonarr/"* "${pkgdir}/usr/lib/sonarr/bin"

  install -Dm644 "${srcdir}/sonarr.service" "${pkgdir}/usr/lib/systemd/system/sonarr.service"
  install -Dm644 "${srcdir}/sonarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/sonarr.conf"
  install -Dm644 "${srcdir}/sonarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/sonarr.conf"
}
