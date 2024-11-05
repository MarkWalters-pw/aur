# Maintainer: BlackFuffey ethanthecomputerman@gmail.com
pkgname=cd-memo
pkgver=oct2024v2
pkgrel=2
pkgdesc="Enhanced cd that memorizes your working directory across sessions"
arch=('any')
url="https://github.com/BlackFuffey/cd-memo"
license=('MIT')
depends=('bash')
source=("cd-memo" "cd-memo-init" "README.md" "LICENSE")

package() {
    install -Dm755 "$srcdir/cd-memo" "$pkgdir/usr/bin/cd-memo"
    install -Dm755 "$srcdir/cd-memo-init" "$pkgdir/usr/bin/cd-memo-init"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('b53b55f875f6fb6b55ebaa6e3e73657bf12afdc977cf0f926a3c8599c3f5b8be'
            '4379a09710887ce325f0f2c11aa058e733f9faa67f0fe57cc00f3b9f5856ae62'
            '59355db27186175739db9acd05a49f52b60aa5d04039eb14abd73eded6471ab2'
            'b8c42f6ef4fa7552a40d029fa9e58eadf12090642febb21db1b47a13cca09f01')
