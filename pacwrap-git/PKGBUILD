# Maintainer: Xavier Moffett (sapphirus at azorium dot net)

_pkgname=pacwrap
pkgname=('pacwrap-git' 'pacwrap-dist-git')
pkgver=0.8.6.r10.33dd491
pkgrel=1
pkgdesc="A package manager which facilitates Arch-based bubblewrap containers."
arch=('x86_64')
url="https://pacwrap.sapphirus.org/"
license=('GPLv3-only')
source=("$_pkgname::git+https://github.com/pacwrap/pacwrap.git")
makedepends=('cargo'
        'busybox'
        'fakechroot'
        'fakeroot'
        'git'
        'libalpm.so=15'
        'pacman'
        'zstd')
md5sums=('SKIP')
options=('!lto')

pkgver() {
        cd "${_pkgname}"
        echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

prepare() {
        cd "${_pkgname}"
        cargo fetch --locked --target "$CARCH-unknown-linux-gnu" \
        && ./dist/tools/prepare.sh release
}

build() {
        cd "${_pkgname}"
        PACWRAP_SCHEMA_BUILT=1 \
        cargo build --release --frozen \
        && ./dist/tools/package.sh release
}

package_pacwrap-git() {
        provides=("${_pkgname}")
        conflicts=("${_pkgname}")
        depends=('bash'
                'bubblewrap'
                'gnupg'
                'libalpm.so>=14'
                'libseccomp'
                'pacman'
                "pacwrap-dist-git=$pkgver"
                'zstd')
        optdepends=('xdg-dbus-proxy')

        cd "${_pkgname}"
        install -d "${pkgdir}/usr/share/${_pkgname}"
        install -Dm 755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
        install -Dm 755 "dist/bin/${_pkgname}-key" "${pkgdir}/usr/bin/${_pkgname}-key"
        install -Dm 644 "dist/bin/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
        install -Dm 644 "dist/bin/${_pkgname}.yml.2" "${pkgdir}/usr/share/man/man2/${_pkgname}.yml.2"
        install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

package_pacwrap-dist-git() {
        provides=("${_pkgname}-dist")
        conflicts=("${_pkgname}-dist")

        cd "${_pkgname}"
        install -dD 755 "${pkgdir}/usr/share/${_pkgname}/"
        install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}-dist/LICENSE"
        install -Dm 644 "dist/bin/filesystem.tar.zst" "${pkgdir}/usr/share/${_pkgname}/filesystem.tar.zst"
        install -Dm 644 "dist/bin/filesystem.dat" "${pkgdir}/usr/share/${_pkgname}/filesystem.dat"
        cp -r "dist/runtime" "${pkgdir}/usr/share/${_pkgname}/"
}

# vim:set ts=4 sw=4 et:1
