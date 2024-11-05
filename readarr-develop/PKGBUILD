# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful URL: https://readarr.servarr.com/v1/update/develop?version=0.0.0.0&os=linux&runtime=netcore&arch=x64

pkgname=readarr-develop
_pkgname=Readarr
pkgver=0.4.3.2665
pkgrel=1
pkgdesc='Ebook and audiobook collection manager for newsgroup and torrent users (develop branch)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://readarr.com'
license=('GPL-3.0-or-later')
groups=('servarr-develop')
depends=(
  'aspnet-runtime-6.0'
  'gcc-libs'
  'glibc'
  'sqlite'
)
makedepends=('dotnet-sdk-6.0' 'yarn')
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
provides=(readarr)
conflicts=(readarr)
options=(!debug)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Readarr/Readarr/archive/refs/tags/v${pkgver}.tar.gz"
  'package_info'
  'readarr.service'
  'readarr.sysusers'
  'readarr.tmpfiles'
)
sha256sums=('bb6509614455939617dd3c5486439584cea591d3ddca47b71bf1cda176ac1f10'
            '12235af27b47fe1a353bc79fdfdf8c0e03fca5c0eb08f9eb57c0b66532c37648'
            '09386a5a87038f227e4a0995b37ac7ba561712712ad610323ea7ee8a1bf18c32'
            '1576aa21914edaa336d2b37d41ebf54fbaff6eb5099a3f46407cd79164ccdc67'
            '3030252218445e3cb27025a1b567deef287ff3d5e2f32abc2d640a771d39ddd5')

case ${CARCH} in
  x86_64)  _CARCH='x64';;
  aarch64) _CARCH='arm64';;
  armv7h)  _CARCH='arm';;
esac

_framework='net6.0'
_runtime="linux-${_CARCH}"
_output="_output"
_artifacts="${_output}/${_framework}/${_runtime}/publish"
_branch='develop'

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Prepare backend
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
  dotnet restore src/${_pkgname}.sln \
    --runtime ${_runtime} \
    --locked-mode

  # Prepare frontend
  yarn install --frozen-lockfile --network-timeout 120000
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Build backend
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
  dotnet build src/${_pkgname}.sln \
    --framework ${_framework} \
    --runtime ${_runtime} \
    --no-self-contained \
    --no-restore \
    --configuration Release \
    -p:Platform=Posix \
    -p:AssemblyVersion=${pkgver} \
    -p:AssemblyConfiguration=${_branch} \
    -p:RuntimeIdentifiers=${_runtime} \
    -t:PublishAllRids \

  # Remove Service Helpers, Update, and Windows files
  rm "${_artifacts}/ServiceInstall"*
  rm "${_artifacts}/ServiceUninstall"*
  rm "${_artifacts}/Readarr.Windows."*

  # Build frontend
  yarn run build --env production
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  local _filters="Category!=ManualTest&Category!=AutomationTest&Category!=WINDOWS"

  # Skip Tests:
  # These tests fail because /etc/arch-release doesn't contain a ${VERSION_ID}
  # See: https://github.com/Sonarr/Sonarr/issues/7299
  _filters="${_filters}&FullyQualifiedName!~should_get_version_info"
  _filters="${_filters}&FullyQualifiedName!~should_get_version_info_from_actual_linux"
  _filters="${_filters}&Category!=IntegrationTest"

  # Prepare for tests
  mkdir -p ~/.config/Readarr

  # Test backend
  dotnet test src \
    --runtime "${_runtime}" \
    --configuration Release \
    --filter "${_filters}" \
    --no-build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -dm755 "${pkgdir}/usr/lib/readarr/bin/UI"

  # Copy backend
  cp -dpr --no-preserve=ownership "${_artifacts}/"* "${pkgdir}/usr/lib/readarr/bin"
  # Copy frontend
  cp -dpr --no-preserve=ownership "${_output}/UI/"* "${pkgdir}/usr/lib/readarr/bin/UI"

  # License
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}"

  # Disable built in updater.
  install -Dm644 "${srcdir}/package_info" "${pkgdir}/usr/lib/readarr"
  echo "PackageVersion=${pkgver}-${pkgrel}" >> "${pkgdir}/usr/lib/readarr/package_info"

  install -Dm644 "${srcdir}/readarr.service" "${pkgdir}/usr/lib/systemd/system/readarr.service"
  install -Dm644 "${srcdir}/readarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/readarr.conf"
  install -Dm644 "${srcdir}/readarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/readarr.conf"
}
