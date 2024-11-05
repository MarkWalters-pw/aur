# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Jonas Witschel <diabonas@archlinux.org>

pkgname=python-matrix-nio
pkgver=0.25.2
pkgrel=1
pkgdesc="Python Matrix client library, designed according to sans I/O principles"
arch=("any")
url="https://github.com/matrix-nio/matrix-nio"
license=("ISC")
depends=('python'
         'python-aiohttp'
         'python-aiofiles'
         'python-h11'
         'python-h2'
         'python-jsonschema'
         'python-unpaddedbase64'
         'python-pycryptodome'
         'python-aiohttp-socks')
makedepends=('python-build'
             'python-installer'
             'python-sphinx'
             'python-setuptools'
             'python-wheel'
             'tar'
             'python-poetry-core')
checkdepends=('python-aioresponses'
              'python-hpack'
              'python-hyperframe'
              'python-hypothesis'
              'python-faker'
              'mypy'
              'python-mypy_extensions'
              'pre-commit'
              'python-pytest'
              'python-pytest-asyncio'
              'python-pytest-aiohttp'
              'python-pytest-benchmark'
              'python-pytest-cov'
              'python-atomicwrites'
              'python-cachetools'
              'python-peewee'
              'python-olm')
optdepends=('python-atomicwrites: end-to-end encryption support'
            'python-cachetools: end-to-end encryption support'
            'python-peewee: end-to-end encryption support'
            'python-olm: end-to-end encryption support')
changelog="CHANGELOG.md"
source=("$pkgname-$pkgver.tar.gz::https://api.github.com/repos/${pkgname#python-}/${pkgname#python-}/tarball/refs/tags/$pkgver")
b2sums=('f634d12f0d7e3325a1a8fae1bcc5346caa98009b5766049502daf0113ef8bf9e27a99207e12af80232c9837cae62ba4003a9d30a67929d4dabb8d89937894f60')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname-$pkgver"
    PYTHONPATH="$PWD/src" python -m pytest --benchmark-disable
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 README.md -t "$pkgdir/usr/share/$pkgname/"
    install -vDm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
