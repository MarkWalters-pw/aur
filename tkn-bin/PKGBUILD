# Maintainer: Flavio Heleno <flaviohbatista@gmail.com>

pkgname='tkn-bin'
pkgver=0.38.0
pkgrel=1
pkgdesc='A CLI for interacting with Tekton!'
url='https://github.com/tektoncd/cli'
arch=('aarch64' 'ppc64le' 's390x' 'x86_64')
license=('Apache 2.0')
provides=('tkn')

sha256sums_aarch64=('cd4e786d4a2d8b56ae698ff923044dd9ca03b3e93bb0290884334e09a8ec43ad')
sha256sums_ppc64le=('e0b8468f36db0beabedba9d168756dd328fb27c61cba3a4b742c0d75ba23da32')
sha256sums_s390x=('1338dbb56512fc16cc947393af28b0827953fa2438ebdbec73e9b1b183e3b001')
sha256sums_x86_64=('527c3b550a64cd20e86bba79c210c4836c40e367b5b5a6ec0d6ba35f05ea23fe')

source_aarch64=("${pkgname}_${pkgver}_aarch64::https://github.com/tektoncd/cli/releases/download/v${pkgver}/tkn_${pkgver}_Linux_aarch64.tar.gz")
source_ppc64le=("${pkgname}_${pkgver}_ppc64le::https://github.com/tektoncd/cli/releases/download/v${pkgver}/tkn_${pkgver}_Linux_ppc64le.tar.gz")
source_s390x=("${pkgname}_${pkgver}_s390x::https://github.com/tektoncd/cli/releases/download/v${pkgver}/tkn_${pkgver}_Linux_s390x.tar.gz")
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/tektoncd/cli/releases/download/v${pkgver}/tkn_${pkgver}_Linux_x86_64.tar.gz")

package() {
  install -Dm755 "./tkn" "${pkgdir}/usr/bin/tkn"

  install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/tkn/LICENSE"
}
