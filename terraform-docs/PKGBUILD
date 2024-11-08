# Maintainer: Jeff Henson <jeff@henson.io>
# Old Maintainer: Gabriel M. Dutra <0xdutra@gmail.com>

pkgname=terraform-docs
pkgver=0.19.0
pkgrel=1
pkgdesc=" Generate documentation from Terraform modules in various output formats"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/terraform-docs/terraform-docs"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/terraform-docs/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('9341dadb3d45ab8e050d7209c5bd11090e0225b6fc4ea3383d767f08f7e86c6f')

build() {
	cd "${pkgname}-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o "${pkgname}"

	./${pkgname} completion bash > ${pkgname}.bash
	./${pkgname} completion zsh > ${pkgname}.zsh
	./${pkgname} completion fish > ${pkgname}.fish
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin/"
	install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -vDm 644 ${pkgname}.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
	install -vDm 644 ${pkgname}.zsh "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
	install -vDm 644 ${pkgname}.fish "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}
