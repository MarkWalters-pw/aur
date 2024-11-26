# Maintainer: Jakub Kopańko <hi at kopanko dot com>

pkgname=hcp-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Lets you administer HashiCorp Cloud Platform (HCP) resources and services."
arch=('x86_64' 'aarch64')
url="https://github.com/hashicorp/hcp"
license=("MPL-2.0")
provides=("hcp=${pkgver}")
conflicts=('hcp')

source_x86_64=("https://releases.hashicorp.com/hcp/${pkgver}/hcp_${pkgver}_linux_amd64.zip")
sha256sums_x86_64=('90d3dbdbbb22fb32fc75c721cb076e0a2a115f510684dc49050eb040344f05a2')

source_aarch64=("https://releases.hashicorp.com/hcp/${pkgver}/hcp_${pkgver}_linux_arm64.zip")
sha256sums_aarch64=('b44d1a5fd8c1a0a68782a9a02b4fa43d62d497a8381df3b647762b5c5c4ea7d8')

package() {
    install -Dm755 "${srcdir}/hcp" "${pkgdir}/usr/bin/hcp"
}
