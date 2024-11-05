# Maintainer: Ben Leynen <leynenben@gmail.com>
OPTIONS=(!debug)
pkgname=grafana-alloy-bin
_binaryname=alloy
pkgver=v1.4.2
pkgrel=1
pkgdesc="A vendor-neutral distribution of the OpenTelemetry (OTel) Collector."
arch=('x86_64')
_binaryarch=('linux-amd64')
url="https://github.com/grafana/alloy"
license=('Apache-2.0')
makedepends=('unzip' 'bc')
source=("$pkgname-$pkgver.zip::${url}/releases/download/${pkgver}/${_binaryname}-${_binaryarch}.zip")
sha256sums=('2e61542d8ff4240f12109249a408cce9a5690f776716062ecc4999df3befc3b7')

package() {
	install -D -g root -m 0755 -o root "${srcdir}/${_binaryname}-${_binaryarch}" "${pkgdir}/usr/bin/${_binaryname}"
}
