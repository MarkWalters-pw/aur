# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=drand-client
_name=go-clients
pkgver=0.2.1
pkgrel=1
pkgdesc="The drand (go) client and gossipsub relay"
arch=(x86_64)
url=https://github.com/drand/go-clients
license=('Apache-2.0 OR MIT')
depends=(glibc)
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::https://github.com/drand/$_name/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('8aa3f92a83fcd91910b647fdb7fd3db0aff384646a71420116c4fd38d8534a965fce0a535c3d3f0154d8cc12aa8259f4bd4f6e4713f8f41180d17a36376ca0b0')

build() {
    cd $_name-$pkgver
    mkdir -p build
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o drand-cli ./main.go
    go build -o drand-relay-gossip ./gossip-relay/main.go
}

package() {
    cd $_name-$pkgver
    install -Dm755 drand-cli "$pkgdir"/usr/bin/drand-cli
    install -Dm755 drand-relay-gossip "$pkgdir"/usr/bin/drand-relay-gossip
    install -Dm644 LICENSE-MIT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
