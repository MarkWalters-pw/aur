# Maintainer: Lex Black <autumn-wind at web dot de>

_name=mem_top
pkgname=python-mem_top
pkgver=0.2.1
pkgrel=2
_commit="002f0b17d6e6e97e871fe43448939ce5eaba6afe"
arch=('any')
pkgdesc="Shows top suspects for memory leaks in your Python program"
url="https://pypi.python.org/pypi/mem_top"
license=("MIT")
depends=('python')
makedepends=('git' 'python-setuptools')
source=(git+https://github.com/denis-ryzhkov/mem_top#commit=$_commit)
md5sums=('b4daf50bc87416b36f6156b789c595e2')


package() {
  cd ${_name}
  python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
