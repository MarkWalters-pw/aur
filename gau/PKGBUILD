# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: <contact@amadejpapez.com>

pkgname=gau
pkgver=2.2.4
pkgrel=1
pkgdesc="Fetch known URLs from AlienVault's Open Threat Exchange, the Wayback Machine, and Common Crawl"
arch=(any)
url='https://github.com/lc/gau'
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('537abafca9065a7ed5d93aa7722d85da0815abf6b08c2d1494483171558ce3f7')

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${pkgname}-${pkgver}/cmd/gau"
  go build -v -o "${pkgname}" .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dvm755 "cmd/gau/gau" -t "${pkgdir}/usr/bin"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
