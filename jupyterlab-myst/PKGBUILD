# Maintainer: Phil A. <flying-sheep@web.de>
# Contributor: Anthony Wang <ta180m@gmail.com>
pkgname=jupyterlab-myst
pkgver=2.4.2
pkgrel=1
pkgdesc='Use MyST in JupyterLab'
arch=(any)
url=https://github.com/executablebooks/$pkgname
license=(BSD)
depends=(jupyter-server)
makedepends=(
	# build
	python-build
	python-hatchling
	jupyterlab  # jlpm
	python-hatch-jupyter-builder
	python-hatch-nodejs-version
	nodejs
	# package
	python-installer
)
provides=(python-jupyterlab-myst)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d50cab8e5e1a24710c490bb0898f1c6da2dcdeaed5dfa6691cb0f9f2fe45904e')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	mv "$pkgdir"/{usr/,}etc
}
