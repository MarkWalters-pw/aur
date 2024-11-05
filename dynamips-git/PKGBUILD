# Maintainer: Andrei Korshikov <andrej.s.korshikov at gmail.com>

# Author:                   Andrei Korshikov
# SPDX-License-Identifier:  0BSD

pkgname='dynamips-git'
_release='0.2.23'
pkgver=0.2.23.r536.ab50526
pkgrel=1
pkgdesc='Cisco Router Emulator'
arch=('i686' 'x86_64')
url='https://github.com/GNS3/dynamips'
license=('GPL-2.0-only')
depends=('glibc' 'libelf' 'libpcap')
makedepends=('git' 'cmake')
provides=("dynamips=${pkgver}")
conflicts=('dynamips')
source=(
    'git+https://github.com/GNS3/dynamips.git'
    )
b2sums=(
    'SKIP'
    )

pkgver() {
    cd 'dynamips' || exit
    _commits_total="$(git rev-list --count HEAD)"
    _latest_commit="$(git rev-parse --short HEAD)"
    printf '%s.r%s.%s' "${_release}" "${_commits_total}" "${_latest_commit}"
    }

build() {
    case "${CARCH}" in
        'i686')
            cmake -S 'dynamips' -B 'build' -D DYNAMIPS_ARCH='x86'
            ;;
        'x86_64')
            cmake -S 'dynamips' -B 'build' -D DYNAMIPS_ARCH='amd64'
            ;;
        *)
            cmake -S 'dynamips' -B 'build' -D DYNAMIPS_ARCH='nojit'
            ;;
        esac
    cmake --build 'build'
    }

package() {
    cmake --install 'build' --prefix="${pkgdir}/usr/"

    local _license_dir="${pkgdir}/usr/share/licenses/${pkgname}/"
    install --directory "${_license_dir}"
    ln --symbolic '/usr/share/doc/dynamips/COPYING' "${_license_dir}"
    }
