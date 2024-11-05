# Maintainer: Jerry Y. Chen <chen@jyny.dev>

pkgname=atlas-bin
pkgdesc="A modern tool for managing database schemas"
pkgver=0.28.0
pkgrel=1
binary=atlas
arch=("x86_64")
makedepends=("go")

license=("Apache-2.0")
provides=('atlas')
conflicts=('atlas')
url="https://github.com/ariga/${binary}"

source_x86_64=("https://release.ariga.io/atlas/${binary}-community-linux-amd64-v${pkgver}")

sha256sums_x86_64=('486f36905b4b0d4978969d10d57e282ac1de0a5ae18c09ecdf967f85ba3e634b')
b2sums_x86_64=('bf7137a575e89bf73147094bea4cf4df15bf7d8ab9075f5228361138f418b84951c3fd3d6eb23275392a333506f8e78033c5cc79307867e31ec8000d7cad80c5')

package() {
    install -Dm755 "${srcdir}/${binary}-community-linux-amd64-v${pkgver}" "${pkgdir}/usr/bin/${binary}"
}