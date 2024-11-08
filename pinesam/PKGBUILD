# Maintainer: Khorne <khorne AT khorne DOT me>
# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
_gitname='PineSAM'
_githost='github.com'
_gituser='builder555'
pkgname=pinesam
pkgver=2.2.6
pkgrel=4
arch=(
  i686
  x86_64
  armv7h
  aarch64
)
pkgdesc="Configure and watch Pine64's 'pinecil' soldering iron via Bloetooth."
url="https://${_githost}/${_gituser}/${_gitname}"
license=('MIT')
depends=(
  'bash'
  'electron'
  'faketty'
  'nodejs'
  'python>=3'
  'python-bleak'
  'python-requests'
  'python-websockets'
  'python-pinecil'
  # 'python-pipenv'
)
makedepends=(
  'base-devel'
  'git'
  'npm'
)
optdepends=(
  "python-pip:    For /usr/lib/pinesam/backend/check_install.py"
  "python-pytest: For /usr/lib/pinesam/backend/{test_server,test_pinecil}.py"
)

install="${pkgname}.install"
source=(
  "${pkgname}-${pkgver}.zip"::"https://github.com/builder555/PineSAM/releases/download/v${pkgver}/PineSAM-Source-all-v${pkgver}.zip"
  'pinesam.sh'
  "${install}"
)
sha256sums=('52d711320a973ef1e042393e6166ca2ec232e95d33b3e31f175a2fb110925eca'
            '30caf8890fb9f6cc1811c794ad4129eccbc4871191aca1114f98d006ee2f3df4'
            'f87aeea8d1159f97a501946019e8ed5fcf3a0da74c8163debffa05b820f5ef1b')

prepare() {
  git log > "${srcdir}/git.log"

  cd ui
  msg2 "Preparing node dependencies ..."
  npm install --cache "${srcdir}/npm-cache"
}

build() {
  msg2 "Adding shabeng line to the backend server main script ..."
  sed -i '1i#!/usr/bin/python3' 'backend/main.py'
  sed -i 's/max_levels=3/max_levels=5/' 'backend/io_utils.py'

  cd ui
  msg2 "Downloading node dependencies ..."
  npm run --cache "${srcdir}/npm-cache" build
}

package() {
  install -Dvm644 'version.txt' "${pkgdir}/usr/lib/${_pkgname}/version.txt"
  install -dvm755 "${pkgdir}/usr/lib/${pkgname}/backend"
  for _file in backend/*; do
    _target="$(basename "${_file}")"
    install -Dvm644 "${_file}" "${pkgdir}/usr/lib/${pkgname}/backend/${_target}"
  done
  chmod 755 "${pkgdir}/usr/lib/${pkgname}/backend/main.py"
  cp -rv ui "${pkgdir}/usr/lib/${pkgname}/ui"
  install -Dvm755 "${srcdir}/pinesam.sh" "${pkgdir}/usr/bin/pinesam"

  # vite wants to create and write into '/usr/lib/pinesam/ui/node_modules/.vite'. Do on runtime create that directory in '/run', and already now create the corresponding symlink:
  ln -sv "/tmp/pinesam/.vite" "${pkgdir}/usr/lib/${pkgname}/ui/node_modules/.vite"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/docs"
  cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/docs"
  install -D -m644 "${srcdir}/git.log" "${pkgdir}/usr/share/doc/${pkgname}/git.log"

  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
