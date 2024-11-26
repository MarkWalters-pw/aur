# Maintainer: Ali Emre Gülcü <aliemreglc at gmail dot com>

pkgname=cgltf
pkgver=1.14
pkgrel=1
pkgdesc="Single-file/stb-style C glTF loader and writer"
arch=('any')
url="https://github.com/jkuhlmann/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('4c44ba4206e556b112c11aa0730f17d5')

package() {
  cd $pkgname-$pkgver
  mkdir -p $pkgdir/usr/include/$pkgname $pkgdir/usr/share/licenses/$pkgname
  install *.h $pkgdir/usr/include/$pkgname
  install LICENSE $pkgdir/usr/share/licenses/$pkgname
}
