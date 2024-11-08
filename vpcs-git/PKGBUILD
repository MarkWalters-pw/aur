# Maintainer: Andrei Korshikov <andrej.s.korshikov at gmail.com>

# Author:                   Andrei Korshikov
# SPDX-License-Identifier:  0BSD

pkgname='vpcs-git'
_release='0.8.3'
pkgver=0.8.3.r231.a19e146
pkgrel=1
pkgdesc='Simple Virtual PC Simulator'
arch=('i686' 'x86_64')
url='https://github.com/GNS3/vpcs'
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('gcc' 'git' 'make')
provides=("vpcs=${pkgver}")
conflicts=('vpcs')
source=(
    'git+https://github.com/GNS3/vpcs.git'
    'enable_custom_flags.patch'
    )
b2sums=(
    'SKIP'
    '435cae026481bbed95de26573f67f0ab76ec91eb2376074829219cc5779465645cdf5e8eb63614a05e1c82fbe95120dbd7bcedc56497234e3d7edb2839be5175'
    )

prepare() {
    cd 'vpcs' || exit
    patch --strip=1 --input="../enable_custom_flags.patch"
    }

pkgver() {
    cd 'vpcs' || exit
    _commits_total="$(git rev-list --count HEAD)"
    _latest_commit="$(git rev-parse --short HEAD)"
    printf '%s.r%s.%s' "${_release}" "${_commits_total}" "${_latest_commit}"
    }

build() {
    cd 'vpcs/src' || exit
    case "${CARCH}" in
        'i686')
            ./mk.sh 'i386'
            ;;
        'x86_64')
            ./mk.sh 'amd64'
            ;;
        *)
            printf 'Architecture "%s" is not supported.\n' "${CARCH}"
            exit
            ;;
        esac
    }

package() {
    install -D --target-directory="${pkgdir}/usr/bin/" 'vpcs/src/vpcs'

    install -D --mode=644 --target-directory="${pkgdir}/usr/share/licenses/${pkgname}/" 'vpcs/COPYING'

    local _man_dir="${pkgdir}/usr/share/man/man1/"
    install --directory "${_man_dir}"
    gzip --to-stdout --best 'vpcs/man/vpcs.1' > "${_man_dir}/vpcs.1.gz"
    }
