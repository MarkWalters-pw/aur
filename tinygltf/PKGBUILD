# Maintainer: Ali Emre Gülcü <aliemreglc at gmail dot com>
# Update PKGSums: updpkgsums
# Update SRCINFO: makepkg --printsrcinfo > .SRCINFO

pkgname=tinygltf
pkgver=2.9.2
pkgrel=1
pkgdesc="Header only C++ tiny glTF library(loader/saver)"
arch=('any')
url="https://github.com/syoyo/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b34d1456bb1d63bbb4e05ea1e4d8691d0253a03ef72385a8bffd2fae4b743feb')

package() {
  cd $pkgname-$pkgver
  mkdir -p $pkgdir/usr/include/$pkgname $pkgdir/usr/share/licenses/$pkgname
  install *.h $pkgdir/usr/include/$pkgname
  install *.hpp $pkgdir/usr/include/$pkgname
  install LICENSE $pkgdir/usr/share/licenses/$pkgname
}
