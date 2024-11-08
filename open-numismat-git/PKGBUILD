# Maintainer: fft

pkgname=open-numismat-git
tag_ver=1.9.10
pkgver=1.9.10.r19.g32b032e9
pkgrel=1
pkgdesc='Application to create, organize and manage coin catalogue'
arch=('any')
url="https://opennumismat.github.io/open-numismat/"
license=('GPL-3.0-only')
makedepends=('git' 'python-setuptools')
depends=('pyside6' 'python-dateutil' 'python-jinja' 'python-imagehash' 'python-lxml' 'python-numpy' 'python-opencv' 'python-openpyxl' 'python-pillow' 'python-zxing-cpp-bin' 'qt6-charts')
source=("${pkgname}::git+https://github.com/OpenNumismat/open-numismat.git#branch=master"
        "https://github.com/OpenNumismat/YearCalculator.git"
        "https://github.com/OpenNumismat/open-numismat/releases/download/${tag_ver}/open-numismat_${tag_ver}_all.deb")
sha256sums=('SKIP'
            'SKIP'
            'afb640a9d93464b85a6e4cdf9ea28c3d726a672cb610ebd2821966ec100d3521')

pkgver() {
  cd ${pkgname}
  git describe --long --tags --match='[1-9]*' | sed 's/-/.r/;s/-/./'
}

prepare() {
  cd ${pkgname}
  git submodule init
  git submodule update
}

build() {
  #extract private_keys.py from .deb package to ${srcdir}
  ar x "${srcdir}/open-numismat_${tag_ver}_all.deb" 'data.tar.zst'
  tar -xf './data.tar.zst' './opt/venvs/open-numismat/lib/python3.10/site-packages/OpenNumismat/private_keys.py'
  mv './opt/venvs/open-numismat/lib/python3.10/site-packages/OpenNumismat/private_keys.py' './'

  cd "${pkgname}/tools"
  python build_resources.py
  cd ..
  python setup.py build
}

package() {
  cd ${pkgname}
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  local site_packages_dir=$(python -c "import site; print(site.getsitepackages()[0])")
  mv "${srcdir}/private_keys.py" "${pkgdir}/${site_packages_dir}/OpenNumismat/"
}
