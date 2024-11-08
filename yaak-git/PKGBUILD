# Maintainer: Jonas Geiler <aur@jonasgeiler.com>
# Maintainer: SoftExpert <softexpert at gmail dot com>
pkgname=yaak-git
pkgver=2024.11.2.r0.g6f50f35
pkgrel=1
pkgdesc='Simple and intuitive API client for calling REST, GraphQL, and gRPC APIs (Development version)'
arch=(aarch64 armv7h i686 pentium4 x86_64)
url='https://yaak.app/'
license=(MIT)
depends=(
	# As reported by namcap
	cairo
	gcc-libs
	gdk-pixbuf2
	glib2
	glibc
	gtk3
	hicolor-icon-theme
	libsoup3
	pango
	webkit2gtk-4.1
)
makedepends=(
	appmenu-gtk-module   # Tauri
	cargo                # Rust dependencies & Tauri build
	git                  # Sources
	libappindicator-gtk3 # Tauri
	librsvg              # Tauri
	nodejs               # Custom scripts & web build
	npm                  # Node dependencies & web build
	protobuf             # Yaak
)
provides=(yaak yaak-app)
conflicts=(
	yaak
	yaak-app-beta
	yaak-appimage
	yaak-bin
)
options=(
	!lto       # Some Rust dependencies don't support link time optimization
	!strip     # Stripping symbols would break the output binary
	!emptydirs # Remove empty directories from package because why not
)
source=(
	"yaak::git+https://github.com/yaakapp/app.git"
	"yaak-plugins::git+https://github.com/yaakapp/plugins.git"
)
b2sums=('SKIP'
        'SKIP')

pkgver() {
	cd "${srcdir}/yaak/"
	# The tags don't belong to a branch so we have to get the latest tag across all branches
	git describe --long --tags --abbrev=7 "$(git rev-list --tags --max-count=1)" |
		sed -e 's/^v//' -e 's/-\([[:digit:]]\+\)-\(g[[:alnum:]]\{7\}\)$/.r\1.\2/' -e 's/-/./g'
}

_semver() {
	cd "${srcdir}/yaak/"
	# Same as above but with a different sed replacement to make the output valid semver
	git describe --long --tags --abbrev=7 "$(git rev-list --tags --max-count=1)" |
		sed -e 's/^v//' -e 's/-\([[:digit:]]\+\)-\(g[[:alnum:]]\{7\}\)$/-r.\1+\2/'
}

build() {
	local _semver && _semver="$(_semver)"
	export YAAK_VERSION="${_semver}"
	export YAAK_PLUGINS_DIR="${srcdir}/yaak-plugins/"
	export CI=true

	cd "${srcdir}/yaak/"
	npm ci
	npm install @yaakapp/cli
	npm run replace-version
	npm run tauri build -- --verbose --bundles deb

	sed -e 's|Name=yaak|Name=Yaak|' \
		-e '$aGenericName=API Client' \
		-i "${srcdir}/yaak/src-tauri/target/release/bundle/deb/yaak_${_semver}_"*/data/usr/share/applications/yaak.desktop
}

package() {
	local _semver && _semver="$(_semver)"
	cp -a \
		"${srcdir}/yaak/src-tauri/target/release/bundle/deb/yaak_${_semver}_"*/data/usr/ \
		"${pkgdir}/usr/"
	install -Dm644 \
		"${srcdir}/yaak/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
