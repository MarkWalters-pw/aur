# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=wg-cmd
pkgver=0.1.6
pkgrel=1
pkgdesc="TUI for managing WireGuard configuration files "
arch=(x86_64)
url="https://github.com/AndrianBdn/wg-cmd"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AndrianBdn/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('788b2bb5d477b27b0308c7ca38b97d740bc27561e8336bd62f8446fa43f7b639aa0c284154f80edc25aa8be0e0da497b4c7bf8551804a06bd4951e76b724e81c')


prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

package() {
  install -vDm755 $pkgname-$pkgver/build/$pkgname "${pkgdir}"/usr/bin/$pkgname
  install -vDm644 $pkgname-$pkgver/LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
