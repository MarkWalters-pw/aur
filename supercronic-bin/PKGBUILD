# Maintainer: Jonas Geiler <aur@jonasgeiler.com>
pkgname=supercronic-bin
# renovate: datasource=github-releases depName=aptible/supercronic
pkgver=0.2.33
pkgrel=1
pkgdesc='A crontab-compatible job runner, designed specifically to run in containers (Pre-compiled version)'
arch=(aarch64 armv7h i686 x86_64)
url='https://github.com/aptible/supercronic'
license=(MIT)
provides=(supercronic)
conflicts=(
	supercronic
	supercronic-git
)
options=(
	!strip     # Stripping symbols would break the binary
	!emptydirs # Remove empty directories from package because why not
)
source=("LICENSE-${pkgname}-${pkgver}.md::https://raw.githubusercontent.com/aptible/supercronic/refs/tags/v${pkgver}/LICENSE.md")
source_aarch64=("${pkgname}-${pkgver}-arm64::https://github.com/aptible/supercronic/releases/download/v${pkgver}/supercronic-linux-arm64")
source_armv7h=("${pkgname}-${pkgver}-arm::https://github.com/aptible/supercronic/releases/download/v${pkgver}/supercronic-linux-arm")
source_i686=("${pkgname}-${pkgver}-386::https://github.com/aptible/supercronic/releases/download/v${pkgver}/supercronic-linux-386")
source_x86_64=("${pkgname}-${pkgver}-amd64::https://github.com/aptible/supercronic/releases/download/v${pkgver}/supercronic-linux-amd64")
b2sums=('a6b6216404b1faba0feec03f5948ee5f3663288afdce33c63c159dd964f24e29197943d38c7288d446ee328e2553952dada226a41326387f2d21cca4a3b928c5')
b2sums_aarch64=('ac22f1977f23c26ae82f8b79d5715732137566c323aebb9a65d610bd60b588e435aa890713e2df77b74a3bdd3b7888c7fd76fbc7c6b36fe62500394f44aa0b91')
b2sums_armv7h=('510cfa423dcb96cdcad441f6a00c928358822dfd90d1c3743e067587894e91d09aa29ae5428ef8138a0a3e63ae3f6f80d8c7705a76476ea570e4159282aec7ff')
b2sums_i686=('6812fb0fb350b2836affe8a45a80aadf840719589ff4d1872137629f2297e37e15767fe3b9d95ca30e922b668abe6189aad20222c03374d88d1f6a407c40c162')
b2sums_x86_64=('eed9de89be7df3811d63c22d5f1d0cfbb1c844cf00f23916852c17e1ae038ea3c8449198fe1e5293ce506407323bbb620828c4745c566f14d2616f4c620f36c8')

package() {
	install -Dm755 \
		"${srcdir}/${pkgname}-${pkgver}"-* \
		"${pkgdir}/usr/bin/supercronic"
	install -Dm644 \
		"${srcdir}/LICENSE-${pkgname}-${pkgver}.md" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
