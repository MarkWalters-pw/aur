_name=pyjnius
pkgname=python-$_name
pkgver=1.6.1
pkgrel=1
pkgdesc='Python module to access Java class as Python class, using JNI.'
arch=(any)
url="https://github.com/kivy/$_name"
license=(MIT)
depends=(python java-environment python-six)
makedepends=(cython python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d2a7ece6ed79bf1d7f97a4f6d61302d9f1d7652182a3e4c8a69dbaef31396e60')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}
