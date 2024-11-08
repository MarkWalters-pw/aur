# Maintainer : fft
# Contributor : pianoslum <pianoslum@mailbox.org>
# Contributor : Florent H. CARRÉ<colundrum@users.noreply.github.com>

pkgname=gprof2dot
pkgver=2024.06.06
pkgrel=1
pkgdesc='A Python script to convert the output from many profilers into a dot graph.'
arch=('any')
url='https://github.com/jrfonseca/gprof2dot/'
license=('LGPL-3.0-only')
depends=('python' 'graphviz')
makedepends=('python-setuptools')
provides=(gprof2dot)
source=("https://github.com/jrfonseca/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c9a746c2883cbe643535204ab8464a826f1cc7ddcdde7052186b10d99e79e285')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir"
}
