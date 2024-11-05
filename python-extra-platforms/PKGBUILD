# Maintainer: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=python-extra-platforms
_name=${pkgname#python-}
pkgver=1.3.1
pkgrel=3
pkgdesc='Detect platforms and group them by family'
url='https://kdeldycke.github.io/extra-platforms/'
makedepends=(uv)
depends=(python python-boltons python-distro)
checkdepends=(python-pytest python-pytest-cov python-pytest-randomly)
license=('GPL2')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('afefd17158a16c8f70917b949b17bbf254af7c7965e7acfcfd9523d13679922d8d9850a749b39be1a7b84abea0c7518d2ff9fc971f00898cc15fbe4e482067ed')

build() {
    cd "$srcdir/$_name-$pkgver"
    uv build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    uv pip install --system --link-mode=copy --no-deps --prefix="$pkgdir/usr" dist/*.whl
    rm "$pkgdir/usr/.lock"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" license
}
