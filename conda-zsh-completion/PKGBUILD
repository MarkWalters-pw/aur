# Maintainer: Heptazhou <zhou at 0h7z dot com>

pkgname=conda-zsh-completion
pkgver=0.11
pkgrel=1
pkgdesc="Zsh completion for conda, mamba, and micromamba"
arch=("any")
url="https://github.com/conda-incubator/$pkgname"
license=("custom")
depends=("zsh" "python")
options=(!debug)
source=("$pkgname-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("584d5817e276f01f5d789e01ba5c6688667b38d3c9f4ad2cd735a9901e27aa33")

package() {
	cd -- "$srcdir/$pkgname-$pkgver/"
	install -Dm644 -t "$pkgdir/usr/share/zsh/site-functions/" "_conda"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE"
}

build() {
	cd -- "$srcdir/$pkgname-$pkgver/"
	mv -f "LICENSE"{.txt,}
}
