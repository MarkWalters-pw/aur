_pipname=dj_settings
pkgname="python-${_pipname//_/-}"
pkgver=5.0.0
pkgrel=1
pkgdesc="Settings manager and configuration parser"
arch=('any')
url="https://github.com/spapanik/dj_settings"
license=('LGPL3')
depends=('python-yaml')
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('deaa5171bd652512620982c199bebcc9d1dbdeff4d08dfe167ca9797713c9ff6')

build() {
	cd "${srcdir}"/${_pipname}-${pkgver}
	ls -la
	python setup.py build
}

package() {
	echo "https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz"
	cd "${srcdir}"/${_pipname}-${pkgver}
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
