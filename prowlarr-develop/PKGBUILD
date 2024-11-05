# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful URL: https://prowlarr.servarr.com/v1/update/develop?version=0.0.0.0&os=linux&runtime=netcore&arch=x64

pkgname=prowlarr-develop
_pkgname=Prowlarr
pkgver=1.26.0.4833
pkgrel=1
pkgdesc='Indexer manager/proxy for usenet and torrent users (develop branch)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://prowlarr.com'
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
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Prowlarr/Prowlarr/archive/refs/tags/v${pkgver}.tar.gz"
  'package_info'
  'prowlarr.service'
  'prowlarr.sysusers'
  'prowlarr.tmpfiles'
)
sha256sums=('d33fd9a0ddd5462365940482ff8935f02fed3e064ea610f8da161f0822bdcd1e'
            '15b6ed4b78eafc6d0059c87d71945782f1600c57047562a0865fd1779f7ee293'
            '21ca63506b3cffcca8dcd95e1bdf3fa8415f1bc134c31a153b51b573dc31d390'
            '08d51099f09721b173233e58172c486025c16034dd89e73ccb42b647dcc34c4b'
            '4c3f9b5fa71810697efbe60f20a2cba24fd1b997d5372c3726457b197d61ccb5')

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

  # Fix CVE-2024-43485
  # sed 's/System\.Text\.Json" Version="6\.0\.9"/System\.Text\.Json" Version="6\.0\.10"/' -i src/NzbDrone.Common/Prowlarr.Common.csproj
  # sed 's/System\.Text\.Json" Version="6\.0\.9"/System\.Text\.Json" Version="6\.0\.10"/' -i src/NzbDrone.Core/Prowlarr.Core.csproj

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
  rm "${_artifacts}/Prowlarr.Windows."*

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
  mkdir -p ~/.config/Prowlarr

  # Test backend
  dotnet test src \
    --runtime "${_runtime}" \
    --configuration Release \
    --filter "${_filters}" \
    --no-build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -dm755 "${pkgdir}/usr/lib/prowlarr/bin/UI"

  # Copy backend
  cp -dpr --no-preserve=ownership "${_artifacts}/"* "${pkgdir}/usr/lib/prowlarr/bin"
  # Copy frontend
  cp -dpr --no-preserve=ownership "${_output}/UI/"* "${pkgdir}/usr/lib/prowlarr/bin/UI"

  # License
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"

  # Disable built in updater.
  install -Dm644 "${srcdir}/package_info" "${pkgdir}/usr/lib/prowlarr"
  echo "PackageVersion=${pkgver}-${pkgrel}" >> "${pkgdir}/usr/lib/prowlarr/package_info"

  install -Dm644 "${srcdir}/prowlarr.service" "${pkgdir}/usr/lib/systemd/system/prowlarr.service"
  install -Dm644 "${srcdir}/prowlarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/prowlarr.conf"
  install -Dm644 "${srcdir}/prowlarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/prowlarr.conf"
}
