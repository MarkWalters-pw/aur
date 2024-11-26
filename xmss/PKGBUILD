# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=xmss
_name=xmss-reference
_commit=171ccbd26f098542a67eb5d2b128281c80bd71a6
pkgver=r136.171ccbd
pkgrel=2
pkgdesc="eXtended Merkle Signature Scheme reference code (RFC 8391)"
arch=(x86_64)
url=https://github.com/XMSS/xmss-reference
license=(Unlicense)
depends=(openssl)
makedepends=(git)
source=($_name::git+$url#commit=$_commit)
b2sums=('1f9c0cc684bcf2ad1a7ef3e43cf8239d09b3e39065ead002b8440c382a43f80d99379fb576bbbebc82859afce262591a5b022eb342bc00acec7bc2c8b406ef6b')

pkgver() {
    cd $_name
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd $_name
    make all
}

#check () {
#    cd $_name
#    for test in $(find ./test -type f -executable); do
#        ./$test
#    done
#}

package() {
    cd $_name
    install -d "$pkgdir"/usr/bin
    for exec in $(find ./ui -type f -executable); do
        install -vDm 755 $exec "$pkgdir"/usr/bin
    done
}

