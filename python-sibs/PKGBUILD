pkgname='python-sibs'
_module='sibs-build'
_src_folder='sibs_build-0.1.2'
pkgver='0.1.2'
pkgrel=1
pkgdesc="A simple integrated build system"
url="https://github.com/wk1093/sibs"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/24/85/7d06dd084f2ff857c57807a03fbbcdb9a75701171c154c9e5ab41b72f408/sibs_build-0.1.2.tar.gz")
sha256sums=('80ebb764cc44c8bad3ab5ccbbd5b64ef8f181ef9acdb11da5d7b17ab87434977')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
