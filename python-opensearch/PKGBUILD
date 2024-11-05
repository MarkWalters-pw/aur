# Maintainer: Silvan Gümüsdere <silvan@trollbox.org>

pkgname=python-opensearch
_name=opensearch-py
_alt_name=opensearch_py
pkgver=2.7.1
pkgrel=2
pkgdesc='Python Client for OpenSearch'
arch=('any')
url='https://github.com/opensearch-project/opensearch-py'
license=('Apache-2.0')
depends=('python-urllib3' 'python-requests' 'python-dateutil' 'python-certifi' 'python-events')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_alt_name}-${pkgver}.tar.gz")
sha256sums=('67ab76e9373669bc71da417096df59827c08369ac3795d5438c9a8be21cbd759')

build() {
    cd "${_alt_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_alt_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

