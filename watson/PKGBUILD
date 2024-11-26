# Maintainer: Miodrag Tokić

pkgname=watson
pkgver=2.1.0
pkgrel=4
pkgdesc='A wonderful CLI to track your time!'
arch=('any')
url='https://jazzband.github.io/Watson/'
license=('MIT')
depends=(
    'python'
    'python-arrow'
    'python-click'
    'python-click-didyoumean'
    'python-requests'
)
makedepends=(
    'python-setuptools'
    'python-build'
    'python-installer'
    'python-wheel'
)
options=(!emptydirs)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/jazzband/Watson/archive/$pkgver.tar.gz"
    'watson.completion.patch'
    'watson.zsh-completion.patch'
)
sha256sums=(
    'ba0d23a1437e022f7d331c5a5923e24b3996099a4e140edeb5785f992e0b705b'
    'caf2d2e95e5fd82a3e9075a78a9f516b126b00a30655ef9802cd976dca50cda6'
    'dcdbd820d157fe79798ad0c33e81dc1edb6052894f8eb47d0429f5d949972f26'
)

build() {
    cd "$srcdir/Watson-$pkgver"

    patch -N -p1 -i "$srcdir/watson.completion.patch"
    patch -N -p1 -i "$srcdir/watson.zsh-completion.patch"

    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/Watson-$pkgver"

    install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m 644 watson.completion "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -D -m 644 watson.zsh-completion "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    install -D -m 644 watson.fish "$pkgdir/usr/share/fish/completions/$pkgname.fish"

    python -m installer --destdir="$pkgdir" dist/*.whl
}
