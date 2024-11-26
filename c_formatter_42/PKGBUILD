# Maintainer: Philipp Nowak <nowak dot philipp97 at gmail dot com>
pkgname=c_formatter_42
pkgver=0.2.7
pkgrel=1
pkgdesc="C formatter for 42 norminette"
arch=('x86_64')
url="https://github.com/dawnbeen/c_formatter_42"
license=('GPL')
depends=('python>=3.8' 'python-setuptools' 'gcc-libs' 'zlib' 'glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dawnbeen/c_formatter_42/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('f1c08c7d6a3f52e6d830602424a714df4cec3e49e2d4bf5544f43d6a805e8ce0fe767c9ab72967286da10007ba712f734e5e30906568561b6e56a861052de3e1')
options=(!debug)	# To prevent debug package

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
