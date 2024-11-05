# Maintainer: Jiri Pospisil <jiri@jpospisil.com>

pkgname=pkl
pkgver=0.26.3
pkgrel=1
pkgdesc='A configuration as code language with rich validation and tooling.'
arch=('x86_64')
url='https://pkl-lang.org'
license=('Apache')
depends=('glibc' 'zlib')
makedepends=('jdk-openjdk' 'git')
changelog=CHANGELOG
source=("https://github.com/apple/pkl/archive/refs/tags/$pkgver.tar.gz")
b2sums=('41aee54b5d39a7c01ba7bf7944132b92a6e239660959ecb65058d57f350a7852c3e914d80fe338e85354feb2ec59c05b66646c653e8599a76ed2e014e79087d9')

build() {
  cd "$srcdir/pkl-$pkgver"
  ./gradlew --info --stacktrace -DreleaseBuild=true pkl-cli:linuxExecutableAmd64
}

package() {
  cd "$srcdir/pkl-$pkgver"
  install -Dm755 "pkl-cli/build/executable/pkl-linux-amd64" "$pkgdir/usr/bin/pkl"
}
