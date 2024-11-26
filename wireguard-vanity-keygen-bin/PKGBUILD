# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=wireguard-vanity-keygen-bin
_shortname=wireguard-vanity-keygen
pkgver=0.1.0
pkgrel=1
pkgdesc='WireGuard vanity key generator'
arch=('x86_64' 'aarch64' 'i686' 'arm')
url='https://github.com/axllent/wireguard-vanity-keygen'
license=('MIT')
depends=('glibc')
provides=('wireguard-vanity-keygen')
conflicts=('wireguard-vanity-keygen')
source_x86_64=("https://github.com/axllent/wireguard-vanity-keygen/releases/download/${pkgver}/${_shortname}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/axllent/wireguard-vanity-keygen/releases/download/${pkgver}/${_shortname}-linux-arm64.tar.gz")
source_i686=("https://github.com/axllent/wireguard-vanity-keygen/releases/download/${pkgver}/${_shortname}-linux-386.tar.gz")
source_arm=("https://github.com/axllent/wireguard-vanity-keygen/releases/download/${pkgver}/${_shortname}-linux-arm.tar.gz")
sha256sums_x86_64=('32544ab3c9e7688c4d196bd4b6e3ef80e11e094955e780ddb252fdc7c8c8c8f0')
sha256sums_aarch64=('209cdc3324f16c9e129a0e4da7672c4e042a69a75da48de3f3897df6b04da9f9')
sha256sums_i686=('9b3afb5d7f7e4500bd35c6f251c4a52144abe154a62c854d32d0c5a1809d61c8')
sha256sums_arm=('21498fae48178eb81ae419d9f8bc561d3af99976ac02cd5e2ccd12a728cc5132')

package() {
    # Upstream uses different format for architechture notation
    case $CARCH in
        'x86_64')   subarch='amd64' ;;
        'aarch64')  subarch='arm64' ;;
        'i686')     subarch='386'   ;;
        *)          subarch=$CARCH  ;;
    esac

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${srcdir}/${_shortname}" "${pkgdir}/usr/bin/${_shortname}"
}
