# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=recyclarr
_pkgname=Recyclarr
pkgver=7.3.0
pkgrel=1
pkgdesc='Automatically synchronize recommended settings from the TRaSH guides to your Sonarr/Radarr instances.'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://recyclarr.dev'
license=('MIT')
depends=(
  'aspnet-runtime-8.0'
  'gcc-libs'
  'git'
  'glibc'
  'sqlite'
)
makedepends=('dotnet-sdk-8.0' 'git')
optdepends=(
  'sonarr: Smart PVR for newsgroup and torrent users.'
  'radarr: Movie organizer/manager for usenet and torrent users.'
)
options=(!debug)
source=(
  "git+https://github.com/recyclarr/recyclarr.git#tag=v${pkgver}"
  'recyclarr.yml'
  'recyclarr.service'
  'recyclarr.timer'
  'recyclarr.sysusers'
  'recyclarr.tmpfiles'
)
sha256sums=('e0effcecac46844c0ae3762bd9f529549703ebef72f3d38b349b63ca277b20fa'
            'f0b6b437fad6072f55be0eb57c4eaf6a44eecda4588633edd5ad716ea3e41c7d'
            '3e7bb0ca28665de77b939f6b8e316f6708c8e8a97a64ad589b217583dee0e74e'
            'e8a2959e079a6a77c3eefaf77defd69e76944c2a1378257dcaf0286abde002a6'
            '3d2a1b3690d956a8f195c2cd1b28c28beecda354023e8de78471ca35610fb57d'
            '458b7c0550f3c2e41f63bac197ce55a5699432ee24080f7917b001c0eec2c7ec')

case ${CARCH} in
  x86_64)  _CARCH='x64';;
  aarch64) _CARCH='arm64';;
  armv7h)  _CARCH='arm';;
esac

_framework='net8.0'
_runtime="linux-${_CARCH}"
_artifacts="src/Recyclarr.Cli/bin/Release/${_framework}/publish"

prepare() {
  cd "${srcdir}/${pkgname}"

  # Fix CVE-2024-43485
  sed 's/System\.Text\.Json" Version="8\.0\.4"/System\.Text\.Json" Version="8\.0\.5"/' -i Directory.Packages.props
}

build() {
  cd "${srcdir}/${pkgname}"

  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  # dotnet publish ${_pkgname}.sln \
  dotnet publish src/Recyclarr.Cli \
    --framework ${_framework} \
    --no-self-contained \
    --configuration Release \
    -p:AssemblyVersion=${pkgver} \
    -p:AssemblyConfiguration=master \
  && dotnet build-server shutdown   # Build servers do not terminate automatically
}

check() {
  cd "${srcdir}/${pkgname}"
  local _filters="Category!=ManualTest&Category!=AutomationTest&Category!=WINDOWS"

  dotnet test \
    --configuration Release \
    --filter "${_filters}" \
    --no-build
}

package() {
  cd "${srcdir}/${pkgname}"
  install -dm755 "${pkgdir}/usr/lib/recyclarr"

  cp -dpr --no-preserve=ownership "${_artifacts}/"* "${pkgdir}/usr/lib/recyclarr"

  # License
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm644 "${srcdir}/recyclarr.yml" "${pkgdir}/etc/recyclarr/recyclarr.yml"
  install -Dm644 "${srcdir}/recyclarr.service" "${pkgdir}/usr/lib/systemd/system/recyclarr.service"
  install -Dm644 "${srcdir}/recyclarr.timer" "${pkgdir}/usr/lib/systemd/system/recyclarr.timer"
  install -Dm644 "${srcdir}/recyclarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/recyclarr.conf"
  install -Dm644 "${srcdir}/recyclarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/recyclarr.conf"
}
