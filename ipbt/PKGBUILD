# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Shaw <puxx@mail.ustc.edu.cn>
# Contributor: Nick <iglu.sitar at gmail dot com>
# Contributor: Angus Gibson <darthshrine@gmail.com>

pkgname=ipbt
pkgver=20240909.a852474
pkgrel=1
pkgdesc='A high-tech ttyrec player'
arch=('x86_64')
url="https://www.chiark.greenend.org.uk/~sgtatham/${pkgname}"
license=('MIT')
depends=('ncurses' 'perl')
makedepends=('cmake')
source=("${url}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.patch")
sha256sums=('89d95b6c806461ac0dc2096732e266dfb288d08cd8cbe68df83cea9fe0895bfe'
            '799d198e16f56e7575e761ec68cbd0e17334cf7ac9790439b7ae7115f84d554f')

prepare() {
  patch -p0 -i ../${pkgname}.patch
}

build() {
  cd "${pkgname}-${pkgver}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr . 
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 ipbt "${pkgdir}/usr/bin/ipbt"
  install -Dm755 ttydump "${pkgdir}/usr/bin/ttydump"
  install -Dm755 ttygrep "${pkgdir}/usr/bin/ttygrep"
  install -Dm644 ipbt.1 "${pkgdir}/usr/share/man/man1/ipbt.1"
  install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}

