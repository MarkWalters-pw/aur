# Maintainer: Adrian <adrianjohn824@gmail.com>
# Contributor: Adrian <adrianjohn824@gmail.com>

pkgname=etwas
_pkgname=etwas
pkgver=1.0.0
pkgrel=1
pkgdesc="It is the complete opposite of nix aka. a simple to use package per shell manager"
arch=('any')
url="https://github.com/AdrisGithub/${_pkgname}"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('bash' 'yay')
makedepends=('git')
source=("$pkgname::git+https://github.com/AdrisGithub/etwas.git")
md5sums=('SKIP')

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/etwas/LICENSE.md"
}