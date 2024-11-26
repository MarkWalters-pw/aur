# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=wireguard-vanity-keygen
pkgver=0.1.0
pkgrel=1
pkgdesc='WireGuard vanity key generator'
arch=('any')
url='https://github.com/axllent/wireguard-vanity-keygen'
license=('MIT')
depends=('glibc')
makedepends=('go>=1.11')
source=("${pkgname}-${pkgver}::https://github.com/axllent/wireguard-vanity-keygen/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('97a5b80e5a04cd8b9996d78d7a43efbfa63bc3c10213d30efcb27b656f37c37e')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # this build process now mirrors the ci build process used by wireguard-vanity-keygen
    # after the project's makefile was deleted from wireguard-vanity-keygen in 0.0.7
    # https://github.com/axllent/wireguard-vanity-keygen/blob/0.0.7/.github/workflows/release-build.yml#L25-L37
    go build -ldflags "-w -X main.appVersion=${pkgver}" -o ${pkgname}
}

package() {
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
