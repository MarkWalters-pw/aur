# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Devin Buhl <devin.kray@gmail.com>
# Helpful URL: https://radarr.servarr.com/v1/update/master?version=0.0.0.0&os=linux&runtime=netcore&arch=x64

pkgname=radarr-bin
pkgver=5.14.0.9383
pkgrel=6
pkgdesc='Movie organizer/manager for usenet and torrent users.'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://radarr.video'
license=('GPL-3.0-or-later')
groups=('servarr-bin')
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
provides=(radarr)
conflicts=(radarr)
options=(!debug)
source=(
  'radarr.service'
  'radarr.tmpfiles'
  'radarr.sysusers'
  'package_info'
)
source_x86_64=("Radarr.master.${pkgver}.linux-core-x64.tar.gz::https://radarr.servarr.com/v1/update/master/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64")
source_aarch64=("Radarr.master.${pkgver}.linux-core-arm64.tar.gz::https://radarr.servarr.com/v1/update/master/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64")
source_armv7h=("Radarr.master.${pkgver}.linux-core-arm.tar.gz::https://radarr.servarr.com/v1/update/master/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")
sha256sums=('6abfbb9e308b945bd74e7d46d30d418c5a7a51aab12aefa4e2289ca2398ca3f2'
            'b4dbab5257d60ae73197662930ef4cdc5be2e7135df451e2541c181ed28ea5db'
            'bb73e0c55711d7ddbf74140b3beb39cb8674ae92be8387c3dd8109bcd53faca8'
            'dd9a40cb2885bcc80d0057c50920707f003a64012df03ab6dad0bf67e651e591')
sha256sums_x86_64=('46fcc05959b6ad448bdbde87d0536cbc6a756821aedb14a889010924cde12d12')
sha256sums_aarch64=('fe3ef2ca25011491c343ed78b1062b643796b81a8d43a229a3630e556b986257')
sha256sums_armv7h=('cb9c7903b32d3d5da83638ea8eecdf0a90d1c989bcffe8f7d9dcded0faa39726')

package() {
  install -dm755 "${pkgdir}/usr/lib/radarr/bin"

  # License
  install -Dm644 "${srcdir}/Radarr/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
  rm "${srcdir}/Radarr/LICENSE"

  # Remove ffprobe, Service Helpers, and Update files
  rm "${srcdir}/Radarr/ffprobe"
  rm "${srcdir}/Radarr/ServiceInstall"*
  rm "${srcdir}/Radarr/ServiceUninstall"*
  rm -rf "${srcdir}/Radarr/Radarr.Update"

  # Use system ffprobe
  ln -s /usr/bin/ffprobe "${pkgdir}/usr/lib/radarr/bin/ffprobe"

  # Disable built in updater.
  install -Dm644 "${srcdir}/package_info" "${pkgdir}/usr/lib/radarr"
  echo "PackageVersion=${pkgver}-${pkgrel}" >> "${pkgdir}/usr/lib/radarr/package_info"

  cp -dpr --no-preserve=ownership "${srcdir}/Radarr/"* "${pkgdir}/usr/lib/radarr/bin"

  install -Dm644 "${srcdir}/radarr.service" "${pkgdir}/usr/lib/systemd/system/radarr.service"
  install -Dm644 "${srcdir}/radarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/radarr.conf"
  install -Dm644 "${srcdir}/radarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/radarr.conf"
}
