# Maintainer: Jiri Pospisil <jiri@jpospisil.com>

pkgname=marcel
pkgver=0.28.1
pkgrel=1
pkgdesc='A modern shell'
url='https://github.com/geophile/marcel'
source=("https://github.com/geophile/marcel/archive/refs/tags/v$pkgver.tar.gz")
arch=('any')
depends=('python' 'python-dill' 'python-psutil')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
license=('GPL-3.0-only')
b2sums=('7c014061853f6e06ed71edb2a351fa06940d4bc3f7011fe99892b7be31bf0cf81e0d5168e042632a4da5b3827c643aa9927ce9afb61662046a94cdd544bc7b0a')

prepare() {
  cd marcel-"$pkgver"
  rm -rf 'test'
}

build() {
  cd marcel-"$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd marcel-"$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
