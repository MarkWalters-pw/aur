# Maintainer: Michael Gerhaeuser <michael.gerhaeuser@gmail.com>
pkgname=lektor
_pkgname=Lektor
pkgver=3.3.11
pkgrel=1
pkgdesc="A static content management system."
arch=(any)
url="https://www.getlektor.com"
license=('BSD-3-Clause')
depends=(python python-pip
    python-requests python-babel python-flask python-watchdog
    python-click python-pyasn1 python-ndg-httpsclient
    python-mistune1 python-inifile python-exifread python-slugify
    python-filetype python-setuptools)
makedepends=(python-build python-installer python-wheel python-setuptools-scm)
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/L/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('7c1645643a3aa0a6c8e8c13534c348299387524bd4872ce45a2aca8778e6b5b2')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -Dm 644 LICENSE \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
sha256sums=('a6dff5eb54c3e0ed1b3ddb6ac540112391541178ae420a1c2a2704e55afe17aa')
