# Maintainer: Perkelo <alessandro [dot] scala [eight] [at] gmail [dot] com>

pkgname="vim-colors-xcode-git"
pkgver=r131.0ab58f6
pkgrel=1
pkgdesc="XCode color theme for vim"
arch=("any")
url="https://github.com/lunacookies/vim-colors-xcode"
license=('ISC')
depends=('vim')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
optdepends=()
source=("${pkgname%-git}::git+${url}.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
    
    VIMFILES_DIR="$pkgdir/usr/share/vim/vimfiles"
    install -d "$VIMFILES_DIR"

    cp -R "colors" "$VIMFILES_DIR/colors"
    cp -R "autoload" "$VIMFILES_DIR/autoload"
    cp -R "doc" "$VIMFILES_DIR/doc"

	LICENSE_DIR="$pkgdir/usr/share/licenses/$pkgname"
	install -d "$LICENSE_DIR"
	cp LICENSE "$LICENSE_DIR/LICENSE"
}
