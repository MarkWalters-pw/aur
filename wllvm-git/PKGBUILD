# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=wllvm-git
pkgver=r497.cd87744
pkgrel=2
pkgdesc="A wrapper script to build whole-program LLVM bitcode files"
arch=('any')
url="https://github.com/travitch/whole-program-llvm"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer'
             'python-wheel')
provides=('wllvm')
conflicts=('wllvm')
source=("$pkgname"::'git+https://github.com/travitch/whole-program-llvm')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
    fi
}

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer \
        --prefix=/usr \
        --destdir="$pkgdir" \
        --compile-bytecode=1 \
        dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
