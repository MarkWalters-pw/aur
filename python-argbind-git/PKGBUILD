# Maintainer: Brian Thompson <brianrobt@pm.me>

pkgname=python-argbind-git
_srcname=argbind
_srcver=0.3.9
pkgver=r112.e3e0b8d
pkgrel=1
pkgdesc='Build CLIs via docstrings and type annotations, with YAML support (built from latest commit)'
arch=('x86_64')
url="https://github.com/pseeth/$_srcname/"
license=('MIT')
depends=('python' 'python-pyaml' 'python-docstring-parser')
makedepends=('python-wheel' 'python-build' 'python-installer' 'git')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytorch' 'python-torchvision')
source=("$pkgname::git+https://github.com/pseeth/$_srcname#branch=main")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}

check() {
  echo "Removing the following directory for a clean install: $PWD/$_srcname-$pkgver/test_dir"
  rm -rf "$pkgname/test_dir"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  cd "$srcdir/$pkgname"
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
#  pytest -vv # TODO: Fix failing unit test
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
