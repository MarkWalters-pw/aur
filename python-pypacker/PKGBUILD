# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=python-pypacker
pkgver=5.5
pkgrel=1
pkgdesc="The fastest and simplest packet manipulation lib for Python"
arch=('x86_64')
url="https://gitlab.com/mike01/pypacker"
license=('GPL')
depends=('python' 'python-netifaces')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://gitlab.com/mike01/pypacker/-/archive/v$pkgver/pypacker-v$pkgver.tar.gz")
sha256sums=('b9572bc1c87012cb67b4898e9b3f50a6489e578228f6fc7cca34d65bdc6999ae')

build() {
    cd "$srcdir/pypacker-v$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/pypacker-v$pkgver"
    python -m installer \
        --destdir="$pkgdir" \
        --prefix=/usr \
        --compile-bytecode=1 \
        dist/*.whl
}

# vim: set ts=4 sw=4 et :
