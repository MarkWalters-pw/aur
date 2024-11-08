# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=recyclarr-bin
_pkgname=${pkgname%%-bin}
pkgver=7.3.0
pkgrel=1
pkgdesc='Automatically synchronize recommended settings from the TRaSH guides to your Sonarr/Radarr instances.'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://recyclarr.dev'
license=('MIT')
depends=(
  'gcc-libs'
  'git'
  'glibc'
  'sqlite'
  'zlib'
)
optdepends=(
  'sonarr: Smart PVR for newsgroup and torrent users.'
  'radarr: Movie organizer/manager for usenet and torrent users.'
)
provides=(recyclarr)
conflicts=(recyclarr)
backup=('etc/recyclarr/recyclarr.yml')
options=('!debug' '!strip')
source=(
  'recyclarr.yml'
  'recyclarr.service'
  'recyclarr.timer'
  'recyclarr.tmpfiles'
  'recyclarr.sysusers'
)
source_x86_64=("${_pkgname}-${pkgver}.linux-x64.tar.xz::https://github.com/recyclarr/recyclarr/releases/download/v${pkgver}/recyclarr-linux-x64.tar.xz")
source_aarch64=("${_pkgname}-${pkgver}.linux-arm64.tar.xz::https://github.com/recyclarr/recyclarr/releases/download/v${pkgver}/recyclarr-linux-arm64.tar.xz")
source_armv7h=("${_pkgname}-${pkgver}.linux-arm.tar.xz::https://github.com/recyclarr/recyclarr/releases/download/v${pkgver}/recyclarr-linux-arm.tar.xz")
sha256sums=('f0b6b437fad6072f55be0eb57c4eaf6a44eecda4588633edd5ad716ea3e41c7d'
            'c03ea99bdea959b9da8a71556f58980ffd3967ee6cbab4c11945ab1aebd52246'
            'e8a2959e079a6a77c3eefaf77defd69e76944c2a1378257dcaf0286abde002a6'
            '458b7c0550f3c2e41f63bac197ce55a5699432ee24080f7917b001c0eec2c7ec'
            '3d2a1b3690d956a8f195c2cd1b28c28beecda354023e8de78471ca35610fb57d')
sha256sums_x86_64=('c4123eb522c4f89fe9a8b3ce4d7bc8e6110b1d2f200782892ac3be5ccfad28ab')
sha256sums_aarch64=('e8b8607f50363ad22766b44d65d52cb9b3fbe7a045a6ca7379b01500efac518a')
sha256sums_armv7h=('bb9a5946ce1661ac4cac227accaa34e219cd74e23e05c90489290fa901f3845e')

package() {
  install -Dm755 "${srcdir}/recyclarr" "${pkgdir}/usr/bin/recyclarr"
  install -Dm600 "${srcdir}/recyclarr.yml" "${pkgdir}/etc/recyclarr/recyclarr.yml"
  install -Dm644 "${srcdir}/recyclarr.service" "${pkgdir}/usr/lib/systemd/system/recyclarr.service"
  install -Dm644 "${srcdir}/recyclarr.timer" "${pkgdir}/usr/lib/systemd/system/recyclarr.timer"
  install -Dm644 "${srcdir}/recyclarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/recyclarr.conf"
  install -Dm644 "${srcdir}/recyclarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/recyclarr.conf"
}
