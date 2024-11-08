# Maintainer: Jonas Geiler <aur@jonasgeiler.com>
# Contributor: krevedko
pkgname=supercronic-git
pkgver=0.2.33.r0.gcca6b3a
pkgrel=1
pkgdesc='A crontab-compatible job runner, designed specifically to run in containers (Development version)'
arch=(aarch64 arm armv6h armv7h i686 pentium4 riscv64 x86_64)
url='https://github.com/aptible/supercronic'
license=(MIT)
makedepends=(
	git # Sources
	go  # Build
)
provides=(supercronic)
conflicts=(
	supercronic
	supercronic-bin
)
options=(
	!strip     # Stripping symbols would break the output binary
	!emptydirs # Remove empty directories from package because why not
)
source=('supercronic::git+https://github.com/aptible/supercronic.git')
b2sums=('SKIP')

pkgver() {
	cd "${srcdir}/supercronic/"
	git describe --long --tags --abbrev=7 |
		sed -e 's/^v//' -e 's/-\([[:digit:]]\+\)-\(g[[:alnum:]]\{7\}\)$/.r\1.\2/' -e 's/-/./g'
}

build() {
	export GOPATH="${srcdir}/gopath/"
	export CGO_ENABLED=0

	cd "${srcdir}/supercronic/"
	go build \
		-trimpath \
		-mod=readonly \
		-modcacherw \
		-ldflags "-X main.Version=v${pkgver}"
}

check() {
	"${srcdir}/supercronic/supercronic" -version
}

package() {
	install -Dm755 \
		"${srcdir}/supercronic/supercronic" \
		"${pkgdir}/usr/bin/supercronic"
	install -Dm644 \
		"${srcdir}/supercronic/LICENSE.md" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
