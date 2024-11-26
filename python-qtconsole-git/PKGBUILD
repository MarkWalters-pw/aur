# Maintainer: Philipp A. <flying-sheep@web.de>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-qtconsole-git
pkgver=5.1.0.dev0.1730.cf34d5a
pkgrel=1
pkgdesc='Qt-based console for Jupyter with support for rich media output'
arch=(any)
url='https://pypi.python.org/pypi/qtconsole'
license=(BSD)
depends=(
	python-traitlets
	python-jupyter-core
	python-jupyter-client
	python-pygments
	python-ipykernel
	python-qtpy
	python-pyzmq
	python-packaging
	sip
)
optdepends=(
	'qt5-svg: Use with Qt5'
	'qt6-svg: Use with Qt6'
)
conflicts=(python-qtconsole)
provides=(python-qtconsole)
makedepends=(python-setuptools)
source=("git+https://github.com/jupyter/qtconsole.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/qtconsole"
	printf "%s.%s.%s" \
		"$(python -c 'from qtconsole._version import __version__; print(__version__)')" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/qtconsole"
	python -m build --wheel --no-isolation
	# remove duplicate entrypoint script
	zip dist/*.whl -d "$(bsdtar tf dist/*.whl | grep /scripts/jupyter-qtconsole)"
}

package() {
	cd "$srcdir/qtconsole"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	
	cd examples
	# FS#47046 fix .desktop icon
	local _python3="$(readlink /usr/bin/python3)"
	sed -i "s|^Icon=.*$|Icon=/usr/lib/$_python3/site-packages/qtconsole/resources/icon/JupyterConsole.svg|" jupyter-qtconsole.desktop
	install -Dm644 jupyter-qtconsole.desktop "$pkgdir/usr/share/applications/jupyter-qtconsole.desktop"
}

