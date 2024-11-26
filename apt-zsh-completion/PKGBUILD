# Maintainer: Heptazhou <zhou at 0h7z dot com>

pkgname=apt-zsh-completion
pkgver=5.9
pkgrel=1
pkgdesc="Zsh completion for apt and dpkg"
arch=("any")
url="https://zsh.org/"
license=("custom")
depends=("zsh")
options=(!debug)
source=("$pkgname@zsh-v$pkgver.tar.xz::${url%/}/pub/zsh-$pkgver.tar.xz")
sha256sums=("9b8d1ecedd5b5e81fbf1918e876752a7dd948e05c1a0dba10ab863842d45acd5")

package() {
	cd -- "$srcdir/zsh-$pkgver/"
	install -Dm644 -t "$pkgdir/usr/share/zsh/site-functions/" Completion/Debian/{Command/_{apt,dpkg},Type/_deb_{file,package}s}
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE"
}

build() {
	cd -- "$srcdir/zsh-$pkgver/"
	mv -f "LICENCE" "LICENSE"
}

# https://gitlab.archlinux.org/archlinux/packaging/packages/zsh
sha512sums=("d9138b7f379ad942a5f46819d2dd52d31f3a1129f2a0d1b53d4c5cd43c318b60396da6d37c57c477b8e958fb750209aca0ae93f8c9dd42ac958de006a0ff067e")
